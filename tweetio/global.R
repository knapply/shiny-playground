packages <- c(
  "shiny",
  "shinyjs",
  "tweetio", # github: knapply/tweetio
  "readr"
)

missing <- packages[!vapply(packages, requireNamespace, 
                            logical(1L), quietly = TRUE)]

if (length(missing) > 0L) {
  stop("The following packages are missing:", 
       paste0("\n\t-", packages))
}

for (i in seq_along(packages)) {
  library(packages[[i]], character.only = TRUE)
}