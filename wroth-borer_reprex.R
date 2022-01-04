#' ---
#' output: reprex::reprex_document
#' ---


library(chambr)

dat = read_chamber("~/log_2021-11-27_12.53.29.txt")

head(dat)

plot_chamber(dat, drop_constant = T)
