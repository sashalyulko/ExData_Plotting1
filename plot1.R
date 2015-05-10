## Path to data file
path2data <- "C:\\Data\\My Documents\\Courses\\Data Science\\Exploratory Data Analysis\\Project\\exdata-data-household_power_consumption\\household_power_consumption.txt"

## Read the names of the variables
datanames <- read.table(path2data, sep=";", nrows=1, colClasses="character")

## Read the data and format

data <- read.table(path2data, sep=";", skip=1, col.names=datanames, colClasses="character")
subdata <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
subdata$Date <- as.Date(subdata$Date, format = '%d/%m/%Y')

## Plot 1

hist(as.numeric(subdata$Global_active_power), main = "Global Active Power",
breaks = 12, col = "red", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png")
dev.off()