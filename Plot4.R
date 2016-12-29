##Load the household power consumption dataset

hpc <- read.csv("~/Documents/Coursera Data Science/Exploratory Data Analysis/household_power_consumption.txt", sep=";", na.strings="?")

## Create a subset containing the date 01-02-2007 untill 02-02-2007
SubHPC <- subset(hpc, Date =="1/2/2007" | Date == "2/2/2007")

## Convert the Date and Time variables to Date/Time classes
datetime <- strptime(paste(SubHPC$Date, SubHPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Setup Graphic device and PNG parameters
png(filename = "plot.4",width = 480, height = 480 )

##Start plotting the data into designated plots
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(SubHPC, {
  plot(x = datetime , y = Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
  plot(x = datetime , y = Voltage, type = "l" )
  
plot(x = datetime , y = Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering " )
lines(x = datetime , y = Sub_metering_2, col = "red")
lines(x = SubHPCdt, y = Sub_metering_3, col = "blue")
legend("topright",  legend=names(SubHPC)[7:9],lty=1,col=c("black","blue","red"))
plot(x = datetime , y = Global_reactive_power , type = "l" )
})

## Turn off graphic device
dev.off()