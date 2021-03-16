
# Downloading the file and reading the data.

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp) 
powerconsumptionData <- read.csv(unz(temp, "household_power_consumption.txt"), sep = ';', na.strings = "?")
unlink(temp)

# Subset the data for two day period 
powerconsumption <- subset(powerconsumptionData, Date %in% c("1/2/2007","2/2/2007"))

# Plotting histogram - Plot 1.
hist(powerconsumption$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Writing to file - plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()