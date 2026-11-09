report_check <- function(election) {
  ballot_count <- length(election$ballots)
  noun <- if (ballot_count == 1L) "ballot" else "ballots"
  paste0("ok ", ballot_count, " ", noun, "\n")
}

report_count <- function(result) {
  final_round <- result$rounds[[length(result$rounds)]]
  winner <- final_round$winner
  votes <- final_round$votes[[winner]]
  paste0(
    "winner ", winner, "\n",
    "votes ", votes, " of ", final_round$total, "\n",
    "rounds ", length(result$rounds), "\n"
  )
}

report_rounds <- function(result) {
  output <- character(0)
  for (round_number in seq_along(result$rounds)) {
    round <- result$rounds[[round_number]]
    output <- c(output, paste0("round ", round_number, " total ", round$total, "\n"))
    candidate_names <- names(round$votes)
    candidate_order <- order(
      -unname(round$votes),
      candidate_names,
      method = "radix"
    )
    for (candidate_index in candidate_order) {
      candidate <- candidate_names[[candidate_index]]
      output <- c(
        output,
        paste0(candidate, " ", round$votes[[candidate]], "\n")
      )
    }
    if (!is.null(round$winner)) {
      output <- c(output, paste0("winner ", round$winner, "\n"))
    } else {
      output <- c(output, paste0("eliminated ", round$eliminated, "\n"))
    }
  }
  paste0(output, collapse = "")
}

report_stats <- function(election, result) {
  ballot_count <- length(election$ballots)
  candidate_count <- length(election$candidates)
  kept_lengths <- if (length(result$kept) == 0L) {
    integer(0)
  } else {
    lengths(result$kept)
  }
  ranked_count <- sum(kept_lengths)
  longest <- if (length(kept_lengths) == 0L) 0L else max(kept_lengths)
  round_count <- length(result$rounds)
  exhausted <- if (round_count == 0L) {
    0L
  } else {
    ballot_count - result$rounds[[round_count]]$total
  }
  paste0(
    "ballots ", ballot_count, "\n",
    "candidates ", candidate_count, "\n",
    "ranked ", ranked_count, "\n",
    "longest ", longest, "\n",
    "exhausted ", exhausted, "\n",
    "rounds ", round_count, "\n"
  )
}
