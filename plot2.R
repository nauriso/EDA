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

# create plot2
png("plot2.png", width = 480, height = 480)
plot<-plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
