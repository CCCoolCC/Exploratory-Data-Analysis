# fork 
# clone: cd "mydirectory", and then git clone "http://.... .git"
# calculate memory requirements
# 2,075,259 * 9 * 8 bytes/numeric = 72.45 MB

# read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# how to read in certain lines according to the content of a column?
dat <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# plot4
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
x <- paste(dat$Date,dat$Time)
t <- strptime(x,"%Y-%m-%d %H:%M:%S")
#1,1
plot(t, dat$Global_active_power,type = "l", xlab = "", ylab = "Global Active Power")
#1,2
plot(t, dat$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")
#2,1
plot(t, dat$Sub_metering_1,type="n", xlab="", ylab = "Energy sub metering")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty = 1, bty = "n")
points(t, dat$Sub_metering_1,type="l", col="black")
points(t, dat$Sub_metering_2, type="l", col="red")
points(t, dat$Sub_metering_3, type="l", col="blue")
#2,2
plot(t, dat$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
