homepower <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")
homepower$Date <- as.Date(homepower$Date,"%d/%m/%Y")
f0102 <- subset(homepower, Date=="2007-02-01" | Date=="2007-02-02")
#used to read the file into R, change the date format, and selcect only dates of February 1 & 2 2007

hist(f0102$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#Used to create the graph

dev.copy(png,file="plot1.png")
dev.off
#Used to export graph to png file