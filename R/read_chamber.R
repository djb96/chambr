
#' Read Data from the WACL Chamber
#'
#' Reads data from the WACL chamber into R, fixing column names and data
#' types. There will likely be parsing warnings - this is to be expected
#' and nothing to worry about. It is due to the files being flanked by
#' incomplete data with fewer columns.
#'
#' @param file The path to the file.
#'
#' @return
#' @export
#'

read_chamber <- function(file) {

  # Find the line at which the data actually starts
  start <- dplyr::tibble(text = readr::read_lines(file)) %>%
    dplyr::mutate(n = dplyr::row_number()) %>%
    dplyr::filter(stringr::str_detect(text, "MODE")) %>%
    dplyr::pull(n) %>%
    min()

  # Read in the data, providing column names
  df_raw <- readr::read_csv(file,
    skip = start - 1,
    show_col_types = FALSE,
    col_names = c(
      "time", "state", "alarms", "temp_c",
      "emi_fa", "trap_v", "pump_percent",
      "charger_i_uA", "charger_u_v", "bat_mv",
      "conc_fa", "conc_ugm3"
    )
  )

  df <- df_raw %>%
    # time and mode are read in incorrectly - fix this here
    tidyr::separate(time, into = c("time", "mode"), sep = 20) %>%
    # fix data types
    dplyr::mutate(
      time = lubridate::dmy_hms(time, quiet = T),
      mode = stringr::str_remove(mode, "MODE"),
      state = stringr::str_remove(state, "STATE"),
      dplyr::across(alarms:conc_ugm3, readr::parse_number),
      dplyr::across(where(is.character), stringr::str_trim)
    ) %>%
    # this step should get rid of the tail of the data
    tidyr::drop_na(time)

  return(df)
}
