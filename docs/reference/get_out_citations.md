# Return the JSM authors that this JSM author cites

For some authors (particularly new ones), it can be useful to augment
their citations with those of coauthors. Use `augment=TRUE` for this.

## Usage

``` r
get_out_citations(name, augment = FALSE)
```

## Arguments

- name:

  name of a JSM author

- augment:

  should we include out citations of coauthors?
