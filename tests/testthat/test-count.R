rows <- list(
  list(c("count"), "a b c\na c b\na b\nb a c\nc a\n", 0, "winner a\nvotes 3 of 5\nrounds 1\n", ""),
  list(c("count"), "a b c\na c\nb c a\nb a c\nc b a\nc b\n", 0, "winner c\nvotes 6 of 6\nrounds 3\n", ""),
  list(c("count"), "a b\na b\nb c\nc b\nc b\n", 0, "winner c\nvotes 3 of 5\nrounds 2\n", ""),
  list(c("count"), "a\na b\nb\nc b\nc\n", 0, "winner c\nvotes 2 of 2\nrounds 3\n", ""),
  list(c("count"), "a b\nb a\n", 0, "winner b\nvotes 2 of 2\nrounds 2\n", ""),
  list(c("count"), "x y z\ny z x\nz x y\n", 0, "winner y\nvotes 2 of 3\nrounds 2\n", ""),
  list(c("count"), "a b c d\na c d b\nb a c d\nb d c a\nc d a b\nc b a d\nd c b a\nd a b c\nd b a c\n", 0, "winner c\nvotes 5 of 9\nrounds 3\n", ""),
  list(c("count"), "a\n", 0, "winner a\nvotes 1 of 1\nrounds 1\n", ""),
  list(c("count"), "", 1, "", "rankvote: no ballots\n"),
  list(c("count"), "# nothing\n\n", 1, "", "rankvote: no ballots\n"),
  list(c("count"), "a\na\na b\n", 0, "winner a\nvotes 3 of 3\nrounds 1\n", ""),
  list(c("count"), "a b\nb a\nc\n", 0, "winner b\nvotes 2 of 3\nrounds 2\n", ""),
  list(c("count"), "a b\r\nb a\r\nb a\r\n", 0, "winner b\nvotes 2 of 3\nrounds 1\n", ""),
  list(c("count"), "a b c\nd\n", 0, "winner d\nvotes 1 of 1\nrounds 4\n", ""),
  list(c("count"), "a b c d e f g h i\nb c d e f g h i a\ni h g f e d c b a\ne d c b a i h g f\na i b h c g d f e\n", 0, "winner e\nvotes 3 of 5\nrounds 8\n", "")
)

check_rows(rows)
