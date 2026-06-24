#' Manhattan Plot
#'
#' Create Manhattan plot from GWAS results.
#'
#' @param results Output from standardGWAS() or rssGWAS().
#'
#' @return Manhattan plot.
#'
#' @examples
#' data(gwas_data)
#' res <- standardGWAS(gwas_data)
#' rssManhattan(res)
#'
#' @export

rssManhattan <- function(results){

  if(!"Pvalue" %in% names(results))
    stop("Pvalue column missing")

  man_data <- data.frame(
    SNP = results$SNP,
    CHR = 1,
    BP = seq_len(nrow(results)),
    P = results$Pvalue
  )

  qqman::manhattan(
    man_data,
    chr = "CHR",
    bp = "BP",
    p = "P",
    snp = "SNP",
    main = "RankGWASK Manhattan Plot"
  )
}
