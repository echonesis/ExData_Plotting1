# System Settings
Sys.setlocale("LC_TIME", locale = "C")

# Data Input
inputFilePath <- "../household_power_consumption.txt"
selectedData <- read.table(pipe(paste('grep "^[12]/2/2007" ', inputFilePath)), 
                           sep = ";");
header <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
            "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
            "Sub_metering_3");
names(selectedData) <- header
testDate <- paste(selectedData$Date, selectedData$Time)
selectedData$abbDate <- strptime(testDate, format = "%d/%m/%Y %H:%M:%S")

png("plot4.png")
par("bg" = c("transparent"))
par(mfrow = c(2, 2))
# First Graph
with(selectedData, plot(abbDate, Global_active_power, 
                        xlab = "", ylab = "Global Active Power", type = "l"))
# Second Graph
with(selectedData, plot(abbDate, Voltage, 
                        xlab = "datetime", ylab = "Voltage",
                        type = "l"))
# Third Graph
with(selectedData, {
    plot(abbDate, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(abbDate, Sub_metering_2, col = "red")
    lines(abbDate, Sub_metering_3, col = "blue")
    legend("topright", lty = c(1, 1), bty = "n",
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    })
# Fourth Graph
with(selectedData, plot(abbDate, Global_reactive_power,
                        xlab = "datetime", ylab = "Global_reactive_power",
                        type = "l"))
dev.off()