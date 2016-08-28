##set the working directory and load the lubridate package, which allows you to more easily convert variables to date/time 
library(lubridate)
setwd("C:/Users/stang/Desktop/R Directory/Exploratory/Week1")
getwd()

##read in the .txt file
##UCmachine <- read.table("C:/Users/stang/Desktop/R Directory/Exploratory/Week1/household_power_consumption.txt", sep = ";",col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), skip = 66637, nrows = 2880)
UCmachine <- read.table("C:/Users/stang/Desktop/R Directory/Exploratory/Week1/household_power_consumption.txt", sep = ";",skip = 66637, nrows = 2880)
head(UCmachine)

## Plot 2

##convert v1 to date/time and v3 through v9 as numeric

UCmachine <- UCmachine %>% mutate(V1 = as.POSIXct(dmy_hms(as.character(paste(V1, V2)))),
V3 = as.numeric(as.character(V3)),
V4 = as.numeric(as.character(V4)),
V5 = as.numeric(as.character(V5)),
V7 = as.numeric(as.character(V7)),
V8 = as.numeric(as.character(V8)),
V9 = as.numeric(as.character(V9)))


##set a global parameter to combine the plots you are about to construct

par(mfrow = c(2, 2))


##Make a plot(multiples)

with(UCmachine, plot(V1,V3, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(UCmachine, plot(V1,V5, type="l", xlab = "datetime", ylab = "Voltage"))
with(UCmachine, plot(V1,V7, type="n", xlab = "", ylab = "Energy Sub Metering"))
with(UCmachine, points(V1,V7, col="black", type="l"))
with(UCmachine, points(V1,V8, col="red", type="l"))
with(UCmachine, points(V1,V9, col="blue", type="l"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       
##Name the legend key
legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

with(UCmachine, plot(V1,V4, type="l", xlab = "datetime", ylab = "Global_reactive_power"))