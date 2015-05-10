## Path to data file
path2data <- "C:\\Data\\My Documents\\Courses\\Data Science\\Exploratory Data Analysis\\Project\\exdata-data-household_power_consumption\\household_power_consumption.txt"

## Read the names of the variables
datanames <- read.table(path2data, sep=";", nrows=1, colClasses="character")

## Read the data and format

data <- read.table(path2data, sep=";", skip=1, col.names=datanames, colClasses="character")
subdata <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
subdata$Date <- as.Date(subdata$Date, format = '%d/%m/%Y')

## Plot 2
## Concatenate the date and time variables, convert to date/time format and
## plot vs Global Active Power

library(lubridate)

time_object <- ymd_hms(paste(subdata$Date, subdata$Time))
plot(time_object, subdata$Global_active_power, type = "l", xlab = "",
ylab = "Global Active Power (kilowatts)")

## Save png file

dev.copy(png, file = "plot2.png")
dev.off()