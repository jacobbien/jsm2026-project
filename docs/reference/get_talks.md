# Get talks based on some criteria

Get talks based on some criteria

## Usage

``` r
get_talks(speakers, authors, people, keywords, days, session_types)
```

## Arguments

- speakers:

  character vector of speaker names. Names start with given (first)
  name, following the format of JSM program.

- authors:

  character vector of author names. Same as above.

- people:

  character vector of people names. This looks for the person as a
  speaker, author, and chair.

- keywords:

  character vector of words to look for in talk title

- days:

  vector of Dates (e.g. "2026-08-04")

- session_types:

  character vector, e.g. "Invited Papers"
