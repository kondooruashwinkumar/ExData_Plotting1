
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

# Plotting  Plot 4.

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(powerconsumption, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)")
})

# Writing to file - plot4.png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()