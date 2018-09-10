rm(list = ls())
library(RDS)

Directory <- "./Emissions Data"
setwd(Directory)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png", height = 600, width = 800)

with(total, plot(year, Emissions, xlab = "Year", ylab = "Total Emissions", main = "Total PM 2.5 Emissions across 4 years", 
                 type = "o", col = "red", pch = 19, lty = 3, cex.lab = 1.5, cex.axis = 1.5, cex.main = 2))

dev.off()