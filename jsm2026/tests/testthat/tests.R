# Generated from create-jsm2026.Rmd: do not edit by hand  
testthat::test_that("get_talks() works", {
  talk_rt <- get_talks(speakers = "Ryan Tibshirani")
  testthat::expect_equal(
    talk_rt$title[[1]],
    "Gradient Equilibrium in Online Learning"
  )
  sb_rt <- c("Sumanta Basu", "Ryan Tibshirani")
  testthat::expect_equal(nrow(get_talks(speakers = sb_rt)), 2)
  testthat::expect_true(
    all(
      get_talks(speakers = sb_rt)$title %in% get_talks(authors = sb_rt)$title
  ))
  testthat::expect_equal(
    nrow(get_talks(authors = "Sumanta Basu")),
    8
  )
  testthat::expect_equal(
    get_talks(speakers = "Sumanta Basu", authors = sb_rt),
    get_talks(speakers = "Sumanta Basu")
  )
  testthat::expect_equal(
    nrow(get_talks(people = "Lucas Janson")),
    7 # speaker, author, and chair
  )
})

testthat::test_that("ordered_nz() works", {
  testthat::expect_equal(
    ordered_nz(c(0, 0, 14, 0, 2, 100, -2)),
    c(6, 3, 5, 7)
  )
})

testthat::test_that("get_coauthors() works", {
  testthat::expect_true("Daniela Witten" %in% get_coauthors("Jacob Bien"))
})

testthat::test_that("get_*_citations() works", {
  jb_out_cite <- get_out_citations("Jacob Bien", augment = FALSE)
  jb_in_cite <- get_in_citations("Jacob Bien", augment = FALSE)
  testthat::expect_true("Daniela Witten" %in% jb_out_cite)
  testthat::expect_true("Daniela Witten" %in% jb_in_cite)
  testthat::expect_equal(
    jb_out_cite,
    get_out_citations("Jacob Bien", augment = TRUE)[1:length(jb_out_cite)]
  )
  testthat::expect_equal(
    jb_in_cite,
    get_in_citations("Jacob Bien", augment = TRUE)[1:length(jb_in_cite)]
  )
})

