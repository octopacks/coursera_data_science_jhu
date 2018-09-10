library(data.table)
library(dplyr)
data <- fread("getdata.csv")
agricultureLogical <- with(data, ACR == 3 & AGS == 6)
which(agricultureLogical)[1:3]