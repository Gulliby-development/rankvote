rows <- list(
  list(c("check"), "a\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\n", 0, "ok 40 ballots\n", ""),
  list(c("check"), "a\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\n", 1, "", "rankvote: input is too long (max 40 lines)\n"),
  list(c("check"), "# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n", 0, "ok 0 ballots\n", ""),
  list(c("check"), "# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n# x\n", 1, "", "rankvote: input is too long (max 40 lines)\n"),
  list(c("check"), "# top\nx\nx\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\n", 1, "", "rankvote: input is too long (max 40 lines)\n"),
  list(c("check"), "abcdefgh\n", 0, "ok 1 ballot\n", ""),
  list(c("check"), "abcdefghi\n", 1, "", "rankvote: line 1: bad name abcdefghi\n"),
  list(c("check"), "a abcdefgh\n", 0, "ok 1 ballot\n", ""),
  list(c("check"), "a abcdefghi\n", 1, "", "rankvote: line 1: bad name abcdefghi\n"),
  list(c("check"), "a\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\n", 0, "ok 40 ballots\n", ""),
  list(c("check"), "a\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\n", 1, "", "rankvote: input is too long (max 40 lines)\n")
)

check_rows(rows)
