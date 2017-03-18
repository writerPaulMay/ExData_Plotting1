##########
## Set environment and load libraries

if(getwd()!="/home/paul/coursework/power") {setwd("/home/paul/coursework/power")}

library(tidyverse)
library(lubridate)

##########
## Read in the data set

power <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)

## Narrow the data set and create a new column with combined date and time

power <- power %>%
  filter(dmy(Date)=="2007-02-01" | dmy(Date)=="2007-02-02") %>%
  mutate(datetime=dmy_hms(paste(Date, Time)))

## make plot4

par(mfcol=c(2,2))
with(power, {
  plot(datetime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
  plot(datetime, Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black")
  lines(datetime, Sub_metering_2, col="red")
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(datetime, Voltage, type="l")
  plot(datetime, Global_reactive_power, type="l")
})

## print to file and release device
dev.copy(png, file="plot4.png")
dev.off()

##########




