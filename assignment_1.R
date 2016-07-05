weightmedian <- function(directory,day) {
  files_list <- list.files(directory,full.names=TRUE)
  dat <- data.frame()
  for (i in 1:5) {
    dat <- rbind(dat,read.csv(files_list[i]))
  }
  dat_subset <- dat[which(dat[,"Day"] == day),]
  median(dat_subset[,"Weight"],na.rm=TRUE)
}

 pollutanmean <- function(directory, pollutant, id = 1:332) {
     files_list <- list.files(directory,full.names = TRUE)
     dat <- data.frame()
     for (i in id) {
        dat <- rbind(dat,read.csv(files_list[i]))
       }
     dat_subset <- dat[which(dat[,"ID"] == id),]
     mean(dat_subset[,pollutant],na.rm=TRUE)
 }
 

 