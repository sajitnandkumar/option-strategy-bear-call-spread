# option-strategy-bear-call-spread
1. Extract the list of index master from www.niftyindices.com - with getIndexMaster.R
2. Using the index master list, extract EOD data for the index from www.niftyindices.com - with getIndexEODData.R
3. Clean the extracted EOD data to filter out only expiry day records with returnsAnalysis.R
4. Plot the data to view the Mean, Max, Min and Std Deviation of the returns - with plotReturns.R
