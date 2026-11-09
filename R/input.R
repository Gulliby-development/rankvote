input_lines <- function(input) {
  if (identical(input, "")) {
    return(character(0))
  }

  newline_positions <- gregexpr("\n", input, fixed = TRUE)[[1L]]
  newline_positions <- newline_positions[newline_positions > 0L]
  input_length <- nchar(input, type = "bytes")
  line_count <- length(newline_positions) +
    as.integer(length(newline_positions) == 0L || tail(newline_positions, 1L) < input_length)
  if (line_count == 0L) {
    return(character(0))
  }

  starts <- c(1L, newline_positions + 1L)
  ends <- c(newline_positions - 1L, input_length)
  starts <- starts[seq_len(line_count)]
  ends <- ends[seq_len(line_count)]
  vapply(seq_len(line_count), function(index) {
    if (starts[[index]] > ends[[index]]) {
      ""
    } else {
      substr(input, starts[[index]], ends[[index]])
    }
  }, character(1L), USE.NAMES = FALSE)
}

split_ballot_words <- function(line) {
  trimmed <- sub("^[ \t]+", "", line)
  trimmed <- sub("[ \t]+$", "", trimmed)
  if (identical(trimmed, "")) {
    return(character(0))
  }
  strsplit(trimmed, "[ \t]+", perl = TRUE)[[1L]]
}

read_ballots <- function(input) {
  lines <- input_lines(input)
  if (length(lines) > max_lines) {
    fail(1L, "input is too long (max 40 lines)")
  }

  ballots <- list()
  candidates <- character(0)
  for (line_number in seq_along(lines)) {
    line <- lines[[line_number]]
    if (endsWith(line, "\r")) {
      line <- substr(line, 1L, nchar(line, type = "bytes") - 1L)
    }
    words <- split_ballot_words(line)
    if (length(words) == 0L || startsWith(words[[1L]], "#")) {
      next
    }

    seen_on_ballot <- character(0)
    for (word in words) {
      if (!grepl("^[a-z][a-z0-9_]{0,7}$", word, perl = TRUE)) {
        fail(1L, paste0("line ", line_number, ": bad name ", word))
      }
      if (word %in% seen_on_ballot) {
        fail(1L, paste0("line ", line_number, ": ", word, " is ranked twice"))
      }
      seen_on_ballot <- c(seen_on_ballot, word)
      if (!(word %in% candidates)) {
        if (length(candidates) >= max_candidates) {
          fail(1L, paste0("line ", line_number, ": too many candidates (max 9)"))
        }
        candidates <- c(candidates, word)
      }
    }
    ballots[[length(ballots) + 1L]] <- words
  }

  list(ballots = ballots, candidates = sort(candidates, method = "radix"))
}
