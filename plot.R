#R course week 4 assignment
#documentation in Hospital_Revised_Flatfiles.pdf

#read files outcome-of-care-measures.csv
oocm <- read.csv("outcome-of-care-measures.csv", colClasses = "character")

#read files hospital-data.csv
hd <- read.csv("hospital-data.csv", colClasses = "character")

#preview first few rows of data
head(oocm)
head(hd)


#1. plot histogram of 30-day death rates from heart attack
#need to coerce death rates from heart attack (column 11) to numeric first

oocm[,11] <- as.numeric(oocm[,11])
hist(oocm[,11])