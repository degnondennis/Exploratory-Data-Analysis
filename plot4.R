homepower <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
homepower$Date <- as.Date(homepower$Date,"%d/%m/%Y")
f0102 <- subset(homepower, Date=="2007-02-01" | Date=="2007-02-02")
#used to read the file into R, change the date format, and selcect only dates of February 1 & 2 2007

datetime <- paste(f0102$Date, f0102$Time)
f0102$datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")
#Combinging date and time variable into datetime, then stripping the date code.

par(mfrow = c(2,2))

plot(f0102$datetime, f0102$Global_active_power, type = "n",xlab = "" ,ylab = "Global Active Power) ")
lines(f0102$datetime, f0102$Global_active_power)
#1st graph


plot(f0102$datetime, f0102$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(f0102$datetime, f0102$Voltage)
#2nd graph

plot(f0102$datetime, f0102$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(f0102$datetime, f0102$Sub_metering_1, col = "black")
lines(f0102$datetime, f0102$Sub_metering_2, col = "red")
lines(f0102$datetime, f0102$Sub_metering_3, col = "blue")
legend("topright",lty =  1,  col = c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub-metering_2", "Sub-metering_3") )
#3rd graph

plot(f0102$datetime, f0102$Global_reactive_power, type = "n",ylim = c(0, 0.5), xlab = "datetime", ylab = "Global_reactive_power")
lines(f0102$datetime, f0102$Global_reactive_power)
#4th graph

dev.copy(png,file="plot4.png")
dev.off
#Used to export graph to png file