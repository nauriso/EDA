# get data
setwd("G:/Data Science/Exploratory Data Analysis/Assignment#1")
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactor=FALSE)

#Set locale to Eng (days)
Sys.setlocale("LC_TIME", "English")
# convert Date string to Date
power$Date=as.Date(power$Date, format='%d/%m/%Y')
#subset data
data=subset(power, Date>="2007-02-01"& Date<="2007-02-02")

# Create plot#1
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power,col="red", xlab="Golabl Active Power (kilowats)", main="Global Active Power")
dev.off()

