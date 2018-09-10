dat <- read.fwf("getdata5.for", widths = c(1, 9, 5, 4, 4, 5, 4, 4, 5, 4, 4, 5, 4, 4), skip = 4)
sum(dat$V7)