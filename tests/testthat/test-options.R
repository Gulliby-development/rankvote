rows <- list(
  list(c("count", "x"), "", 2, "", "rankvote: unexpected argument x\n"),
  list(c("count", ""), "", 2, "", "rankvote: unexpected argument \n"),
  list(c("rounds", "-"), "", 2, "", "rankvote: unexpected argument -\n"),
  list(c("check", "--nope"), "", 2, "", "rankvote: unknown option --nope\n"),
  list(c("count", "--tie"), "", 2, "", "rankvote: missing value for --tie\n"),
  list(c("count", "--tie", "mid"), "", 2, "", "rankvote: bad value for --tie\n"),
  list(c("count", "--tie", "LOW"), "", 2, "", "rankvote: bad value for --tie\n"),
  list(c("count", "--tie", ""), "", 2, "", "rankvote: bad value for --tie\n"),
  list(c("count", "--limit"), "", 2, "", "rankvote: missing value for --limit\n"),
  list(c("count", "--limit", "0"), "", 2, "", "rankvote: bad value for --limit\n"),
  list(c("count", "--limit", "007"), "", 2, "", "rankvote: bad value for --limit\n"),
  list(c("count", "--limit", "10"), "", 2, "", "rankvote: bad value for --limit\n"),
  list(c("count", "--limit", "9"), "a b c\na c b\na b\nb a c\nc a\n", 0, "winner a\nvotes 3 of 5\nrounds 1\n", ""),
  list(c("count", "--limit", "99999999999"), "", 2, "", "rankvote: bad value for --limit\n"),
  list(c("count", "--limit", "abc"), "", 2, "", "rankvote: bad value for --limit\n"),
  list(c("count", "--tie", "low", "--tie", "high"), "", 2, "", "rankvote: given twice: --tie\n"),
  list(c("stats", "--limit", "3", "--limit", "4"), "", 2, "", "rankvote: given twice: --limit\n"),
  list(c("count", "--tie", "--limit"), "", 2, "", "rankvote: bad value for --tie\n"),
  list(c("count", "--limit", "--tie", "low"), "", 2, "", "rankvote: bad value for --limit\n"),
  list(c("count", "--tie", "high", "x"), "", 2, "", "rankvote: unexpected argument x\n"),
  list(c("rounds", "--limit", "2", "--tie", "high"), "a b c\na c\nb c a\nb a c\nc b a\nc b\n", 0, "round 1 total 6\na 2\nb 2\nc 2\neliminated c\nround 2 total 6\nb 4\na 2\nwinner b\n", "")
)

check_rows(rows)
