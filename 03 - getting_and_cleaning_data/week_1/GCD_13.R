library(dplyr)
library(readxl)
info <- read_xlsx("getdata2.xlsx")
dat <- select(info, 7:15)
dat <- filter(dat, row_number() %in% 18:23)
colnames(dat) <- info[17, 7:15]
dat <- transform(dat, Zip = as.numeric(Zip), Ext = as.numeric(Ext))
sum(dat$Zip*dat$Ext,na.rm=T)