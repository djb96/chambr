
#' Visualise Chamber Data
#'
#' To ensure that the chamber data has been read in correctly, this function
#' uses ggplot2 to visualise all of the numeric variables against time. There
#' is also an option to drop values that remained constant throughout.
#'
#' @param .data WACL chamber data read using read_chamber.
#' @param drop_constant Should constant variables be plotted? (T/F, defaults to F)
#'
#' @return
#' @export
#'

plot_chamber <- function(.data, drop_constant = F) {
  if (drop_constant) {
    .data <- janitor::remove_constant(dat = .data, quiet = T)
  }

  .data %>%
    tidyr::pivot_longer(where(is.numeric)) %>%
    ggplot2::ggplot(ggplot2::aes(x = time, y = value)) +
    ggplot2::geom_line() +
    ggplot2::facet_wrap(~name, scales = "free_y") +
    ggplot2::labs(x = NULL, y = NULL)
}
