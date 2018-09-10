rm(list = ls())
library(RDS)
library(ggplot2)

Directory <- "./Emissions Data"
setwd(Directory)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

data <- subset(NEI, (fips == "24510" | fips == "06037") & type == "ON-ROAD")
data <- aggregate(Emissions ~ (type + year + fips), data, sum)

png("plot6.png", height = 600, width = 800)

print(ggplot(data, aes(x = year, y = Emissions, group = fips, col = fips)) + geom_point(size = 3, shape = 7, col = "black") + 
      geom_line(size = 1.2) + ggtitle("Total PM 2.5 Emissions from motor vehicle (On-Road) sources\nComparison: Baltimore vs. Los Angeles") + 
      theme(plot.title = element_text(size = 24, face = "bold")) + theme(legend.title = element_text(size = 20, face = "bold")) + 
      theme(legend.text = element_text(size = 14)) + theme(axis.title.x = element_text(size = 20, face = "bold")) + 
      theme(axis.text.x = element_text(size = 16, face = "bold")) + theme(axis.title.y = element_text(size = 20, face = "bold")) + 
      theme(axis.text.y = element_text(size = 16, face = "bold")) + ylab("Total Emissions") + xlab("Year") + 
      theme(legend.key = element_rect(size = 3), legend.key.size = unit(1.5, 'lines')) + 
      scale_colour_discrete(name = "City", labels = c("Los Angeles, CA", "Baltimore, MD")))
      
dev.off()
