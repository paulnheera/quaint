#***********************
#Get Symbols Function
#**********************

# Download list of dataframes of stocks market data.

library(quantmod)

getMarketData <- function(tickers){
  
  x = list()
  
  for(ticker in tickers){
    flag <- TRUE
    tryCatch(getSymbols(paste0(ticker,'.JO')),
             error = function(e){ 
               flag <<- FALSE
             }
    )
    
    if(!flag) next

    temp <- get(paste0(ticker,".JO"))
    temp <- data.frame(Date = index(temp),temp)
    colnames(temp) <- c('Date','Open','High','Low','Close','Volume','Adjusted')
    rownames(temp) <- NULL
      
    x[[ticker]] <- temp
    
  }
  
  return(x)
  
}



