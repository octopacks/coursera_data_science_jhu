library(data.table)
DT <- fread("getdata3.csv")
system.time(DT[,mean(pwgtp15),by=SEX])