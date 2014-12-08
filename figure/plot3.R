library(sqldf)

## read the required data in to the memory
power=read.csv.sql("household_power_consumption.txt", sep=";", header=TRUE, sql="select * from file where Date='1/2/2007' or Date='2/2/2007'")

# get the date time 
power$datetime= strptime(paste(power$Date, power$Time),format="%d/%m/%Y %H:%M:%S")

#open the png device 
png(file="plot3.png")

## draw the plot with the given specification and no points
plot(power$datetime, power$Sub_metering_1,ylab="Energy Sub Metering", xlab=" ", type="n")

## insert points in the plot above
points(power$datetime, power$Sub_metering_1, type="l")
points(power$datetime, power$Sub_metering_2, type="l", col="red")
points(power$datetime, power$Sub_metering_3, type="l", col="blue")

# close the png device
dev.off()
