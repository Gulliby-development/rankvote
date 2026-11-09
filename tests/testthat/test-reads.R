rows <- list(
  list(c("check"), "", 1, "", ""),
  list(c("count"), "", 1, "", ""),
  list(c("rounds"), "", 1, "", ""),
  list(c("stats"), "", 1, "", ""),
  list(c("count", "--tie", "high"), "", 1, "", ""),
  list(c("count", "--limit", "9", "--tie", "low"), "", 1, "", ""),
  list(c("stats", "--limit", "1"), "", 1, "", ""),
  list(c("help"), "", 0, "", ""),
  list(c("-h"), "", 0, "", ""),
  list(c("--help"), "", 0, "", ""),
  list(c("--version"), "", 0, "", ""),
  list(character(0), "", 0, "", ""),
  list(c("frob"), "", 0, "", ""),
  list(c(""), "", 0, "", ""),
  list(c("count", "x"), "", 0, "", ""),
  list(c("count", "--tie"), "", 0, "", ""),
  list(c("count", "--tie", "mid"), "", 0, "", ""),
  list(c("count", "--limit", "10"), "", 0, "", ""),
  list(c("count", "--limit", "0"), "", 0, "", ""),
  list(c("count", "--tie", "low", "--tie", "low"), "", 0, "", ""),
  list(c("count", "--limit"), "", 0, "", ""),
  list(c("check", "--bogus"), "", 0, "", ""),
  list(c("Count"), "", 0, "", ""),
  list(c("--tie", "low"), "", 0, "", "")
)

check_reads(rows)
