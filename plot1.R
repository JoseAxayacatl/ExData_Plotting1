# Read the dataset, and subset the data from 1/2/2007 to 2/2/2007, which corresponds from row 66637 to row 69615

datos<-read.table("household_power_consumption.txt", header = T, sep=";")
dats<-datos[66637:69516,]

#Transforming the data. Global active power must be a numeric variable
dats$Global_active_power<-as.numeric(dats$Global_active_power)

#Make the histogram with title, x label and bars color red. Save it with PNG device
png("plot1.png", width = 480, height = 480)
hist(dats$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()
