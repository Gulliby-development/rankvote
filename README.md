<p align="center"><img src="docs/logo.svg" width="96" alt="" /></p>

# rankvote

[![CI](https://github.com/Gulliby-development/rankvote/actions/workflows/ci.yml/badge.svg)](https://github.com/Gulliby-development/rankvote/actions/workflows/ci.yml) [![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

rankvote is a small, offline instant-runoff command-line tool for people running
elections in clubs, teams, and classrooms. It reads ranked ballots from standard
input and can validate ballots, name a winner, show the count round by round, or
summarize the election. It uses base R 4.x and runs on Windows, macOS, and Linux.

## Running rankvote

Run commands from the repository directory with R 4.x installed:

```sh
Rscript exec/rankvote.R COMMAND
```

For the POSIX-shell examples later in this guide, `rankvote` is a shell function
that forwards its arguments to the R script:

```sh
rankvote() { Rscript exec/rankvote.R "$@"; }
```

The command-line interface and the executable use the same interpretation of
arguments. The executable reads standard input only when the arguments form a
valid invocation of one of the four ballot commands; help, version, malformed
arguments, and unknown commands do not read it.

The synopsis is:

```text
usage: rankvote count [--tie WHICH] [--limit N]
       rankvote rounds [--tie WHICH] [--limit N]
       rankvote stats [--tie WHICH] [--limit N]
       rankvote check [--tie WHICH] [--limit N]
```

The commands accept `--tie` (`low` or `high`, default `low`) and
`--limit` (a decimal digit from 1 through 9 with no leading zero, default 9). Options may appear in
either order, but each option may be used only once. A value is the next
argument even if it looks like an option. For each option, duplicate use is
reported before a missing value, and a missing value before a bad value. The
arguments are checked from left to right, so the first invalid argument wins.

As the first argument, `help`, `-h`, and `--help` print the synopsis and
`--version` prints `rankvote 0.1.0`; each succeeds regardless of later
arguments. With no arguments, the synopsis is written to standard error and
the command exits with status 2. Any other first argument, including an empty
argument, is an unknown command.

Command-line failures exit with status 2, write no standard output, and write
one prefixed error line to standard error. The possible messages are:

- `rankvote: unknown command WORD`
- `rankvote: unexpected argument WORD` for a non-option argument after the command
- `rankvote: unknown option WORD`
- `rankvote: given twice: OPTION`
- `rankvote: missing value for OPTION`
- `rankvote: bad value for OPTION`

## Ballot input and validation

Each ballot is a line of candidate names, ordered from most to least preferred.
Separate names with one or more spaces or tabs; spaces and tabs at either end
are ignored. A line containing only spaces and tabs is skipped. A line whose
first word begins with `#` is a comment and is skipped. A `#` appearing later
in a ballot is treated as a candidate word, not as a comment. Blank and comment
lines still count when identifying the physical line number in an error.

Input is split at line feeds. A final line without a line feed is still read,
and one carriage return immediately before a line feed (or at the end of the
final line) is removed. More than 40 lines is rejected before any other input
error; 40 lines is allowed. At most nine distinct candidate names may occur
across all ballots.

A name must be 1–8 ASCII characters: its first character is a lowercase letter,
and each remaining character is a lowercase letter, a digit, or an underscore.
Every word is checked, including names after the configured counting limit.
For each word, rankvote first checks its name, then whether it repeats an
earlier name on that same ballot, then whether it would exceed the election's
nine-candidate cap. Valid names beyond the counting limit remain candidates in
the election, even though they are not used in the count.

Input failures exit with status 1, leave standard output empty, and write one
prefixed error line to standard error. The messages are:

- `rankvote: input is too long (max 40 lines)`
- `rankvote: line N: bad name WORD`
- `rankvote: line N: NAME is ranked twice`
- `rankvote: line N: too many candidates (max 9)`

## Counting and tie-breaking

The optional `--limit N` keeps only the first N names from each valid ballot
for the count. Validation still checks every name, and every distinct valid
name is an election candidate even if it appears beyond that limit. In each
round, a ballot counts for its highest-ranked kept candidate still in the
count. If none remain, that ballot is exhausted. Candidates with no votes
remain in the round report with zero votes.

A winner must have strictly more than half of the nonexhausted ballots in that
round. Otherwise the candidate with the fewest votes is eliminated and another
round begins. If the fewest-vote total is tied, `--tie low` eliminates the
candidate first in byte order; `--tie high` eliminates the last in byte order.
Names in reports are sorted by votes descending, then by name in byte order.
The default tie rule is `low`.

## Command output

- `check` validates without counting and prints `ok N ballot` for one ballot,
  or `ok N ballots` for any other number, including zero.
- `count` prints the winner, its votes and the nonexhausted total in the final
  round, and the number of rounds. With no ballots it fails with
  `rankvote: no ballots`.
- `rounds` prints each round's total, each continuing candidate's vote count,
  and either the eliminated candidate or the winner. Like `count`, it fails
  with `rankvote: no ballots` when there are no ballots.
- `stats` prints six lines: ballot count, distinct candidate count, number of
  kept rankings, longest kept ballot, exhausted ballots in the final round,
  and round count. With no ballots all six values are zero.

A successful command writes its result to standard output, nothing to standard
error, and exits with status 0. Input failures exit with status 1, write no
standard output, and print one error line to standard error. In addition to
`rankvote: no ballots`, input errors are `rankvote: input is too long (max 40 lines)`,
`rankvote: line N: bad name WORD`, `rankvote: line N: NAME is ranked twice`,
and `rankvote: line N: too many candidates (max 9)`. The line number is the
physical input line, including skipped blank and comment lines.

Command-line errors exit with status 2 and do not read standard input. The
first command-line problem is reported: arguments after the command are
checked left to right; a word not beginning with a hyphen (including empty or
exactly `-`) is an unexpected argument, while an unrecognized hyphen-prefixed
word is an unknown option. For `--tie` and `--limit`, a repeated option is
reported before checking whether its value is missing, and missing value is
reported before bad value. The following word is always consumed as the value,
even if it resembles another option. A help or version word in first position
short-circuits all later arguments. `reads_stdin(args)` is true only for a
valid command and option sequence; the executable reads input only in that
case. The in-memory `run_cli(args, input)` uses the same parsing behavior and
returns a reply containing status, standard output, and standard error. Command
handlers receive `(options, input)` and return replies or signal input failures;
only `exec/rankvote.R` performs stream I/O.

## Examples

The following examples are for a POSIX shell, run from the repository
directory after defining the `rankvote` shell function shown above. The
function invokes `Rscript exec/rankvote.R "$@"`. The final example redirects
standard error into standard output with `2>&1`. The displayed output uses LF
line endings. On Windows, `Rscript` terminates output lines with CR LF instead.

```text
$ printf 'a b c\na c b\nb a c\nc b a\nc a\n' | rankvote rounds
round 1 total 5
a 2
c 2
b 1
eliminated b
round 2 total 5
a 3
c 2
winner a
$ printf 'a b\nb a\n' | rankvote count; printf 'a b\nb a\n' | rankvote count --tie high
winner b
votes 2 of 2
rounds 2
winner a
votes 2 of 2
rounds 2
$ printf 'a b c\nb c a\nc b a\n' | rankvote stats --limit 2
ballots 3
candidates 3
ranked 6
longest 2
exhausted 0
rounds 2
$ printf 'a b\nb b\n' | rankvote check 2>&1; printf 'a\n' | rankvote count --limit 0 2>&1
rankvote: line 2: b is ranked twice
rankvote: bad value for --limit
```

## Development

Run both checks from the repository directory:

```sh
Rscript -e "testthat::test_local()"
Rscript -e "lintr::lint_package()"
```

`testthat` is used for tests only. `lintr` and `styler` are development tools;
the program itself has no runtime package dependencies beyond base R.

See [LICENSE](LICENSE) for the MIT license.

---

Built with [BAKED](https://github.com/Gulliby-development/baked), an open-source coding agent (bench round R94).
