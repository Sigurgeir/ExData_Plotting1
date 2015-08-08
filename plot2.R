

#Prior to reading in the data, the lines for the specific days were extracted from the data
# using the following bash code: 
# awk 'NR==1 {print} $1~/^1\/2\/2007/ || $1~/^2\/2\/2007/ {print}' < household_power_consumption.txt > nota_household_data
# This is in accordance with the instructions given on the course web site
# for what to do when you don't want to read such a large
# dataset into memory. 

#Read in the data and define variables: 
household_data <- read.table("/Users/Sigurgeir/Desktop/coursera/Exploratory/nota_household_data", nrows=3000, h=T, comment.char="", sep=";", na.strings="?" )
date_time <- as.POSIXct(paste(household_data$Date, household_data$Time), format="%d/%m/%Y %H:%M:%S")

#Construct the plot:
png("/Users/Sigurgeir/Desktop/coursera/Exploratory/Assignment1/plot2.png")
plot(y=household_data$Global_active_power, x=date_time, t="l", ylab="Global Active Power (kilowatts)")
dev.off()
