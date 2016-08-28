##set the working directory and load the lubridate package, which allows you to more easily convert variables to date/time 
library(lubridate)
setwd("C:/Users/stang/Desktop/R Directory/Exploratory/Week1")
getwd()

##read in the .txt file
##UCmachine <- read.table("C:/Users/stang/Desktop/R Directory/Exploratory/Week1/household_power_consumption.txt", sep = ";",col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), skip = 66637, nrows = 2880)
UCmachine <- read.table("C:/Users/stang/Desktop/R Directory/Exploratory/Week1/household_power_consumption.txt", sep = ";",skip = 66637, nrows = 2880)
head(UCmachine)

## Plot 2

##convert v1 to date/time and v3 to numeric

UCmachine <- UCmachine %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
                        V3 = as.numeric(as.character(V3))) %>% select(V1,V3)

##Make a plot

with(UCmachine, plot(V1,V3, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))