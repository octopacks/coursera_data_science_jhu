rm(list = ls())
library(data.table)

hpcdata <- fread("household_power_consumption.txt", header = TRUE, na.strings = "?")
hpcdata$Date <- as.Date(hpcdata$Date, format = "%d/%m/%Y")
seldata <- subset(hpcdata, `Date` == "2007-02-01" | `Date` == "2007-02-02")

hist(seldata$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
