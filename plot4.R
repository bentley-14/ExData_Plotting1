library(lubridate)
library(lattice)
data <-read.table(unzip("exdata_data_household_power_consumption.zip"), 
                  header = T, sep = ";", na.strings="?")
final <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
final$Date <- dmy(final$Date)
datetime <- paste(final$Date, final$Time)
final$datetime <- as.POSIXct(datetime)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(final, plot(Global_active_power~datetime, type = "l", 
                 xlab = "", ylab = "Global Active Power (kilowatts)"))
with(final, plot(Voltage~datetime, type = "l", 
                 xlab = "datetime", ylab = "Voltage"))
with(final, {
        plot(Sub_metering_1~datetime, type="l",
              xlab="", ylab = "Energy sub metering")
        lines(Sub_metering_2~datetime,col='Red')
        lines(Sub_metering_3~datetime,col='Blue')
        legend("topright", col = c("black", "blue", "red"), lty = 1, lwd = 2, 
               legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
})
with(final, plot(Global_reactive_power~datetime, type = "l", 
                 xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()