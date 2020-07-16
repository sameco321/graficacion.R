datos <- read.csv("~/Downloads/household_power_consumption.txt", header=FALSE, sep=";")

uno <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
         "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

names(datos) <- c(uno)

datosf <- datos[-1, ]

library(tidyverse)
filtrado <- filter(datosf, Date %in% c("1/2/2007", "2/2/2007"))


metering11 <- as.character(filtrado$Sub_metering_1)
metering22 <- as.character(filtrado$Sub_metering_2)
metering33 <- as.character(filtrado$Sub_metering_3)
metering1 <- as.numeric(metering11)
metering2 <- as.numeric(metering22)
metering3 <- as.numeric(metering33)

plot(metering1 , type = "n", ylab = "Energy sub metering",
     xlab = "Thu                fre                sat")
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       col = c("black", "red", "blue"), pch = "-", cex = 0.5)

points(metering1, type = "l")
points(metering2, type = "l", col = "red")
points(metering3, type = "l", col = "blue")

dev.copy(png, file = "plot3.png")
dev.off()
