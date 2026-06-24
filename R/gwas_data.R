#' Example GWAS Dataset
#'
#' Simulated genome-wide association study (GWAS) dataset containing
#' 500 individuals, 100 SNP markers, a Yield phenotype, and a
#' PlantHeight ranking variable.
#'
#' @format A data frame with 500 rows and 103 variables.
#'
#' The dataset contains:
#' \itemize{
#'   \item \strong{ID}: Individual identifier.
#'   \item \strong{SNP1-SNP100}: Genotype markers coded as 0, 1, or 2.
#'   \item \strong{Yield}: Quantitative phenotypic trait.
#'   \item \strong{PlantHeight}: Ranking variable used in Ranked Set Sampling (RSS).
#' }
#'
#' @details
#' This dataset was generated for illustrating Genome-Wide Association
#' Studies (GWAS) under Ranked Set Sampling (RSS) and Simple Random
#' Sampling (SRS) designs. SNP markers are coded as 0, 1, or 2,
#' representing genotype classes.
#'
#' @source Simulated data generated using \code{simulateGWAS()}.
#'
#' @examples
#' data(gwas_data)
#' dim(gwas_data)
#' names(gwas_data)[1:10]
"gwas_data"
