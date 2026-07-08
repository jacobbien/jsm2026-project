# jsm2025-project

This R package is created using literate programming with the  [litr](https://github.com/jacobbien/litr-project/tree/main/litr) R package.  Please see [jsm2026](jsm2026) for the generated R package itself.

## Code for generating the `jsm2026` package

After cloning this repo...

```r
remotes::install_github("jacobbien/litr-project", subdir = "litr")
litr::render("create-jsm2026.Rmd")
fs::file_move("create-jsm2026.html", "docs/")
```

This will create [create-jsm2026.html](https://jacobbien.github.io/jsm2026-project/create-jsm2026.html) and the package directory [jsm2026](jsm2026).  The last line moves the .html file to a location where github will render it more nicely.