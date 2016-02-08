data <- read.csv2("household_power_consumption.txt")
head(data, n = 2)
subdata <- subset(data, Date == "1/2/2007"| Date=="2/2/2007")
png(filename="plot2.png", width = 480, height = 480)
GAP<- as.numeric(gsub(",","",subdata$Global_active_power))

df <- subdata
df$datetime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")

plot(df$datetime,GAP, type="n", ylab = "Global Active Power (killowatts)")
lines(df$datetime,GAP)
dev.off()



