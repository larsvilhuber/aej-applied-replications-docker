# These libraries are only needed for the README

readme.libraries <- c("markdown")

results <- sapply(as.list(readme.libraries), pkgTest)

if (!require("grateful",character.only = TRUE)) {
  # install.packages("remotes")
  remotes::install_github("Pakillo/grateful")
  if(!require("grateful",character.only = TRUE)) stop("Package not found")
}
