#' Compare RSS and SRS GWAS
#'
#' Compare top SNPs identified using RSS and SRS.
#'
#' @param data Dataset.
#' @param phenotype Phenotype variable.
#' @param ranking Ranking variable.
#' @param set.size RSS set size.
#'
#' @return A list of GWAS results.
#'
#' @examples
#' data(gwas_data)
#' comp <- compareRSSvsSRS(gwas_data)
#'
#' @export

compareRSSvsSRS <- function(data,
                            phenotype = "Yield",
                            ranking = "PlantHeight",
                            set.size = 5){

  rss_results <- rssGWAS(
    data = data,
    phenotype = phenotype,
    ranking = ranking,
    set.size = set.size
  )

  srs_results <- standardGWAS(
    data = data,
    phenotype = phenotype
  )

  list(
    RSS = rss_results,
    SRS = srs_results
  )
}
