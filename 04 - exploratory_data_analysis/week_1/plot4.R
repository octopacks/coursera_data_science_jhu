rm(list = ls())
library(data.table)

hpcdata <- fread("household_power_consumption.txt", header = TRUE, na.strings = "?")
hpcdata$Date <- as.Date(hpcdata$Date, format = "%d/%m/%Y")
seldata <- subset(hpcdata, `Date` == "2007-02-01" | `Date` == "2007-02-02")

d <- paste(seldata$Date, seldata$Time)
d <- as.POSIXct(d)

par(mfrow = c(2, 2))

plot(d, seldata$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

plot(d, seldata$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(d, seldata$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(d, seldata$Sub_metering_2, type = "l", col = "red")
lines(d, seldata$Sub_metering_3, type = "l", col = "blue")
legend("topright", fill = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(d, seldata$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

dev.copy(png, file = "plot4.png", height = 640, width = 800)
dev.off()
