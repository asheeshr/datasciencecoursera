corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    options(digits=4)
    
    nobs <- vector(mode="numeric", length=0)
    corvec <-  vector(mode="numeric", length=0)
    
    for(i in 1:332)
    {
        #Add data from CSV file in data frame
        df <- read.csv(paste("../", directory, "/", sprintf("%03d",i) , ".csv", sep=""))
        l1 <- !is.na(df$nitrate)
        l2 <- !is.na(df$sulfate)
        #print(paste("./", directory, "/", sprintf("%03d",i) , ".csv", sep=""))
        if(sum(l1 & l2) > threshold)    
        {
            corvec <- c(corvec, cor(df$nitrate, df$sulfate, use="complete.obs", method="pearson"))
                                    #x=df[complete.cases(df[sulfate, nitrate]), sulfate], 
                                    #y=df[complete.cases(df[sulfate, nitrate]), nitrate],
                                    #use="everything")) #pairwise.complete.obs"))
        }
        
    }
    
    ## Return a numeric vector of correlations
    corvec
}