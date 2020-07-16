datos <- read.csv("~/Downloads/household_power_consumption.txt", header=FALSE, sep=";")

uno <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
         "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

names(datos) <- c(uno)

datosf <- datos[-1, ]

library(tidyverse)
filtrado <- filter(datosf, Date %in% c("1/2/2007", "2/2/2007"))


grafico0 <- as.character(filtrado$Global_active_power)
grafico1 <- as.numeric(grafico0)
hist(grafico1, main = "Global Active Power", col = "red", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()









