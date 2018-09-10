Directory <- "./ProgAssignment3-data/"
setwd(Directory)
best <- function(state, outcome){
  dat <- read.csv("outcome-of-care-measures.csv")                     
  cause <- c('heart attack', 'heart failure', 'pneumonia')            
  index <- c(11, 17, 23)
  
  if (!state %in% dat$State) {stop("invalid state")}
  if (!outcome %in% cause) {stop("invalid outcome")}
  
  i <- index[match(outcome, cause)]
  hospital <- dat[dat$State == state, c(2, i)]
  hospital[, 2] <- as.numeric(as.character(hospital[, 2]))
  hospital <- na.omit(hospital)
  names(hospital) = c("Name", "Deaths")
  min_death <- min(hospital$Deaths)
  best_hosp <- hospital[hospital$Deaths == min_death, ]$Name
  return(as.character(sort(best_hosp)[1]))
}