library(lubridate)
data <-read.table(unzip("exdata_data_household_power_consumption.zip"), 
                  header = T, sep = ";", na.strings="?")
final <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
final$Date <- dmy(final$Date)

png("plot1.png", width = 480, height = 480)
hist(final$Global_active_power, breaks = 12, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
