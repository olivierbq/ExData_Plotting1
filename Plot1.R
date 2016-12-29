##Load the household power consumption dataset

#hpc <- read.csv("~/Documents/Coursera Data Science/Exploratory Data Analysis/household_power_consumption.txt", sep=";", na.strings="?")
#strptime(SubHPC$Time,format = "", tz="")


SubHPC <- subset(hpc, Date =="1/2/2007" | Date == "2/2/2007")
#strptime(SubHPC$Time,format = "", tz="")

png(filename = "plot.1",width = 480, height = 480, units = "" )
hist(SubHPC$Global_active_power, main = "Global Active Power", col = "red")
dev.off()