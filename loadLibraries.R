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

tryCatch(
  library(ggplot2),
  error = function(e){
    install.packages("ggplot2")
    library(ggplot2)
  }
)

tryCatch(
  library(extrafont),
  error = function(e){
    install.packages("extrafont")
    library(extrafont)
  }
)