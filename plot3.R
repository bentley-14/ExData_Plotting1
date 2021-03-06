library(lubridate)
data <-read.table(unzip("exdata_data_household_power_consumption.zip"), 
                  header = T, sep = ";", na.strings="?")
final <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
final$Date <- dmy(final$Date)
datetime <- paste(final$Date, final$Time)
final$datetime <- as.POSIXct(datetime)

png("plot3.png", width = 480, height = 480)
with(final, {
        plot(Sub_metering_1~datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~datetime,col='Red')
        lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col = c("black", "blue", "red"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()