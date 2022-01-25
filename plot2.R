homepower <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
homepower$Date <- as.Date(homepower$Date,"%d/%m/%Y")
f0102 <- subset(homepower, Date=="2007-02-01" | Date=="2007-02-02")
#used to read the file into R, change the date format, and selcect only dates of February 1 & 2 2007

datetime <- paste(f0102$Date, f0102$Time)
f0102$datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")
#Combinging date and time variable into datetime, then stripping the date code.

plot(f0102$datetime, f0102$Global_active_power, type = "n",xlab = "" ,ylab = "Global Active Power (kilowatts) ")
lines(f0102$datetime, f0102$Global_active_power)
#The plot was created then the lines with the data was aded next

dev.copy(png,file="plot2.png")
dev.off
#Used to export graph to png file