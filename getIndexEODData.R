getIndexEODData <- function(name, startDate, endDate)
{
  # Set the URL for NSE's End of Day data
  eod_url <- "https://www.niftyindices.com/Backpage.aspx/getHistoricaldatatabletoString"
  
  # Set up the post paramers for body
  body <- list(
    name = name,
    startDate = startDate,
    endDate = endDate
  )
  
  # Generating a random cookie
  fixed_part <- "ak_bmsc=B4B6E429861E77F0AC9301D28C33DA0B170BD75CFF180000D7000C5F50AFFA64~ply8dcbe+4lMpdp9eFO+xu9ZQYzum10mrBZnJMs0Cg/rIZFFMR0Z8FwsQoKBYC7qqkAXBi15n99Vjs/1fshaGiVbMkSJYhHhbQigSb+iBsegPdGVoJ7XYyS3tvr0I3Mj8g9YFCeide3tT3pMr3TxYu3Lbefl2nOAGTmk8tPIkqKLfsNl1w5BagWOF+YwepPKIGe0o2nN9nYNadQAdb/RgkP5YbpkG3XnQSeYn5fzSmibQ="
  
  random_cookie <- paste("ASP.NET_SessionId=", 
                         paste(sample(c(letters, 0:9), 24, TRUE), collapse = ""), 
                         "; ",
                         fixed_part,
                         sep = "")
  
  # Send a get request
  json_result_raw <- POST(eod_url, body = body, encode = "json", content_type_json(), verbose(),
                          add_headers(.headers = c('Content-Type' = 'application/json',
                                                   'Cookie' = random_cookie,
                                                   'Cache-Control' = 'no-cache',
                                                   'Accept' = '*/*',
                                                   'User-Agent' = 'PostmanRuntime/7.26.1')
                          )
  )
  
  # Parse the JSON response into a dataframe
  json_result_raw <- content(json_result_raw, as = 'parsed')
  eod_data <- fromJSON(txt = json_result_raw$d)
  
  # Clean date column for the table
  eod_data$HistoricalDate <- as.Date(eod_data$HistoricalDate, format = "%d %b %Y")
  
  # Generate week of the day
  eod_data$Weekday <- weekdays(eod_data$HistoricalDate)
  
  # Generate % return between open and close
  eod_data$returns <- round(100 * (as.numeric(eod_data$CLOSE) - as.numeric(eod_data$OPEN))/as.numeric(eod_data$OPEN), 2)
  
  # Clean up all the variables
  rm(body, eod_url, json_result_raw, fixed_part, random_cookie)
  
  return(eod_data)
}