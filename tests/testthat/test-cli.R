rows <- list(
  list(character(0), "", 2, "", "usage: rankvote count [--tie WHICH] [--limit N]\n       rankvote rounds [--tie WHICH] [--limit N]\n       rankvote stats [--tie WHICH] [--limit N]\n       rankvote check [--tie WHICH] [--limit N]\n"),
  list(c("help"), "", 0, "usage: rankvote count [--tie WHICH] [--limit N]\n       rankvote rounds [--tie WHICH] [--limit N]\n       rankvote stats [--tie WHICH] [--limit N]\n       rankvote check [--tie WHICH] [--limit N]\n", ""),
  list(c("-h", "extra"), "", 0, "usage: rankvote count [--tie WHICH] [--limit N]\n       rankvote rounds [--tie WHICH] [--limit N]\n       rankvote stats [--tie WHICH] [--limit N]\n       rankvote check [--tie WHICH] [--limit N]\n", ""),
  list(c("--help", "--bogus"), "", 0, "usage: rankvote count [--tie WHICH] [--limit N]\n       rankvote rounds [--tie WHICH] [--limit N]\n       rankvote stats [--tie WHICH] [--limit N]\n       rankvote check [--tie WHICH] [--limit N]\n", ""),
  list(c("--version"), "", 0, "rankvote 0.1.0\n", ""),
  list(c("--version", "x"), "", 0, "rankvote 0.1.0\n", ""),
  list(c("frob"), "", 2, "", "rankvote: unknown command frob\n"),
  list(c(""), "", 2, "", "rankvote: unknown command \n"),
  list(c("Count"), "", 2, "", "rankvote: unknown command Count\n"),
  list(c("--tie"), "", 2, "", "rankvote: unknown command --tie\n"),
  list(c("--limit", "5"), "", 2, "", "rankvote: unknown command --limit\n"),
  list(c("help", "count"), "", 0, "usage: rankvote count [--tie WHICH] [--limit N]\n       rankvote rounds [--tie WHICH] [--limit N]\n       rankvote stats [--tie WHICH] [--limit N]\n       rankvote check [--tie WHICH] [--limit N]\n", "")
)

check_rows(rows)
