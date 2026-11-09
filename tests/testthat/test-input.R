rows <- list(
  list(c("check"), "", 0, "ok 0 ballots\n", ""),
  list(c("check"), "a\n", 0, "ok 1 ballot\n", ""),
  list(c("check"), "a b c\na c b\na b\nb a c\nc a\n", 0, "ok 5 ballots\n", ""),
  list(c("check"), "# note\n\n  \na b\n\t\n#b c\n", 0, "ok 1 ballot\n", ""),
  list(c("check"), "a b\r\nb a\r\n", 0, "ok 2 ballots\n", ""),
  list(c("check"), "a b", 0, "ok 1 ballot\n", ""),
  list(c("check"), "\ta\t b \t\n", 0, "ok 1 ballot\n", ""),
  list(c("check"), "a b # not a comment\n", 1, "", "rankvote: line 1: bad name #\n"),
  list(c("check"), "A b\n", 1, "", "rankvote: line 1: bad name A\n"),
  list(c("check"), "a\nb-c\n", 1, "", "rankvote: line 2: bad name b-c\n"),
  list(c("check"), "a b\n1x\n", 1, "", "rankvote: line 2: bad name 1x\n"),
  list(c("check"), "a\nb\na b b\n", 1, "", "rankvote: line 3: b is ranked twice\n"),
  list(c("check"), "a b\nc a a\n", 1, "", "rankvote: line 2: a is ranked twice\n"),
  list(c("check"), "\n", 0, "ok 0 ballots\n", ""),
  list(c("check"), "a b\n\n\nb\n", 0, "ok 2 ballots\n", ""),
  list(c("check"), "a\rb\n", 1, "", "rankvote: line 1: bad name a\rb\n"),
  list(c("check"), "a\n_x\n", 1, "", "rankvote: line 2: bad name _x\n"),
  list(c("check"), "a\nb2 c_d\n", 0, "ok 2 ballots\n", "")
)

check_rows(rows)
