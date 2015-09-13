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

png("plot3.png")
par("bg" = c("transparent"))
with(selectedData, plot(abbDate, Sub_metering_1, 
                        type = "l", 
                        xlab = "", ylab = "Energy sub metering"))
with(selectedData, lines(abbDate, Sub_metering_2, col = "red"))
with(selectedData, lines(abbDate, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1, 1), 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()