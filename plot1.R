# Read data file from Data folder in working directory
dataFile <- "./Data/household_power_consumption.txt"
totalData <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# Subset from total data the dates used for graphing
graphData <- totalData[totalData$Date %in% c("1/2/2007","2/2/2007") ,]

# Create graph in plot1.png file
globalActivePower <- as.numeric(graphData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()