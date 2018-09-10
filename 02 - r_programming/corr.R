corr <- function(directory, threshold = 0){
  ccas <- complete(directory)
  abthr <- ccas[ccas$nobs > threshold, 1]
  fn <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  correlations <- rep(NA, length(abthr))
  for (i in abthr){
    dat <- read.csv((fn[i]), header = TRUE)
    ccas <- complete.cases(dat)
    sulfatedata <- dat[ccas, 2]
    nitratedata <- dat[ccas, 3]
    correlations[i] <- cor(x = sulfatedata, y = nitratedata)
    #print(head(dat[ccas, ]))
    #print(sulfatedata)
    #print(nitratedata)
  }
  correlations <- correlations[complete.cases(correlations)]
}
