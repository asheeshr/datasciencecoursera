pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    #print(getwd())
    s <- vector(mode="numeric", length=0)
    n <- vector(mode="numeric", length=0)
    
    for(i in id)
    {
        #Add data from CSV file in data frame
        df <- read.csv(paste("../", directory, "/", sprintf("%03d",i) , ".csv", sep=""))
        #print(df[[pollutant]])
        s <- c( s, sum(df[[pollutant]], na.rm = TRUE))
        n <- c( n, sum(!is.na(df[[pollutant]])))
        #print(m)
        #m <- c(m, mean(df$pollutant))
        #print(paste(directory, i, ".csv", sep="/"))
    }
    
    as.numeric(sprintf("%0.3f", sum(s)/sum(n)))
    
}