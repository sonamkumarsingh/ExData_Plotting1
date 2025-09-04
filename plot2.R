# Read data and create datetime
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
sub_data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))
sub_data$datetime <- as.POSIXct(paste(sub_data$Date, sub_data$Time))

# Plot 2: Global Active Power over time
png("plot2.png", width = 480, height = 480)
plot(sub_data$datetime, sub_data$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
