interpret_cli <- function(args) {
  if (length(args) == 0L) {
    return(list(kind = "usage"))
  }

  command <- args[[1L]]
  if (command %in% c("help", "-h", "--help")) {
    return(list(kind = "help"))
  }
  if (identical(command, "--version")) {
    return(list(kind = "version"))
  }

  command_index <- which(vapply(command_table, function(entry) {
    identical(entry$name, command)
  }, logical(1L)))
  if (length(command_index) == 0L) {
    return(list(kind = "unknown", word = command))
  }

  options <- list(tie = "low", limit = default_limit)
  seen <- character(0)
  index <- 2L
  while (index <= length(args)) {
    word <- args[[index]]
    if (word %in% c("--tie", "--limit")) {
      option <- word
      if (option %in% seen) {
        fail(2L, paste0("given twice: ", option))
      }
      if (index == length(args)) {
        fail(2L, paste0("missing value for ", option))
      }
      value <- args[[index + 1L]]
      if (identical(option, "--tie")) {
        if (!(value %in% tie_values)) {
          fail(2L, "bad value for --tie")
        }
        options$tie <- value
      } else {
        if (!grepl("^[1-9]$", value)) {
          fail(2L, "bad value for --limit")
        }
        options$limit <- as.integer(value)
      }
      seen <- c(seen, option)
      index <- index + 2L
    } else {
      if (!startsWith(word, "-") || identical(word, "-")) {
        fail(2L, paste0("unexpected argument ", word))
      }
      fail(2L, paste0("unknown option ", word))
    }
  }

  list(kind = "command", command_index = command_index, options = options)
}

run_cli <- function(args, input) {
  tryCatch({
    interpretation <- interpret_cli(args)
    if (interpretation$kind == "usage") {
      return(reply(2L, "", usage_text))
    }
    if (interpretation$kind == "help") {
      return(reply(0L, usage_text, ""))
    }
    if (interpretation$kind == "version") {
      return(reply(0L, paste0("rankvote ", rankvote_version, "\n"), ""))
    }
    if (interpretation$kind == "unknown") {
      return(reply(2L, "", paste0("rankvote: unknown command ", interpretation$word, "\n")))
    }

    entry <- command_table[[interpretation$command_index]]
    handler <- get(entry$handler, mode = "function", inherits = TRUE)
    handler(interpretation$options, input)
  }, rankvote_failure = function(error) {
    reply(error$status, "", paste0("rankvote: ", conditionMessage(error), "\n"))
  })
}

reads_stdin <- function(args) {
  tryCatch({
    interpretation <- interpret_cli(args)
    identical(interpretation$kind, "command")
  }, rankvote_failure = function(error) {
    FALSE
  })
}
