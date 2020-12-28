#Creating data by reading txt file
data1<-read.table("household_power_consumption.txt",skip=1,sep=";")
names(data1)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subsetting the data we need 
maindata<-subset(data1,data1$Date=="1/2/2007"|data1$Date=="2/2/2007")

maindata$Date <- as.Date(maindata$Date, format="%d/%m/%Y")
maindata$Time <- strptime(maindata$Time, format="%H:%M:%S")
maindata[1:1440,"Time"] <- format(maindata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
maindata[1441:2880,"Time"] <- format(maindata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


#Creating plot

plot(maindata$Time,maindata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(maindata,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(maindata,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(maindata,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Creating png file
dev.copy(png, filename="plot3.png")
dev.off()
