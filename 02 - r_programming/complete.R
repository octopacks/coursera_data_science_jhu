complete <- function(directory, id = 1:332){
  fn <- list.files(path = directory, pattern = ".csv", full.names = TRUE)
  dat <- data.frame()
  nobs <- data.frame()
  ccas <- data.frame()
  for(i in id){
    dat <- read.csv((fn[i]), header = TRUE)
    nobs <- sum(complete.cases(dat))
    ccas <- rbind(ccas, data.frame(id = i, nobs))
  }
  ccas
}
