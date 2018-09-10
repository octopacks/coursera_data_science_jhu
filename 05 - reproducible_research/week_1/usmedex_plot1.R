rm(list = ls())
library(data.table)
library(scales)

medtable <- fread("usmedex.csv")

# PLOT-1
pdf("plot1.pdf", width = 9, height = 7)
with(medtable[Provider.State == "NY", ], plot(x = Average.Covered.Charges, y = Average.Total.Payments, main = "Relationship between Mean Covered Charges and Mean Total Payments in New York", 
      xlab = "Mean Covered Charges", ylab = "Mean Total Payments", pch = 16, col = alpha("blue", 0.15)))
abline(lm(Average.Total.Payments ~ Average.Covered.Charges, medtable), lwd = 2)

dev.off()

# PLOT-2
pdf("plot2.pdf", width = 15, height = 12)
n <- length(unique(medtable$Provider.State))
codes <- substr(unique(medtable$DRG.Definition), 1, 3)
par(mfrow = c(n/2, 2), mar = c(0, 0, 0, 0), oma = c(10, 5, 5, 5))


for(i in 1:n) { 
  stsub <- subset(medtable, medtable$Provider.State == unique(medtable$Provider.State)[i])
  with(stsub, plot(Average.Total.Payments ~ Average.Covered.Charges, col = as.factor(DRG.Definition), pch = 16,
                   axes = FALSE, frame.plot = TRUE))
  mtext(unique(medtable$Provider.State)[i], side = 3, line = -2, adj = 0.1, outer = FALSE)
  if(i %% 2 != 0){
    axis(2, labels = TRUE, at = seq(0, 40000, 8000))
  }
  else{axis(2, labels = FALSE, tick = FALSE)}
  if(i == n-1 | i == n){
    axis(1, labels = TRUE)
  }
  else{axis(1, labels = FALSE, tick = FALSE)}
}
title("Relationship between Mean Covered Charges and Mean Total Payments by state and medical condition", cex.main = 2, outer = TRUE)
mtext(c("Mean Covered Charges", "Mean Total Payments"), side = c(1, 2), line = 3, outer = TRUE)

par(fig = c(0, 1, 0, 1), oma = c(0, 0, 0, 0), mar = c(0, 0, 0, 0), new = TRUE)
legend("bottom", xpd = TRUE, title = "Medical condition code", legend = codes, pch = 16, cex = 1.5, 
       inset = c(0.01, 0), col = as.factor(unique(medtable$DRG.Definition)), horiz = TRUE)

dev.off()