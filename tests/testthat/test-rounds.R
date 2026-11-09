rows <- list(
  list(c("rounds"), "a b c\na c b\na b\nb a c\nc a\n", 0, "round 1 total 5\na 3\nb 1\nc 1\nwinner a\n", ""),
  list(c("rounds"), "a b c\na c\nb c a\nb a c\nc b a\nc b\n", 0, "round 1 total 6\na 2\nb 2\nc 2\neliminated a\nround 2 total 6\nb 3\nc 3\neliminated b\nround 3 total 6\nc 6\nwinner c\n", ""),
  list(c("rounds"), "a b\na b\nb c\nc b\nc b\n", 0, "round 1 total 5\na 2\nc 2\nb 1\neliminated b\nround 2 total 5\nc 3\na 2\nwinner c\n", ""),
  list(c("rounds"), "a\na b\nb\nc b\nc\n", 0, "round 1 total 5\na 2\nc 2\nb 1\neliminated b\nround 2 total 4\na 2\nc 2\neliminated a\nround 3 total 2\nc 2\nwinner c\n", ""),
  list(c("rounds"), "a b\nb a\n", 0, "round 1 total 2\na 1\nb 1\neliminated a\nround 2 total 2\nb 2\nwinner b\n", ""),
  list(c("rounds"), "x y z\ny z x\nz x y\n", 0, "round 1 total 3\nx 1\ny 1\nz 1\neliminated x\nround 2 total 3\ny 2\nz 1\nwinner y\n", ""),
  list(c("rounds"), "a b c d\na c d b\nb a c d\nb d c a\nc d a b\nc b a d\nd c b a\nd a b c\nd b a c\n", 0, "round 1 total 9\nd 3\na 2\nb 2\nc 2\neliminated a\nround 2 total 9\nb 3\nc 3\nd 3\neliminated b\nround 3 total 9\nc 5\nd 4\nwinner c\n", ""),
  list(c("rounds"), "a\n", 0, "round 1 total 1\na 1\nwinner a\n", ""),
  list(c("rounds"), "", 1, "", "rankvote: no ballots\n"),
  list(c("rounds"), "b c\nc b\na\n", 0, "round 1 total 3\na 1\nb 1\nc 1\neliminated a\nround 2 total 2\nb 1\nc 1\neliminated b\nround 3 total 2\nc 2\nwinner c\n", ""),
  list(c("rounds"), "a b\na c\nb a\n", 0, "round 1 total 3\na 2\nb 1\nc 0\nwinner a\n", ""),
  list(c("rounds"), "a b c d e f g h i\nb c d e f g h i a\ni h g f e d c b a\ne d c b a i h g f\na i b h c g d f e\n", 0, "round 1 total 5\na 2\nb 1\ne 1\ni 1\nc 0\nd 0\nf 0\ng 0\nh 0\neliminated c\nround 2 total 5\na 2\nb 1\ne 1\ni 1\nd 0\nf 0\ng 0\nh 0\neliminated d\nround 3 total 5\na 2\nb 1\ne 1\ni 1\nf 0\ng 0\nh 0\neliminated f\nround 4 total 5\na 2\nb 1\ne 1\ni 1\ng 0\nh 0\neliminated g\nround 5 total 5\na 2\nb 1\ne 1\ni 1\nh 0\neliminated h\nround 6 total 5\na 2\nb 1\ne 1\ni 1\neliminated b\nround 7 total 5\na 2\ne 2\ni 1\neliminated i\nround 8 total 5\ne 3\na 2\nwinner e\n", "")
)

check_rows(rows)
