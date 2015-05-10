path2data <- "C:\\Data\\My Documents\\Courses\\Data Science\\Exploratory Data Analysis\\Project\\exdata-data-household_power_consumption\\household_power_consumption.txt"

## Read the names of the variables
datanames <- read.table(path2data, sep=";", nrows=1, colClasses="character")

## Read the data and format

data <- read.table(path2data, sep=";", skip=1, col.names=datanames, colClasses="character")
subdata <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
subdata$Date <- as.Date(subdata$Date, format = '%d/%m/%Y')

## Plot 4
## Concatenate the date and time variables, convert to date/time format
## Plot four graphs

library(lubridate)

time_object <- ymd_hms(paste(subdata$Date, subdata$Time))

par(mfrow=c(2,2))
plot(time_object, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(time_object, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(time_object, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), cex=.75, xjust=1, bty="n")
lines(time_object, subdata$Sub_metering_2, col="red")
lines(time_object, subdata$Sub_metering_3, col="blue")
plot(time_object, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

## Save the plot

dev.copy(png, file = "plot4.png")
dev.off()