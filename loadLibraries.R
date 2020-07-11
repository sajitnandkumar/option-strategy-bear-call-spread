tryCatch(
  library(jsonlite),
  error = function(e){
    install.packages("jsonlite")
    library(jsonlite)
  }
)

tryCatch(
  library(httr),
  error = function(e){
    install.packages("httr")
    library(httr)
  }
)