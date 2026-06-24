#' QQ Plot for GWAS
#'
#' Create QQ plot from GWAS results.
#'
#' @param results GWAS results.
#'
#' @return QQ plot.
#'
#' @examples
#' data(gwas_data)
#' res <- standardGWAS(gwas_data)
#' rssQQ(res)
#'
#' @export

rssQQ <- function(results){

  if(!"Pvalue" %in% names(results))
    stop("Pvalue column missing")

  qqman::qq(
    results$Pvalue,
    main = "RankGWASK QQ Plot"
  )
}
