rm(list = ls())
library(RDS)

Directory <- "./Emissions Data"
setwd(Directory)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, fips == "24510")
baltimore <- aggregate(Emissions ~ year, baltimore, sum)

png("plot2.png", height = 600, width = 800)

with(baltimore, plot(year, Emissions, xlab = "Year", ylab = "Total Emissions", main = "Total PM 2.5 Emissions in Baltimore City, Maryland", 
                     type = "o", col = "black", pch = 15, lty = 4, cex.lab = 1.5, cex.axis = 1.5, cex.main = 2))

dev.off()