library(sqldf)

## read the required data in to the memory
power=read.csv.sql("household_power_consumption.txt", sep=";", header=TRUE, sql="select * from file where Date='1/2/2007' or Date='2/2/2007'")

#open the png device 
png(file="plot1.png")

## draw the histogram with the given specification
hist(power$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

# close the png device
dev.off()
