## PLOT 3 from WEEK 1 Course Project ##
library(tidyverse)

# Download the file from UCI website (un-comment next two lines if necessary)
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power.zip")
# unzip("power.zip")

# Read the data, merge date-time strings into POSIX date, and filter desired days
unzip("household_power_consumption.zip")
power <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?") %>% 
    as_tibble() %>% 
    mutate(Date = as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")) %>%
    select(-Time) %>%
    filter(Date >= as.POSIXct("2007/2/1") & Date < as.POSIXct("2007/2/3")) %>%
    filter(!is.na(Global_active_power))

# Open PNG device create plot, add lines and legend
png(filename = "plot3.png", width = 480, height = 480, units = "px", 
    bg = "transparent")
plot(power$Date, power$Sub_metering_1, xlab = "", ylab = "Energy sub metering", 
     type = "l")
lines(power$Date, power$Sub_metering_2, col = "Red")
lines(power$Date, power$Sub_metering_3, col = "Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("Black", "Red", "Blue"), lty = 1)
dev.off()