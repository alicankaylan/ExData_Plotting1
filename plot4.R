data <- read.csv2("household_power_consumption.txt")
head(data, n = 2)
subdata <- subset(data, Date == "1/2/2007"| Date=="2/2/2007")
png(filename="plot4.png", width = 480, height = 480)
GAP<- as.numeric(gsub(",","",subdata$Global_active_power))


df <- subdata
df$datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")
Sub_metering_1 <- as.numeric(gsub(",","",df$Sub_metering_1))
Sub_metering_2 <- as.numeric(gsub(",","",df$Sub_metering_2)) 
Sub_metering_3 <- as.numeric(gsub(",","",df$Sub_metering_3)) 


par( mfrow =c(2,2), mar = c(4,4,2,1) )

plot(df$datetime,GAP, type="n", ylab = "Global Active Power", xlab="")
lines(df$datetime,GAP)

plot(df$datetime,df$Voltage, type="n", ylab = "Voltage", xlab="datetime")
lines(df$datetime,df$Voltage)

plot(df$datetime,Sub_metering_1, type="n", ylab = "Energy sub metering", xlab="")
lines(df$datetime,Sub_metering_1)
lines(df$datetime,Sub_metering_2, col="red")
lines(df$datetime,Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lty = c(1,1))

plot(df$datetime,df$Global_reactive_power, type="n", ylab = "Global_reactive_power", xlab="datetime")
lines(df$datetime,df$Global_reactive_power)

dev.off()



