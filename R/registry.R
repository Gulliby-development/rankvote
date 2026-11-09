rankvote_version <- "0.1.0"
default_limit <- 9L
max_limit <- 9L
max_lines <- 40L
max_candidates <- 9L
tie_values <- c("low", "high")

usage_text <- paste0(
  "usage: rankvote count [--tie WHICH] [--limit N]\n",
  "       rankvote rounds [--tie WHICH] [--limit N]\n",
  "       rankvote stats [--tie WHICH] [--limit N]\n",
  "       rankvote check [--tie WHICH] [--limit N]\n"
)

# One entry per command: its word and the function that runs it.
command_table <- list(
  list(name = "count", handler = "count_command"),
  list(name = "rounds", handler = "rounds_command"),
  list(name = "stats", handler = "stats_command"),
  list(name = "check", handler = "check_command")
)

# A failure that ends the command: status 1 for the input, 2 for the command line.
fail <- function(status, message) {
  stop(structure(
    class = c("rankvote_failure", "error", "condition"),
    list(message = message, call = NULL, status = status)
  ))
}

reply <- function(status, out, err) {
  list(status = status, out = out, err = err)
}
