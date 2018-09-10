library(jpeg)
img <- readJPEG("Jeff_Leek.jpg", native = TRUE)
quantile(img, probs = c(0.3, 0.8))