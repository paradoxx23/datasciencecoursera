complete <- function(directory, id = 1:332) {
  files_list <- list.files(directory,full.names=TRUE)
  dat <- data.frame()
  for (i in id) {
    dat2 <- read.csv(files_list[i])
    nobs <- sum(complete.cases(dat2))
    dat3 <- data.frame(i,nobs)
    dat <- rbind(dat,dat3)
  }
  colnames(dat) <- c("id","nobs")
  dat
}