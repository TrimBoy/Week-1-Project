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
png(filename = "plot2.png")

## Plot the data.

plot(df$Global_active_power, type = "l", xaxt = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
axis(1, at = c(0, 1440, 2880), labels = c("Thur", "Fri", "Sat"))

## Close the graphics device.

dev.off()
