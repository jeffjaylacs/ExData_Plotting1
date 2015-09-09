## Specify the path for the raw data file
FileName <- "exdata-data-household_power_consumption/household_power_consumption.txt"

## Read the raw data file
RawData <- read.table(file=FileName, header = TRUE, sep=";", na.strings="?")

## Convert to Date variable to a date format
RawData$Date <- as.Date(RawData$Date, format = "%d/%m/%Y")

## Subset to keep only the days of interest
DataSet <- RawData[RawData$Date >= "2007-02-01" & RawData$Date <= "2007-02-02", ]

## Create the histogram
library(datasets)
hist(DataSet$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")

## Save the histogram plot to a .png file in the working directory
dev.copy(png, file = "plot1.png")

## Close the png device
dev.off()
