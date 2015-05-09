
# Read the household power consumption data
household_data <- read.table("household_power_consumption.txt", sep = ';', 
                             header = TRUE, na.strings="?")

# Retain only the subset of data for the days of Feb 1 and 2, 2007
valid_dates <- c("1/2/2007", "2/2/2007")
household_data <- subset(household_data, Date %in% valid_dates)

# Create DateTime field based on date and time text
datetime_strings <- paste(household_data$Date, household_data$Time)
datetimes <- strptime(datetime_strings, format="%d/%m/%Y %T")
household_data$DateTime <- as.POSIXct(datetimes)

# Generate plot on plot4.png
png(file="plot4.png", height=480, width=480)

# Set for a 2x2 grid of plots
par(mfrow=c(2,2))

#-----------------
# First plot: 
plot(Global_active_power ~ DateTime, data=household_data, type='l',
	 xlab="", ylab="Global Active Power")

#-----------------
# Second plot:
plot(Voltage ~ DateTime, data=household_data, type='l',
	 xlab="datetime", ylab="Voltage")

#-----------------
# Third plot: Create plot of household metering by subsection.
# Start with the first submetering for the base plot.  
plot(Sub_metering_1 ~ DateTime, data=household_data, type='l',
	 xlab="", ylab="Energy sub metering")

# Add the other two submeterings in red and blue
lines(household_data$DateTime, household_data$Sub_metering_2, col="red")
lines(household_data$DateTime, household_data$Sub_metering_3, col="blue")

# Add a legend at the top to identify the submeterings
legend("topright", lty=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	   col=c("black", "red", "blue"))

#-----------------
# Fourth plot: 
plot(Global_reactive_power ~ DateTime, data=household_data, type='l',
	 xlab="datetime")

# End plots and save to file
dev.off()
