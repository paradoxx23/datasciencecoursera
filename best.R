#2. find the best hospital in a state

best <- function(state, outcome) {
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
  
  #check if state and outcome are valid inputs
  if(!state %in% data[,"state"]) 
      {stop('invalid state')} 
  if(!outcome %in% c("heart attack", "heart failure", "pneumonia")) 
      {stop('invalid outcome')} 
  
  #set state argument to x to avoid confusion with column variable state
  x <- state
  
  #subset data to state argument
  new_data <- subset(data, data$state == x)
  
  #convert outcome rates to numeric 
  #I couldn't figure out how to batch this into a single statement
  new_data[,3] <- as.numeric(new_data[,3])
  new_data[,4] <- as.numeric(new_data[,4])
  new_data[,5] <- as.numeric(new_data[,5])
  
  #order data by outcome rate and hospital name
  ordered_data <- new_data[order(new_data[outcome], new_data$hospital),]
  
  #return top result from ordered dataset
  ordered_data[1,1]
}

#3. ranking hospitals by outcome in a state



