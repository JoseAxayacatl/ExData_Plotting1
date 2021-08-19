# Read the dataset, and subset the data from 1/2/2007 to 2/2/2007, which corresponds from row 66637 to row 69615

datos<-read.table("household_power_consumption.txt", header = T, sep=";")
dats<-datos[66637:69516,]

#Transforming data. Sub_metering 1, 2 and 3 must be numeric data and Time must have a POSIXlt format
dats$Sub_metering_1<-as.numeric(dats$Sub_metering_1)
dats$Sub_metering_2<-as.numeric(dats$Sub_metering_2)
dats$Sub_metering_3<-as.numeric(dats$Sub_metering_3)

dats$Time <- strptime(paste(dats$Date, dats$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#Finally I made the plot. First only plor the Sub_metering 1 and after that add the lines for Sub_metering 2 and 3
#Saved it with PNG device
png("plot3.png", width = 480, height = 480)
plot(dats$Time,dats$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(dats$Time,dats$Sub_metering_2, col="red")
lines(dats$Time,dats$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=2)
dev.off()
