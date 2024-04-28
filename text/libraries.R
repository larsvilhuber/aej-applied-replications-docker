#' ---
#' local libraries


#' Define the list of libraries
libraries <- c("dplyr","devtools","readr","tidyr","stargazer","data.table","knitr","ggplot2")

#install_github("cboettig/knitcitations")
#install.packages("knitcitations")
#require(knitcitations)

results <- sapply(as.list(libraries), pkgTest)
cbind(libraries,results)
