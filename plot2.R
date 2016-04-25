# Read data file from Data folder in working directory
dataFile <- "./Data/household_power_consumption.txt"
totalData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# Subset from total data the date range used for graphing
graphData <- totalData[totalData$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert date/time classes and create graph in plot2.png file
dateTime <- strptime(paste(graphData$Date, graphData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(graphData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()