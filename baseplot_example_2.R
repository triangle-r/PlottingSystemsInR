#======================Base plotting system Example2============#
# Data loading, histograms and saving files:
setwd("~/Projects/rgroup/PlottingSystemsInR/")
# Loading the data (household electric power consumption):
download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              destfile = "household_power_consumption.zip", 
              method="curl")
unzip("household_power_consumption.zip")
data <- read.csv("household_power_consumption.txt",sep = ";", header = T,skipNul = T)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")
used_data <- data[which(data$Date >= "2007-02-01" & data$Date <= "2007-02-02"),]
datetime <- strptime(paste(used_data$Date,used_data$Time,sep=' '),"%Y-%m-%d %H:%M:%S") 

# Building a histogram:
hist(as.numeric(as.character(used_data$Global_active_power)),
     col="red",
     xlab="Global active power (kilowatts)", 
     main="Global active power")

# Constructing the .png:
png(file = "plot1.png")
hist(as.numeric(as.character(used_data$Global_active_power)),col="red",xlab="Global active power (kilowatts)", main="Global active power")
dev.off() # Do not forget!

# Constructing the line plot:
plot(datetime,as.numeric(as.character(used_data$Global_active_power)), 
     ylab="Global active power (kilowatts)", 
     xlab="", 
     type = "l")

# Constructing the .png:
png(file = "plot2.png")
plot(datetime,as.numeric(as.character(used_data$Global_active_power)), ylab="Global active power (kilowatts)", xlab="", type = "l")
dev.off()

# Several graphs on one plot
## Constructing the plot:
plot(datetime,as.numeric(as.character(used_data$Sub_metering_1)), xlab="", type = "l", ylab="Energy sub metering")
lines(datetime,as.numeric(as.character(used_data$Sub_metering_2)), col = "red")
lines(datetime,as.numeric(as.character(used_data$Sub_metering_3)), col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, cex=0.7)

## Constructing the .png:
png(file = "plot3.png")
plot(datetime,as.numeric(as.character(used_data$Sub_metering_1)), xlab="", type = "l", ylab="Energy sub metering")
lines(datetime,as.numeric(as.character(used_data$Sub_metering_2)), col = "red")
lines(datetime,as.numeric(as.character(used_data$Sub_metering_3)), col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, cex=0.7)
dev.off()

# Multiple plots
## Constructing the plots:
par(mfrow=c(2,2))
plot(datetime,as.numeric(as.character(used_data$Global_active_power)), ylab="Global active power (kilowatts)", xlab="", type = "l")
plot(datetime,as.numeric(as.character(used_data$Voltage)), ylab="Voltage", xlab="datetime", type = 'l')
plot(datetime,as.numeric(as.character(used_data$Sub_metering_1)), xlab="", type = "l", ylab="Energy sub metering")
lines(datetime,as.numeric(as.character(used_data$Sub_metering_2)), col = "red")
lines(datetime,as.numeric(as.character(used_data$Sub_metering_3)), col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, cex=0.7)
plot(datetime,as.numeric(as.character(used_data$Global_reactive_power)), ylab="Global_reactive_power", xlab="datetime", type = "l")

## Constructing the .png:
png(file = "plot4.png")
par(mfrow=c(2,2))
plot(datetime,as.numeric(as.character(used_data$Global_active_power)), ylab="Global active power (kilowatts)", xlab="", type = "l")
plot(datetime,as.numeric(as.character(used_data$Voltage)), ylab="Voltage", xlab="datetime", type = 'l')
plot(datetime,as.numeric(as.character(used_data$Sub_metering_1)), xlab="", type = "l", ylab="Energy sub metering")
lines(datetime,as.numeric(as.character(used_data$Sub_metering_2)), col = "red")
lines(datetime,as.numeric(as.character(used_data$Sub_metering_3)), col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty=1, cex=0.7)
plot(datetime,as.numeric(as.character(used_data$Global_reactive_power)), ylab="Global_reactive_power", xlab="datetime", type = "l")
dev.off()

#=========End of base plotting system Example 2===========#