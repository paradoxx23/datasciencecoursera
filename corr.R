corr <- function(directory, thresold = 0) {
  
  c <- complete(directory)
  cc <- c[c["nobs"] > thresold, ]$id
  dat <- data.frame()
  
  for (i in cc) {
    file <- read.csv(paste(directory, "/", formatC(i,width=3,flag="0"),
                ".csv", sep = ""))
    file_clean <- file[complete.cases(file),]
    corr <- cor(file_clean$sulfate, file_clean$nitrate)
    dat <- rbind(dat,corr)
    
    ##dat <- unlist(dat[1,])

  }
  c(t(dat))
}
