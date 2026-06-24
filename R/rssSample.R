#' Ranked Set Sampling (RSS)
#'
#' Performs Ranked Set Sampling (RSS) by dividing data into sets,
#' ranking within sets, and selecting order statistics.
#'
#' @param data A data frame.
#' @param ranking Character string specifying ranking variable.
#' @param set.size Integer: number of units per set.
#' @param m Integer: number of cycles (default 1).
#' @param r Integer: number of repetitions (default 1).
#'
#' @return A data frame containing RSS selected observations.
#'
#' @examples
#' data(gwas_data)
#' rssSample(gwas_data, "PlantHeight", set.size = 5, m = 2, r = 1)
#'
#' @export
rssSample <- function(data,
                      ranking,
                      set.size = 5,
                      m = 1,
                      r = 1){

  if(!is.data.frame(data))
    stop("data must be a data frame")

  if(!ranking %in% names(data))
    stop("ranking variable not found")

  if(set.size < 2)
    stop("set.size must be >= 2")

  n <- nrow(data)

  results <- list()

  for(rep in 1:r){

    rep_result <- list()

    for(cycle in 1:m){

      # shuffle data for RSS realism
      shuffled <- data[sample(n), ]

      # split into sets
      groups <- split(shuffled, rep(1:ceiling(n/set.size), each = set.size, length.out = n))

      selected <- lapply(seq_along(groups), function(i){

        g <- groups[[i]]

        g <- g[order(g[[ranking]]), ]

        # RSS selection rule: pick ith order statistic cyclically
        pos <- ((i - 1) %% nrow(g)) + 1

        g[pos, , drop = FALSE]
      })

      rep_result[[cycle]] <- do.call(rbind, selected)
    }

    results[[rep]] <- do.call(rbind, rep_result)
  }

  final <- do.call(rbind, results)

  rownames(final) <- NULL
  return(final)
}
