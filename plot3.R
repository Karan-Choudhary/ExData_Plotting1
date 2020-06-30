dataFile<-"./Coursera/R_programming_2nd_course/Assignments/household_power_consumption.txt"
data<-read.table(dataFile,header = TRUE,sep = ";",stringsAsFactors = FALSE,dec = ".")
subsetData<-data[data$Date %in% c("1/2/2007","2/2/2007")]
GlobalActivePower<-as.numeric(subsetData$Global_active_power)


datetime<-strptime(paste(subsetData$Date,subsetData$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
subme1<-as.numeric(subsetData$Sub_metering_1)
subme2<-as.numeric(subsetData$Sub_metering_2)
subme3<-as.numeric(subsetData$Sub_metering_3)

 
png("plot3.png",width = 480,height = 480)
plot(datetime,subme1,type = "l",ylab = "Energy sub metering",xlab ="")
lines(datetime,subme2,type = "l",col="RED")
lines(datetime,subme3,type = "l",col = "Blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,lwd = 2.5,col = c("Black","Red","Blue"))
dev.off()