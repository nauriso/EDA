# get data
setwd("G:/Data Science/Exploratory Data Analysis/Assignment#1")
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactor=FALSE)

#Set locale to Eng (days)
Sys.setlocale("LC_TIME", "English")
# convert Date string to Date
power$Date=as.Date(power$Date, format='%d/%m/%Y')
#subset data
data=subset(power, Date>="2007-02-01"& Date<="2007-02-02")


# Create data for x-axis
# merge date & time in one column
data$datetime=paste(data$Date, data$Time)
#convert to date/time format
data$datetime=as.POSIXct(data$datetime)

# Create plot#3

png("plot3.png", width = 480, height = 480)
plot(data$datetime,data$Sub_metering_1,  type="l", xlab="", ylab="Energy sub metering",)
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "blue", "red"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5))
dev.off()