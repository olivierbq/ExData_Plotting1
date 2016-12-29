##Load the household power consumption dataset
hpc <- read.csv("~/Documents/Coursera Data Science/Exploratory Data Analysis/household_power_consumption.txt", sep=";", na.strings="?")

## Create a subset containing the date 01-02-2007 untill 02-02-2007
SubHPC <- subset(hpc, Date =="1/2/2007" | Date == "2/2/2007")

## Convert the Date and Time variables to Date/Time classes
datetime <- strptime(paste(SubHPC$Date, SubHPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Setup Graphic device and PNG parameters
png(filename = "plot.3",width = 480, height = 480 )

##Start plotting the data into designated plots
plot(x = datetime, y = SubHPC$Sub_metering_1, type = "l", ylab = "Energy sub metering ", main = "Global Active Power")
lines(x = datetime, y = SubHPC$Sub_metering_2, col = "red")
lines(x = datetime, y = SubHPC$Sub_metering_3, col = "blue")
legend("topright",  c("Sub Metering 1","Sub Metering 2","Sub Metering 3"),lty=1,col=c("black","blue","red"))

## Turn off graphic device
dev.off()