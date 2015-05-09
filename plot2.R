
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

# Generate plot on plot2.png
png(file="plot2.png", height=480, width=480)

# Create plot of household global active power.  
plot(Global_active_power ~ DateTime, data=household_data, type='l',
	 xlab="", ylab="Global Active Power (kilowatts)")

# End plot and save to file
dev.off()
