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

## make plot2
with(power, plot(datetime, Global_active_power, ylab="Global Active Power (kilowatts)", type="l"))

## print to file and release device
dev.copy(png, file="plot2.png")
dev.off()

##########




