# fork 
# clone: cd "mydirectory", and then git clone "http://.... .git"
# calculate memory requirements
# 2,075,259 * 9 * 8 bytes/numeric = 72.45 MB

# read data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# how to read in certain lines according to the content of a column?
dat <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# plot1
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(dat$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()