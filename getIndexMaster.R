# Set the URL for NSE's index site
url_nse <- "https://iislliveblob.niftyindices.com/assets/json/IndexMapping.json"

# Send a get request
json_raw <- httr::content(GET(url_nse, progress(), verbose()),as="raw")

# Parse the JSON response into a dataframe
nse_indices_list <- jsonlite::fromJSON(rawToChar(json_raw[-(1:3)]))

# Clean up all the variables
rm(json_raw, url_nse)