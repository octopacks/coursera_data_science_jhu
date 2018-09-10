rm(list = ls())
library(RDS)
library(ggplot2)

Directory <- "./Emissions Data"
setwd(Directory)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, fips == "24510" & type == "ON-ROAD")
baltimore <- aggregate(Emissions ~ year, baltimore, sum)

png("plot5.png", height = 600, width = 800)

print(ggplot(baltimore, aes(x = year, y = Emissions)) + geom_point(size = 3, shape = 16, col = "blue") + 
        geom_line(col = "green") + ggtitle("Total PM 2.5 Emissions from motor vehicle (On-Road)\nsources in Baltimore City") + 
        theme(plot.title = element_text(size = 24, face = "bold")) + theme(axis.text.x = element_text(size = 16, face = "bold")) + 
        theme(axis.title.x = element_text(size = 20, face = "bold")) + theme(axis.text.y = element_text(size = 16, face = "bold")) + 
        theme(axis.title.y = element_text(size = 20, face = "bold")) + ylab("Total Emissions") + xlab("Year"))

dev.off()