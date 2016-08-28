##set the working directory

setwd("C:/Users/stang/Desktop/R Directory/Exploratory/Week1")
getwd()

##read in the .txt file
##UCmachine <- read.table("C:/Users/stang/Desktop/R Directory/Exploratory/Week1/household_power_consumption.txt", sep = ";",col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), skip = 66637, nrows = 2880)
UCmachine <- read.table("C:/Users/stang/Desktop/R Directory/Exploratory/Week1/household_power_consumption.txt", sep = ";",skip = 66637, nrows = 2880)
head(UCmachine)

## Plot 1

##select only v3(global active power), and change it to numeric values, otherwise hist() will not work

UCmachine <- UCmachine %>% select(V3) %>% mutate(V3 = as.numeric(as.character(V3)))

##Make a histogram

hist(UCmachine$V3, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (killowatts)", ylab = "Frequency")