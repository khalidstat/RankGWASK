#' Simulate GWAS Data
#'
#' Generate simulated GWAS genotype and phenotype data.
#'
#' @param n Number of individuals.
#' @param nSNP Number of SNP markers.
#' @param seed Random seed.
#'
#' @return A data frame containing simulated SNP markers,
#' phenotype values and ranking variable.
#'
#' @examples
#' sim <- simulateGWAS()
#' head(sim)
#'
#' @export
#' @importFrom stats rnorm

simulateGWAS <- function(
    n = 500,
    nSNP = 100,
    seed = 123
) {

  set.seed(seed)

  geno <- matrix(
    sample(0:2,
           n * nSNP,
           replace = TRUE),
    nrow = n,
    ncol = nSNP
  )

  colnames(geno) <- paste0("SNP", 1:nSNP)

  geno <- as.data.frame(geno)

  yield <-
    5 +
    2 * geno$SNP5 +
    3 * geno$SNP20 +
    rnorm(n)

  plantheight <-
    yield +
    rnorm(n, sd = 2)

  data.frame(
    ID = 1:n,
    geno,
    Yield = yield,
    PlantHeight = plantheight
  )
}
