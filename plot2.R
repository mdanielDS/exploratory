file <- "./data/household_power_consumption.txt"
data <- read.table(file, header = TRUE, sep = ";", stringsAsFactors = F,quote = "", na.strings = "?")
subdata <- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007"))
 
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$DateTime <- as.POSIXct(paste(subdata$Date, subdata$Time))
png("plot2.png", width=480, height= 480) 
plot(subdata$DateTime, subdata$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="") 
dev.off() 