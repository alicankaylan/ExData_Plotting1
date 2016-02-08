data <- read.csv2("household_power_consumption.txt")
head(data, n = 2)
subdata <- subset(data, Date == "1/2/2007"| Date=="2/2/2007")
png(filename="plot3.png", width = 480, height = 480)
GAP<- as.numeric(gsub(",","",subdata$Global_active_power))

df <- subdata
df$datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

Sub_metering_1 <- as.numeric(gsub(",","",df$Sub_metering_1))
Sub_metering_2 <- as.numeric(gsub(",","",df$Sub_metering_2)) 
Sub_metering_3 <- as.numeric(gsub(",","",df$Sub_metering_3)) 

plot(df$datetime,Sub_metering_1, type="n", ylab = "Energy sub metering", xlab="")
lines(df$datetime,Sub_metering_1)
lines(df$datetime,Sub_metering_2, col="red")
lines(df$datetime,Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"), lty = c(1,1))


dev.off()



