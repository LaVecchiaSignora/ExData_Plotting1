
#Creating data by reading txt file
data1<-read.table("household_power_consumption.txt",skip=1,sep=";")
names(data1)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subsetting the data we need 
maindata<-subset(data1,data1$Date=="1/2/2007"|data1$Date=="2/2/2007")

#creating histogram
hist(as.numeric(as.character(maindata$Global_active_power)),col="red",main="Global Active Power", xlab="Global Active Power(kilowatts)")

title(main="Global Active Power")

#Creating png file

dev.copy(png, filename="plot1.png")

dev.off()