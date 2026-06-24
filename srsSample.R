#' Simple Random Sampling
#'
#' Draw a simple random sample.
#'
#' @param data Data frame.
#' @param n Sample size.
#'
#' @return A sampled data frame.
#' @export

srsSample <- function(data, n) {
  data[sample(nrow(data), n), ]
}
