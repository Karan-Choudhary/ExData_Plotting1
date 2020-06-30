dataFile<-"./Coursera/R_programming_2nd_course/Assignments/household_power_consumption.txt"
data<-read.table(dataFile,header = TRUE,sep = ";",stringsAsFactors = FALSE,dec = ".")
subsetData<-data[data$Date %in% c("1/2/2007","2/2/2007")]


GlobalActivePower<-as.numeric(subsetData$Global_active_power)
datetime<-strptime(paste(subsetData$Date,subsetData$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
subme1<-as.numeric(subsetData$Sub_metering_1)
subme2<-as.numeric(subsetData$Sub_metering_2)
subme3<-as.numeric(subsetData$Sub_metering_3)
voltage<-as.numeric(subsetData$Voltage)
globalreactivepower<-as.numeric(subsetData$Global_reactive_power)





png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))
plot(datetime,GlobalActivePower,cex=0.2,type = "l",xlab = "",ylab = "Global Active Power")
plot(datetime,voltage,type = "l",xlab = "datetime",ylab = "Voltage")
plot(datetime,subme1,type = "l",xlab = "",ylab = "Energy sub metering")
lines(datetime,subme2,type = "l",col="Red")
lines(datetime,subme3,type="l",col="Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=,lwd = 2.5,bty = 0,col = c("Black","Red","Blue"))
plot(datetime,globalreactivepower,type="l",xlab = "datetime",ylab="Global_reactive_power")
dev.off()