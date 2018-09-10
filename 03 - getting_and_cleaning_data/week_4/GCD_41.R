library(data.table)
dat <- fread("idahohousing.csv")
strsplit(names(dat), "wgtp")[[123]]
