#Prior to reading in the data, the lines for the specific days were extracted from the data
# using the following bash code: 
# awk 'NR==1 {print} $1~/^1\/2\/2007/ || $1~/^2\/2\/2007/ {print}' < household_power_consumption.txt > nota_household_data
# This is in accordance with the instructions given on the course web site
# for what to do when you don't want to read such a large
# dataset into memory. 

# Read in the data and define variables
household_data <- read.table("/Users/Sigurgeir/Desktop/coursera/Exploratory/nota_household_data", nrows=3000, h=T, comment.char="", sep=";", na.strings="?" )
date_time <- as.POSIXct(paste(household_data$Date, household_data$Time), format="%d/%m/%Y %H:%M:%S")

# Create plot: 
png("/Users/Sigurgeir/Desktop/coursera/Exploratory/Assignment1/plot4.png")
par(mfcol=c(2,2)) #Plots will be ordered by columns
#First plot
plot(y=household_data$Global_active_power, x=date_time, t="l", ylab="Global Active Power (kilowatts)")
#Second plot
plot(x=date_time, y=household_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab=NA)
lines(x=date_time, y=household_data$Sub_metering_2, type="l", col="red")
lines(x=date_time, y=household_data$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), cex=0.75, box.lty=0)
#Third plot
plot(y=household_data$Voltage, x=date_time, type="l", ylab="Voltage", xlab="datetime")
#Forth plot
plot(y=household_data$Global_reactive_power, x=date_time, ylab="Global_reactive_power", xlab="datetime", type="l", yaxp=c(0, 0.5, 5))
dev.off()
