
# Downloading the file and reading the data.

temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp) 
powerconsumptionData <- read.csv(unz(temp, "household_power_consumption.txt"), sep = ';', na.strings = "?")
unlink(temp)

# Subset the data for two day period and format Date Time
powerconsumption <- subset(powerconsumptionData, Date %in% c("1/2/2007","2/2/2007"))
powerconsumption$Date <- as.Date(powerconsumption$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(powerconsumption$Date), powerconsumption$Time)
powerconsumption$Datetime <- as.POSIXct(datetime)

# Plotting  Plot 2.

with(powerconsumption, {plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)")})

# Writing to file - plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()