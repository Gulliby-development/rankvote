rows <- list(
  list(c("count", "--limit", "1"), "a b c d\na c d b\nb a c d\nb d c a\nc d a b\nc b a d\nd c b a\nd a b c\nd b a c\n", 0, "winner d\nvotes 3 of 5\nrounds 3\n", ""),
  list(c("count", "--limit", "2"), "a b c d\na c d b\nb a c d\nb d c a\nc d a b\nc b a d\nd c b a\nd a b c\nd b a c\n", 0, "winner d\nvotes 4 of 7\nrounds 3\n", ""),
  list(c("rounds", "--limit", "1"), "a b c\na c\nb c a\nb a c\nc b a\nc b\n", 0, "round 1 total 6\na 2\nb 2\nc 2\neliminated a\nround 2 total 4\nb 2\nc 2\neliminated b\nround 3 total 2\nc 2\nwinner c\n", ""),
  list(c("rounds", "--limit", "3"), "a b c d e f g h i\nb c d e f g h i a\ni h g f e d c b a\ne d c b a i h g f\na i b h c g d f e\n", 0, "round 1 total 5\na 2\nb 1\ne 1\ni 1\nc 0\nd 0\nf 0\ng 0\nh 0\neliminated c\nround 2 total 5\na 2\nb 1\ne 1\ni 1\nd 0\nf 0\ng 0\nh 0\neliminated d\nround 3 total 5\na 2\nb 1\ne 1\ni 1\nf 0\ng 0\nh 0\neliminated f\nround 4 total 5\na 2\nb 1\ne 1\ni 1\ng 0\nh 0\neliminated g\nround 5 total 5\na 2\nb 1\ne 1\ni 1\nh 0\neliminated h\nround 6 total 5\na 2\nb 1\ne 1\ni 1\neliminated b\nround 7 total 4\na 2\ne 1\ni 1\neliminated e\nround 8 total 3\na 2\ni 1\nwinner a\n", ""),
  list(c("stats", "--limit", "9"), "a b c d e f g h i\nb c d e f g h i a\ni h g f e d c b a\ne d c b a i h g f\na i b h c g d f e\n", 0, "ballots 5\ncandidates 9\nranked 45\nlongest 9\nexhausted 0\nrounds 8\n", ""),
  list(c("stats", "--limit", "5"), "a b c d e f g h i\nb c d e f g h i a\ni h g f e d c b a\ne d c b a i h g f\na i b h c g d f e\n", 0, "ballots 5\ncandidates 9\nranked 25\nlongest 5\nexhausted 0\nrounds 8\n", ""),
  list(c("check"), "a b c d e f g h i\n", 0, "ok 1 ballot\n", ""),
  list(c("check"), "a b c d e f g h\ni j\n", 1, "", "rankvote: line 2: too many candidates (max 9)\n"),
  list(c("check"), "a b c d e f g h i\na j\n", 1, "", "rankvote: line 2: too many candidates (max 9)\n"),
  list(c("check"), "a b c d e f g h i\ni a\n", 0, "ok 2 ballots\n", ""),
  list(c("rounds", "--limit", "1"), "a\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\na\n", 0, "round 1 total 40\na 40\nwinner a\n", "")
)

check_rows(rows)
