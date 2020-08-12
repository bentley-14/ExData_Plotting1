library(lubridate)
data <-read.table(unzip("exdata_data_household_power_consumption.zip"), 
                  header = T, sep = ";", na.strings="?")
final <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
final$Date <- dmy(final$Date)
datetime <- paste(final$Date, final$Time)
final$datetime <- as.POSIXct(datetime)

png("plot2.png", width = 480, height = 480)
with(final, plot(Global_active_power~datetime, type = "l", 
                 xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()