rm(list = ls())
library(RDS)
library(ggplot2)

Directory <- "./Emissions Data"
setwd(Directory)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, fips == "24510")
baltimore <- aggregate(Emissions ~ (type + year), baltimore, sum)

png("plot3.png", height = 600, width = 800)

print(ggplot(baltimore, aes(x = year, y = Emissions, group = type, col = type)) + geom_point(size = 3, shape = 7, col = "black") + 
      geom_line(size = 1.2) + ggtitle("Total PM 2.5 Emissions in Baltimore City by type") + 
      theme(plot.title = element_text(size = 24, face = "bold")) + theme(legend.text = element_text(size = 14)) + 
      theme(legend.title = element_text(size = 20, face = "bold")) + theme(axis.text.x = element_text(size = 16, face = "bold")) + 
      theme(axis.title.x = element_text(size = 20, face = "bold")) + theme(axis.text.y = element_text(size = 16, face = "bold")) + 
      theme(axis.title.y = element_text(size = 20, face = "bold")) + ylab("Total Emissions") + xlab("Year"))

dev.off()