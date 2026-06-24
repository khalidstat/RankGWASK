#' Standard GWAS Analysis
#'
#' Perform single-marker genome-wide association analysis using
#' linear regression.
#'
#' @importFrom stats lm
#'
#' @param data A data frame containing SNP markers and phenotype.
#' @param phenotype Character string specifying the phenotype column.
#'
#' @return A data frame containing SNP effects, standard errors,
#' and p-values sorted by significance.
#'
#' @examples
#' data(gwas_data)
#' res <- standardGWAS(
#'   gwas_data,
#'   phenotype = "Yield"
#' )
#'
#' head(res)
#'
#' @export

standardGWAS <- function(data,
                         phenotype = "Yield") {

  if (!is.data.frame(data)) {
    stop("data must be a data frame")
  }

  if (!phenotype %in% names(data)) {
    stop("phenotype column not found")
  }

  snps <- grep(
    "^SNP",
    names(data),
    value = TRUE
  )

  if (length(snps) == 0) {
    stop("No SNP columns found")
  }

  results <- lapply(snps, function(snp) {

    fit <- stats::lm(
      data[[phenotype]] ~ data[[snp]]
    )

    coef_table <- summary(fit)$coefficients

    data.frame(
      SNP = snp,
      Effect = coef_table[2, 1],
      SE = coef_table[2, 2],
      Pvalue = coef_table[2, 4],
      stringsAsFactors = FALSE
    )
  })

  results <- do.call(rbind, results)

  results <- results[
    order(results$Pvalue),
  ]

  rownames(results) <- NULL

  results
}
