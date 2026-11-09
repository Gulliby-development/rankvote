count_command <- function(options, input) {
  election <- read_ballots(input)
  if (length(election$ballots) == 0L) {
    fail(1L, "no ballots")
  }
  result <- tally_ballots(election, options)
  reply(0L, report_count(result), "")
}

rounds_command <- function(options, input) {
  election <- read_ballots(input)
  if (length(election$ballots) == 0L) {
    fail(1L, "no ballots")
  }
  result <- tally_ballots(election, options)
  reply(0L, report_rounds(result), "")
}

stats_command <- function(options, input) {
  election <- read_ballots(input)
  result <- tally_ballots(election, options)
  reply(0L, report_stats(election, result), "")
}

check_command <- function(options, input) {
  election <- read_ballots(input)
  reply(0L, report_check(election), "")
}
