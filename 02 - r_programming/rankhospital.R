Directory <- "./ProgAssignment3-data/"
setwd(Directory)
rankhospital <- function(state, outcome, num = "best"){
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
  ranking <- hospital[order(hospital$Deaths, hospital$Name), ]
  
  if (num == 'best') {return(as.character(ranking$Name)[1])}
  else if (num == 'worst') {return(as.character(ranking$Name)[nrow(ranking)])}
  else if (num > nrow(ranking)) {return("NA")}
  else {return(as.character(ranking$Name)[num])}
}