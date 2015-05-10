file <- "./data/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = F,quote = "", na.strings = "?")
subdata <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))
 
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))


png("plot3.png", width=480, height= 480) 

plot(subdata$DateTime, subdata$Sub_metering_1, type= "l", ylab= "Energy sub metering", xlab="") 
lines(subdata$DateTime, subdata$Sub_metering_2, type="l", col="red") 
lines(subdata$DateTime, subdata$Sub_metering_3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue")) 
dev.off() 
