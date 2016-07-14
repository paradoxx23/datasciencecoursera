#3. ranking hospitals by outcome in a state

rankall <- function(outcome, num = "best") {
  
  #check if outcome is valid input
  if(!outcome %in% c("heart attack", "heart failure", "pneumonia")) 
  {stop('invalid outcome')} 
  
  #read file
  oocm <- read.csv("outcome-of-care-measures.csv", colClasses = "character",
                   na.strings = "Not Available")
  
  #create data frame with needed variables only
  data   <- as.data.frame(cbind(oocm[, 2],   # hospital
                                oocm[, 7],   # state
                                oocm[, 11],  # heart attack
                                oocm[, 17],  # heart failure
                                oocm[, 23]), # pneumonia
                          stringsAsFactors = FALSE)
  colnames(data) <- c("hospital", "state", "heart attack", "heart failure", "pneumonia")
  
  #convert outcome rates to numeric 
  #I couldn't figure out how to batch this into a single statement
  data[,3] <- as.numeric(data[,3])
  data[,4] <- as.numeric(data[,4])
  data[,5] <- as.numeric(data[,5])

  #make list of states
  states <- sort(unique(data$state))

  y <- data.frame()
  
  for (i in 1:length(states)) {
  #order data by outcome rate and hospital name
    states_2 <- states[i]
    new_data <- subset(data, data$state == states_2)
    ordered_data <- new_data[order(new_data[outcome], new_data$hospital, na.last = NA),]
  
  #return top result from ordered dataset
  x <- if(num == "best") {
         ordered_data[1,1:2]
       } else if (num == "worst") {
         ordered_data[nrow(ordered_data),1:2]
       } else {
         ordered_data[num,1:2]
       }
  y <- rbind(y, x)
  }
  row.names(y) <- states
  return(y)
}