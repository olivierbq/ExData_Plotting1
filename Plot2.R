##Load the household power consumption dataset

hpc <- read.csv("~/Documents/Coursera Data Science/Exploratory Data Analysis/household_power_consumption.txt", sep=";", na.strings="?")

## Create a subset containing the date 01-02-2007 untill 02-02-2007
SubHPC <- subset(hpc, Date =="1/2/2007" | Date == "2/2/2007")

## Convert the Date and Time variables to Date/Time classes
datetime <- strptime(paste(SubHPC$Date, SubHPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Setup Graphic device and PNG parameters
png(filename = "plot.2",width = 480, height = 480 )

##Start plotting the data into designated plots
plot(x = datetime, y = SubHPC$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", main = "Global Active Power")

## Turn off graphic device
dev.off()