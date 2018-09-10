library(sqldf)
acs <- read.csv("getdata4.csv")
unique(acs$AGEP)
sqldf("select distinct AGEP from acs")