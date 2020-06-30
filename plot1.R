dataFile<-"./Coursera/R_programming_2nd_course/Assignments/household_power_consumption.txt"
data<-read.table(dataFile,header = TRUE,sep = ";",stringsAsFactors = FALSE,dec = ".")
subsetData<-data[data$Date %in% c("1/2/2007","2/2/2007")]
GlobalActivePower<-as.numeric(subsetData$Global_active_power)
png("plot1.png",width = 480, height = 480)
hist(GlobalActivePower,col = "RED",xlab = "Global Avtive Power (kilowatts)",main = "Global Active Power")
dev.off()
