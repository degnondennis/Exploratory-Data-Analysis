homepower <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
homepower$Date <- as.Date(homepower$Date,"%d/%m/%Y")
f0102 <- subset(homepower, Date=="2007-02-01" | Date=="2007-02-02")
#used to read the file into R, change the date format, and selcect only dates of February 1 & 2 2007

datetime <- paste(f0102$Date, f0102$Time)
f0102$datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")
#Combinging date and time variable into datetime, then stripping the date code.

plot(f0102$datetime, f0102$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
#Creating the plot size

lines(f0102$datetime, f0102$Sub_metering_1, col = "black")
lines(f0102$datetime, f0102$Sub_metering_2, col = "red")
lines(f0102$datetime, f0102$Sub_metering_3, col = "blue")
#adding the lines by sub metering type

legend("topright",lty =  1,  col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub-metering_2", "Sub-metering_3") )
#Adding the legend by submeter with color and line

dev.copy(png,file="plot3.png")
#Used to export graph to png file