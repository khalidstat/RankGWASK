#' RSS-Based GWAS
#'
#' Perform GWAS after Ranked Set Sampling.
#'
#' @param data Dataset.
#' @param phenotype Phenotype column.
#' @param ranking Ranking variable.
#' @param set.size RSS set size.
#'
#' @return GWAS results.
#'
#' @examples
#' data(gwas_data)
#' res <- rssGWAS(
#'   gwas_data,
#'   phenotype = "Yield",
#'   ranking = "PlantHeight"
#' )
#'
#' @export

rssGWAS <- function(data,
                    phenotype = "Yield",
                    ranking = "PlantHeight",
                    set.size = 5){

  rss_data <- rssSample(
    data = data,
    ranking = ranking,
    set.size = set.size
  )

  standardGWAS(
    data = rss_data,
    phenotype = phenotype
  )
}
