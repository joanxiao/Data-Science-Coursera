# 2007-02-01 data starts on line 66638 and 2007-02-02 ends on line 69517, with total of 2880 rows
df <- read.table("household_power_consumption.txt", header = TRUE, skip = 66636, sep=";", nrows = 2880,
                 col.names=c("Date", "Time", "GlobalActivePower","GlobalReactivePower",
                             "Voltage","GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3"))

# Combine Date and Time fields in one
df$DateTime <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y%H:%M:%S")

plot(df$DateTime, df$GlobalActivePower, type="l", ylab="Global Active Power (kilowatts)", xlab="")

## Copy plot to a PNG file
dev.copy(png, file = "plot2.png") 
dev.off()
