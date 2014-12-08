library(sqldf)

## read the required data in to the memory
power=read.csv.sql("household_power_consumption.txt", sep=";", header=TRUE, sql="select * from file where Date='1/2/2007' or Date='2/2/2007'")

# get the date time 
power$datetime= strptime(paste(power$Date, power$Time),format="%d/%m/%Y %H:%M:%S")

#open the png device 
png(file="plot4.png")

# create row and col for graphs
par(mfrow=c(2,2))

with(power, {
  ## draw the plot with the given specification
  plot(power$datetime, power$Global_active_power,ylab="Global Active Power", type="l")
  
  ## draw the plot with the given specification
  plot(power$datetime, power$Voltage,type="l", xlab="datetime",ylab="Voltage")

  ## draw the plot with the given specification and no points
  plot(power$datetime, power$Sub_metering_1,ylab="Energy Sub Metering", type="n")
  
  ## insert points in the plot above
  points(power$datetime, power$Sub_metering_1, type="l")
  points(power$datetime, power$Sub_metering_2, type="l", col="red")
  points(power$datetime, power$Sub_metering_3, type="l", col="blue")

  ## draw the plot with the given specification
  plot(power$datetime, power$Global_reactive_power,type="l", xlab="datetime",ylab="Global_reactive_power")
})

## close the png device
dev.off()