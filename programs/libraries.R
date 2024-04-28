#' ---
#' local libraries


#' Define the list of libraries
libraries <- c("dplyr","devtools","rcrossref","readr","tidyr","data.table","xtable",
               "rjson","ggplot2","Rcpp","stargazer","knitr","stringr","readxl",
               "fastDummies","skimr","sandwich","pastecs","formattable","markdown",
               "reshape2")



#install_github("cboettig/knitcitations")
#install.packages("knitcitations")
#require(knitcitations)

results <- sapply(as.list(libraries), pkgTest)
cbind(libraries,results)

# Rcpp and magick are dependencies of summarytools
# there are some weird things going on in Linux world, so this is the workaround
libraries3 <- c("magick","summarytools")

pkgTestSrc <- function(x) {
        if (!require(x,character.only = TRUE))
	    {
    # updated, not tested.
		install.packages(x,repos=paste0("https://packagemanager.posit.co/cran/all/",mran.date))
		if(!require(x,character.only = TRUE)) stop("Package not found")
	    }
	return("OK")
}

if ( get_os() == "linux" ) {

    libraries2 <- c("Rcpp")
    results2 <- sapply(as.list(libraries2),pkgTest)

    # now install magick and summary tools from source
    #sapply(as.list(libraries3),pkgTestSrc)
    #sapply(as.list(libraries3),pkgTest)
} else {
    sapply(as.list(libraries3),pkgTest)
}

# installing an additional package, latest version

remotes::install_github("ropensci/openalexR")
