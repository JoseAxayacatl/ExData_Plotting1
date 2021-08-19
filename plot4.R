# Read the dataset, and subset the data from 1/2/2007 to 2/2/2007, which corresponds from row 66637 to row 69615
setwd("../Desktop/")
datos<-read.table("household_power_consumption.txt", header = T, sep=";")
dats<-datos[66637:69516,]

#Transforming data. Sub_metering 1, 2 and 3 must be numeric data as same as global reactive power, voltage and global active power,
#and Time must have a POSIXlt format
dats$Sub_metering_1<-as.numeric(dats$Sub_metering_1)
dats$Sub_metering_2<-as.numeric(dats$Sub_metering_2)
dats$Sub_metering_3<-as.numeric(dats$Sub_metering_3)

dats$Voltage<-as.numeric(dats$Voltage)
dats$Global_active_power<-as.numeric(dats$Global_active_power)
dats$Global_reactive_power<-as.numeric(dats$Global_reactive_power)
dats$Time <- strptime(paste(dats$Date, dats$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#Finally made all the plots in order.
png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(dats$Time, dats$Global_active_power,xlab="", ylab="Global Active Power", type="l")

plot(dats$Time, dats$Voltage, xlab="datatime", ylab="Voltage", type="l")

plot(dats$Time,dats$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(dats$Time,dats$Sub_metering_2, col="red")
lines(dats$Time,dats$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=2, cex=0.7,bty="n")

plot(dats$Time, dats$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datatime")

dev.off()
