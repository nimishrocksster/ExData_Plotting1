library(sqldf)

## read the required data in to the memory
power=read.csv.sql("household_power_consumption.txt", sep=";", header=TRUE, sql="select * from file where Date='1/2/2007' or Date='2/2/2007'")

# get the date time 
power$datetime= strptime(paste(power$Date, power$Time),format="%d/%m/%Y %H:%M:%S")

#open the png device 
png(file="plot2.png")

## draw the plot with the given specification
plot(power$datetime, power$Global_active_power,ylab="Global Active Power (kilowatts)", xlab=" ", type="l")

# close the png device
dev.off()


