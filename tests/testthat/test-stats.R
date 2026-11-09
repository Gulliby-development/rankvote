rows <- list(
  list(c("stats"), "a b c\na c b\na b\nb a c\nc a\n", 0, "ballots 5\ncandidates 3\nranked 13\nlongest 3\nexhausted 0\nrounds 1\n", ""),
  list(c("stats"), "a b c\na c\nb c a\nb a c\nc b a\nc b\n", 0, "ballots 6\ncandidates 3\nranked 16\nlongest 3\nexhausted 0\nrounds 3\n", ""),
  list(c("stats"), "a\na b\nb\nc b\nc\n", 0, "ballots 5\ncandidates 3\nranked 7\nlongest 2\nexhausted 3\nrounds 3\n", ""),
  list(c("stats"), "", 0, "ballots 0\ncandidates 0\nranked 0\nlongest 0\nexhausted 0\nrounds 0\n", ""),
  list(c("stats"), "# none\n", 0, "ballots 0\ncandidates 0\nranked 0\nlongest 0\nexhausted 0\nrounds 0\n", ""),
  list(c("stats"), "a\n", 0, "ballots 1\ncandidates 1\nranked 1\nlongest 1\nexhausted 0\nrounds 1\n", ""),
  list(c("stats"), "a b c d e f g h i\nb c d e f g h i a\ni h g f e d c b a\ne d c b a i h g f\na i b h c g d f e\n", 0, "ballots 5\ncandidates 9\nranked 45\nlongest 9\nexhausted 0\nrounds 8\n", ""),
  list(c("stats"), "a b c d\na c d b\nb a c d\nb d c a\nc d a b\nc b a d\nd c b a\nd a b c\nd b a c\n", 0, "ballots 9\ncandidates 4\nranked 36\nlongest 4\nexhausted 0\nrounds 3\n", ""),
  list(c("stats"), "a b\nb a\n", 0, "ballots 2\ncandidates 2\nranked 4\nlongest 2\nexhausted 0\nrounds 2\n", ""),
  list(c("stats", "--limit", "2"), "a b c d\na c d b\nb a c d\nb d c a\nc d a b\nc b a d\nd c b a\nd a b c\nd b a c\n", 0, "ballots 9\ncandidates 4\nranked 18\nlongest 2\nexhausted 2\nrounds 3\n", ""),
  list(c("stats", "--tie", "high"), "x y z\ny z x\nz x y\n", 0, "ballots 3\ncandidates 3\nranked 9\nlongest 3\nexhausted 0\nrounds 2\n", ""),
  list(c("stats", "--limit", "1"), "a\na b\nb\nc b\nc\n", 0, "ballots 5\ncandidates 3\nranked 5\nlongest 1\nexhausted 3\nrounds 3\n", "")
)

check_rows(rows)
