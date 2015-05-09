
# Read the household power consumption data
household_data <- read.table("household_power_consumption.txt", sep = ';', 
                             header = TRUE, na.strings="?")

# Retain only the subset of data for the days of Feb 1 and 2, 2007
valid_dates <- c("1/2/2007", "2/2/2007")
household_data <- subset(household_data, Date %in% valid_dates)

# Generate plot on plot1.png
png(file="plot1.png", height=480, width=480)

# Create histogram of household global active power.  
hist(household_data$Global_active_power, col="red", 
	 main="Global Active Power", 
	 xlab="Global Active Power (kilowatts)")

# End plot and save to file
dev.off()
