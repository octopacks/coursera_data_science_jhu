rm(list = ls())
library(data.table)

hpcdata <- fread("household_power_consumption.txt", header = TRUE, na.strings = "?")
hpcdata$Date <- as.Date(hpcdata$Date, format = "%d/%m/%Y")
seldata <- subset(hpcdata, `Date` == "2007-02-01" | `Date` == "2007-02-02")

d <- paste(seldata$Date, seldata$Time)
d <- as.POSIXct(d)

plot(d, seldata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
