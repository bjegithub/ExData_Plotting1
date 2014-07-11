####################################################
## plot4.R
## Author: Brian Engelhardt
## Assignment: Exploratory Data Analysis Project 1
## Date: 07/10/2014
##
## The following code assumes the that sqldf package has been installed
## and that the household_power_consumption.txt is in the R working
## directory.
####################################################

## load the library necessary to use read.csv.sql
library(sqldf)

## read only the data for Feb 1s & 2nd 2007
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", header = TRUE, sep = ";")

## generate a new data field that contains the date & the time
data$Date_Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

## set the output format and size
png("plot4.png", width = 504, height = 504, units = "px")

## set the number of rows & cols
par(mfrow = c(2,2))

with(data, {

## generate upper left graph
plot(Date_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## generate upper right graph
plot(Date_Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## generate lower left graph
plot(data$Date_Time, data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(data$Date_Time, data$Sub_metering_2, type = "l", col = "red")
lines(data$Date_Time, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), lty=1, bty="n")

## generate lower right graph
plot(Date_Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

})

dev.off()

