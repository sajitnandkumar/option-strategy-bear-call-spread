source("loadLibraries.R")
source("getIndexMaster.R")
source("getIndexEODData.R")

# Generate EOD Data for the scrip and dates mentioned
eod_data <- getIndexEODData(name = "Nifty Bank", "10-Jul-2017", "10-Jul-2020")

# Filter expiry date data
expiry_eod_data <- eod_data[which(eod_data$Weekday == "Thursday"), ]

# Generate Stats
# Percentage covered in one Standard Deviation
perc_1sd <- round(
  100 * length(
    which(expiry_eod_data$returns <= (mean(expiry_eod_data$returns, na.rm = T) + 
                                        sd(expiry_eod_data$returns, na.rm = T))
          & expiry_eod_data$returns >= (mean(expiry_eod_data$returns, na.rm = T) - 
                                          sd(expiry_eod_data$returns, na.rm = T))
    )
  ) / nrow(expiry_eod_data), 2)

# Percentage covered in two Standard Deviations
perc_2sd <- round(
  100 * length(
    which(expiry_eod_data$returns <= (mean(expiry_eod_data$returns, na.rm = T) + 
                                        2*sd(expiry_eod_data$returns, na.rm = T))
          & expiry_eod_data$returns >= (mean(expiry_eod_data$returns, na.rm = T) - 
                                          2*sd(expiry_eod_data$returns, na.rm = T))
    )
  ) / nrow(expiry_eod_data), 2)

# Plot the chart
source("plotReturns.R")