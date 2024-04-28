####################################
# global libraries used everywhere #
####################################
mran.date <- "2022-11-22"

get_os <- function(){
  sysinf <- Sys.info()
  if (!is.null(sysinf)){
    os <- sysinf['sysname']
    if (os == 'Darwin')
      os <- "osx"
  } else { ## mystery machine
    os <- .Platform$OS.type
    if (grepl("^darwin", R.version$os))
      os <- "osx"
    if (grepl("linux-gnu", R.version$os))
      os <- "linux"
  }
  tolower(os)
}

if (get_os()=="linux") {
## Rstudio Package Manager
  #if (getOption("repos")["CRAN"]=="@CRAN@") {
  options(repos = c(REPO_NAME = paste0("https://packagemanager.posit.co/cran/__linux__/focal/",mran.date)))
  #} else {
  #message("Repo for CRAN already set")
  #}
} else {
## MRAN
  options(repos=paste0("https://packagemanager.posit.co/cran/",mran.date))
}

getOption("repos")["CRAN"]

pkgTest <- function(x)
{
	if (!require(x,character.only = TRUE))
	{
		install.packages(x,dep=TRUE)
		if(!require(x,character.only = TRUE)) stop("Package not found")
	}
	return("OK")
}

global.libraries <- c("dplyr","devtools","rprojroot","tictoc","ggplot2","bindrcpp","Rcpp")

results <- sapply(as.list(global.libraries), pkgTest)

if (!require("grateful",character.only = TRUE)) {
  # install.packages("remotes")
  remotes::install_github("Pakillo/grateful")
  if(!require("grateful",character.only = TRUE)) stop("Package not found")
}
