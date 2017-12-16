## Read in the power consumption data.

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Load lubridate library.

library(lubridate)

## Convert the "Date" and "Time" columns to date/time classes using lubridate.

df$Date <- dmy(df$Date)
df$Time <- hms(df$Time)

## Subset the data to include only the dates of interest.

day1 <- ymd("2007-2-1")
day2 <- ymd("2007-2-2")
df <- with(df, df[Date == day1 | Date == day2, ])

## Set the graphics device?
png(filename = "plot4.png")

## Plot the data.

par(mfrow = c(2,2))
plot(df$Global_active_power, type = "l", xaxt = "n", ylab = "Global Active Power", xlab = "")
axis(1, at = c(0, 1440, 2880), labels = c("Thur", "Fri", "Sat"))
plot(df$Voltage, type = "l", ylab = "Voltage", xaxt = "n", xlab = "datetime")
axis(1, at = c(0, 1440, 2880), labels = c("Thur", "Fri", "Sat"))
plot(df$Sub_metering_1, type = "l", xlab = "",  ylab = "Energy sub metering", xaxt = "n")
axis(1, at = c(0, 1440, 2880), labels = c("Thur", "Fri", "Sat"))
lines(df$Sub_metering_2, col = "red")
lines(df$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n", cex = 0.9, col = c("black", "red", "blue"), lty = c(1,1,1))
plot(df$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xaxt = "n", xlab = "datetime")
axis(1, at = c(0, 1440, 2880), labels = c("Thur", "Fri", "Sat"))

## Close the graphics device.

dev.off()
