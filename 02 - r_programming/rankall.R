Directory <- "./ProgAssignment3-data/"
setwd(Directory)
rankall <- function(outcome, num = "best"){
  dat <- read.csv("outcome-of-care-measures.csv")
  cause <- c('heart attack', 'heart failure', 'pneumonia')
  index <- c(11, 17, 23)
  
  if (!outcome %in% cause) {stop("invalid outcome")}
  
  i <- index[match(outcome, cause)]
  hospital <- dat[c(2, 7, i)]
  hospital[, 3] <- as.numeric(as.character(hospital[, 3]))
  hospital <- na.omit(hospital)
  names(hospital) = c("Name", "State", "Deaths")
  ranking <- hospital[order(hospital$State, hospital$Deaths, hospital$Name), ]
  
  table <- data.frame()
  result <- data.frame()
  ranklist <- data.frame()
  
  for (State in levels(hospital$State)) {
    table <- ranking[ranking$State == State, c(1, 2)]
    
    if (num == 'best') {result <- table[1, ]}
    else if (num == 'worst') {result <- table[nrow(table), ]}
    else if (num > nrow(ranking)) {return("NA")}
    else {result <- table[num, ]}
    
    ranklist <- rbind(ranklist, result)
  }
  ranklist
}