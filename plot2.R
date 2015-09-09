## Specify the following raw data file
FileName <- "exdata-data-household_power_consumption/household_power_consumption.txt"

## Read the raw data file
RawData <- read.table(file=FileName, header = TRUE, sep=";", na.strings="?")

## Subset the data to keep only the dates of interest
RawData$Date <- as.Date(RawData$Date, format = "%d/%m/%Y")
DataSet <- RawData[RawData$Date >= "2007-02-01" & RawData$Date <= "2007-02-02", ]

## Create a new index variable consisting of date and time
DataSet$DateTime <- paste(DataSet$Date, DataSet$Time, sep=" ")
DataSet$DateTime <- strptime(DataSet$DateTime, format = "%Y-%m-%d %H:%M:%S")

## Create the plot
library(datasets)
plot(x=DataSet$DateTime, y=DataSet$Global_active_power,  typ='l', ylab="Global Active Power (kilowatts)", xlab="")

## copy the plot to a .png file
dev.copy(png, file = "plot2.png")
dev.off()
