library(dplyr)
dat <- read.csv("getdata.csv")
dat <- tbl_df(dat)
y <- select(dat, VAL)
wth <- filter(y, !is.na(VAL), VAL == 24)
wth