tally_ballots <- function(election, options) {
  ballots <- election$ballots
  candidates <- election$candidates
  if (length(ballots) == 0L) {
    return(list(kept = list(), rounds = list()))
  }

  kept <- lapply(ballots, function(ballot) {
    ballot[seq_len(min(length(ballot), options$limit))]
  })
  active <- sort(candidates, method = "radix")
  rounds <- list()

  while (length(active) > 0L) {
    votes <- setNames(numeric(length(active)), active)
    for (ballot in kept) {
      continuing <- ballot[ballot %in% active]
      if (length(continuing) > 0L) {
        candidate <- continuing[[1L]]
        votes[[candidate]] <- votes[[candidate]] + 1
      }
    }

    total <- sum(votes)
    majority <- which(2 * votes > total)
    if (length(majority) > 0L) {
      winner <- names(votes)[majority[[1L]]]
      rounds[[length(rounds) + 1L]] <- list(
        total = total,
        votes = votes,
        winner = winner,
        eliminated = NULL
      )
      break
    }

    minimum <- min(votes)
    tied <- names(votes)[votes == minimum]
    tied <- sort(tied, method = "radix")
    eliminated <- if (identical(options$tie, "high")) {
      tied[[length(tied)]]
    } else {
      tied[[1L]]
    }
    rounds[[length(rounds) + 1L]] <- list(
      total = total,
      votes = votes,
      winner = NULL,
      eliminated = eliminated
    )
    active <- active[active != eliminated]
  }

  list(kept = kept, rounds = rounds)
}
