#.Rprofile
.First <- function() {
  options(
          repos = c(CRAN = "http://cran.r-project.org/"),
          browserNLdisabled = TRUE,
          deparse.max.lines = 2,
          width=160
         )

  if (interactive()) {
      suppressMessages(require(devtools))
  }
}
