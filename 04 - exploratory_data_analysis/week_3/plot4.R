rm(list = ls())
library(RDS)
library(ggplot2)

Directory <- "./Emissions Data"
setwd(Directory)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

search <- SCC[grepl("Coal", SCC$EI.Sector, ignore.case = TRUE), ]
coal <- subset(NEI, NEI$SCC %in% search$SCC)
coal <- aggregate(Emissions ~ year, coal, sum)

png("plot4.png", height = 600, width = 800)

print(ggplot(coal, aes(x = factor(year), y = Emissions)) + geom_bar(stat = "identity", width = 0.2, fill = "orange") + 
      ggtitle("PM 2.5 Emissions from coal combustion-related sources\nacross the U.S.") + 
      theme(plot.title = element_text(size = 24, face = "bold")) + theme(axis.text.x = element_text(size = 16, face = "bold")) + 
      theme(axis.title.x = element_text(size = 20, face = "bold")) + theme(axis.text.y = element_text(size = 16, face = "bold")) + 
      theme(axis.title.y = element_text(size = 20, face = "bold")) + xlab("Year") + ylab("Total Emissions"))

dev.off()