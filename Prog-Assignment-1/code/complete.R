complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    nobs <- vector(mode="numeric", length=0)
    
    for(i in id)
    {
        #Add data from CSV file in data frame
        df <- read.csv(paste("../", directory, "/", sprintf("%03d",i) , ".csv", sep=""))
        #l1 <- !is.na(df$nitrate)
        #l2 <- !is.na(df$sulfate)
        nobs <- c( nobs, sum(!is.na(df$nitrate) & !is.na(df$sulfate)))    
        #nobs <- c( nobs, sum(l1 & l2))    
    }
    
    data.frame(id, nobs)
}