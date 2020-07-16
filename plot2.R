datos <- read.csv("~/Downloads/household_power_consumption.txt", header=FALSE, sep=";")

uno <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
         "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

names(datos) <- c(uno)

datosf <- datos[-1, ]

library(tidyverse)
filtrado <- filter(datosf, Date %in% c("1/2/2007", "2/2/2007"))

voltag <- as.character(filtrado$Voltage)
voltage <- as.numeric(voltag)
Global_active <- as.character(filtrado$Global_active_power)
Global_active_power <- as.numeric(Global_active)

plot(Global_active_power, type = "s",
     ylab = "Global Active Power (kilowatts)", xlab = "Thu         fri          sat")

dev.copy(png, file = "plot2.png")
dev.off()


