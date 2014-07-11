####################################################
## plot1.R
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

## set the output format and size
png("plot1.png", width = 504, height = 504, units = "px")

## generate the graph
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()

