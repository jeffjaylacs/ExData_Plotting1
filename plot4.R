## Specify the raw data file
FileName <- "exdata-data-household_power_consumption/household_power_consumption.txt"

## Read the raw data file
RawData <- read.table(file=FileName, header = TRUE, sep=";", na.strings="?")

## Subset the data to keep only the dates of interest
RawData$Date <- as.Date(RawData$Date, format = "%d/%m/%Y")
DataSet <- RawData[RawData$Date >= "2007-02-01" & RawData$Date <= "2007-02-02", ]

## Create a new index variable consisting of dates and times
DataSet$DateTime <- paste(DataSet$Date, DataSet$Time, sep=" ")
DataSet$DateTime <- strptime(DataSet$DateTime, format = "%Y-%m-%d %H:%M:%S")

## Create the plots
library(datasets)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(1, 1, 1, 1))
with(DataSet, {
	## plot 1
	plot(x=DateTime, y=Global_active_power,  typ='l', ylab="Global Active Power", xlab="")

	## plot 2
	plot(x=DateTime, y=Voltage, typ='l', ylab="Voltage", xlab="datetime")

	## plot 3
	plot(x=DateTime, y=Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
	lines(x=DateTime, y=Sub_metering_2, col="red")
	lines(x=DateTime, y=Sub_metering_3, col="blue")
	legend("topright", lty=c(1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "))

	## plot 4
	plot(x=DateTime, y=Global_reactive_power, typ='l', ylab="Global Reactive Power", xlab="datetime")
	})


## copy the plot to a .png file
dev.copy(png, file = "plot4.png")
dev.off()
