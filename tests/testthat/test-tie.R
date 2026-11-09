rows <- list(
  list(c("count", "--tie", "low"), "a b\nb a\n", 0, "winner b\nvotes 2 of 2\nrounds 2\n", ""),
  list(c("count", "--tie", "high"), "a b\nb a\n", 0, "winner a\nvotes 2 of 2\nrounds 2\n", ""),
  list(c("rounds", "--tie", "low"), "x y z\ny z x\nz x y\n", 0, "round 1 total 3\nx 1\ny 1\nz 1\neliminated x\nround 2 total 3\ny 2\nz 1\nwinner y\n", ""),
  list(c("rounds", "--tie", "high"), "x y z\ny z x\nz x y\n", 0, "round 1 total 3\nx 1\ny 1\nz 1\neliminated z\nround 2 total 3\nx 2\ny 1\nwinner x\n", ""),
  list(c("rounds", "--tie", "low"), "a b c d\na c d b\nb a c d\nb d c a\nc d a b\nc b a d\nd c b a\nd a b c\nd b a c\n", 0, "round 1 total 9\nd 3\na 2\nb 2\nc 2\neliminated a\nround 2 total 9\nb 3\nc 3\nd 3\neliminated b\nround 3 total 9\nc 5\nd 4\nwinner c\n", ""),
  list(c("rounds", "--tie", "high"), "a b c d\na c d b\nb a c d\nb d c a\nc d a b\nc b a d\nd c b a\nd a b c\nd b a c\n", 0, "round 1 total 9\nd 3\na 2\nb 2\nc 2\neliminated c\nround 2 total 9\nd 4\nb 3\na 2\neliminated a\nround 3 total 9\nd 5\nb 4\nwinner d\n", ""),
  list(c("count", "--tie", "high"), "a b\na b\nb c\nc b\nc b\n", 0, "winner c\nvotes 3 of 5\nrounds 2\n", ""),
  list(c("rounds", "--tie", "high"), "a b c\na c\nb c a\nb a c\nc b a\nc b\n", 0, "round 1 total 6\na 2\nb 2\nc 2\neliminated c\nround 2 total 6\nb 4\na 2\nwinner b\n", ""),
  list(c("count", "--tie", "high"), "a\nb\nc\n", 0, "winner a\nvotes 1 of 1\nrounds 3\n", ""),
  list(c("rounds", "--tie", "low"), "b1\na_\na1\n", 0, "round 1 total 3\na1 1\na_ 1\nb1 1\neliminated a1\nround 2 total 2\na_ 1\nb1 1\neliminated a_\nround 3 total 1\nb1 1\nwinner b1\n", ""),
  list(c("rounds", "--tie", "high"), "b1\na_\na1\n", 0, "round 1 total 3\na1 1\na_ 1\nb1 1\neliminated b1\nround 2 total 2\na1 1\na_ 1\neliminated a_\nround 3 total 1\na1 1\nwinner a1\n", "")
)

check_rows(rows)
