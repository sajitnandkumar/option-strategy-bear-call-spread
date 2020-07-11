url_nse <- "https://iislliveblob.niftyindices.com/assets/json/IndexMapping.json"

json_raw <- httr::content(GET(url_nse, progress(), verbose()),as="raw")

nse_indices_list <- jsonlite::fromJSON(rawToChar(json_raw[-(1:3)]))
rm(json_raw, url_nse)