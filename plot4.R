# Read data file from Data folder in working directory
dataFile <- "./Data/household_power_consumption.txt"
totalData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# Subset from total data the date range used for graphing
graphData <- totalData[totalData$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert date/time classes and create data vectors for graphing
dateTime <- strptime(paste(graphData$Date, graphData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(graphData$Global_active_power)
globalReactivePower <- as.numeric(graphData$Global_reactive_power)
voltage <- as.numeric(graphData$Voltage)
subMetering1 <- as.numeric(graphData$Sub_metering_1)
subMetering2 <- as.numeric(graphData$Sub_metering_2)
subMetering3 <- as.numeric(graphData$Sub_metering_3)

# Create graph in plot4.png file
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
plot(dateTime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(dateTime, subMetering1, type="l", xlab="", ylab="Energy sub metering")
lines(dateTime, subMetering2, type="l", col="red")
lines(dateTime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=1.5, col=c("black", "red", "blue"), bty="n")
plot(dateTime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()