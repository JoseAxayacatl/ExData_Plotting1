# Read the dataset, and subset the data from 1/2/2007 to 2/2/2007, which corresponds from row 66637 to row 69615
datos<-read.table("household_power_consumption.txt", header = T, sep=";")
dats<-datos[66637:69516,]

#Transforming the data. Global active power must be numeric and Time must be have a POSIXlt format
dats$Global_active_power<-as.numeric(dats$Global_active_power)
dats$Time <- strptime(paste(dats$Date, dats$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#finally I made the plot with the title and x y labels, and saved it with the png device
png("plot2.png", width = 480, height = 480)
plot(dats$Time,dats$Global_active_power,type="l", main="Global Active Power Vs Time", xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()
