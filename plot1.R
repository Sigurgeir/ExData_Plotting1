
#Prior to reading in the data, the lines for the specific days were extracted from the data
# using the following bash code: 
# awk 'NR==1 {print} $1~/^1\/2\/2007/ || $1~/^2\/2\/2007/ {print}' < household_power_consumption.txt > nota_household_data
# This is in accordance with the instructions given on the course web site
# for what to do when you don't want to read such a large
# dataset into memory. 

#Read in the data
household_data <- read.table("/Users/Sigurgeir/Desktop/coursera/Exploratory/nota_household_data", nrows=3000, h=T, comment.char="", sep=";", na.strings="?" )

# Construct plot1:
png("/Users/Sigurgeir/Desktop/coursera/Exploratory/Assignment1/plot1.png")
hist(household_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()