datos <- read.csv("~/Downloads/household_power_consumption.txt", header=FALSE, sep=";")

uno <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
         "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

names(datos) <- c(uno)

datosf <- datos[-1, ]

library(tidyverse)
filtrado <- filter(datosf, Date %in% c("1/2/2007", "2/2/2007"))


voltag <- as.character(filtrado$Voltage)
voltage <- as.numeric(voltag)
Global_reactive <- as.character(filtrado$Global_reactive_power)
Global_reactive_power <- as.numeric(Global_reactive)


plot(filtrado$Time, voltage, xlab = "datetime", ylab = "Voltage")
plot(filtrado$Time, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power")



par(mfrow = c(2, 2))
par(mar = c(3.8, 3.8, 3.8, 3.8))
#1
plot(grafico1, type = "s",
     ylab = "Global Active Power (kilowatts)", cex = 0.5)

#2
plot(filtrado$Time, voltage, xlab = "datetime", ylab = "Voltage", cex = 0.5)

#3
plot(metering1 , type = "n", ylab = "Energy sub metering")
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       col = c("black", "red", "blue"), pch = "-", cex = 0.3)
points(metering1, type = "l")
points(metering2, type = "l", col = "red")
points(metering3, type = "l", col = "blue")

#4
plot(filtrado$Time, Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power",
     cex = 0.5)

dev.copy(png, file = "plot4.png")
dev.off()
