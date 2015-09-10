# System Settings
Sys.setlocale("LC_TIME", locale = "C")

# Data Input
selectedData <- read.table(pipe('grep "^[12]/2/2007" "../household_power_consumption.txt"'), 
                           sep = ";");
header <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
            "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
            "Sub_metering_3");
names(selectedData) <- header
testDate <- paste(selectedData$Date, selectedData$Time)
selectedData$abbDate <- strptime(testDate, format = "%d/%m/%Y %H:%M:%S")

png("plot2.png")
par("bg" = c("transparent"))
with(selectedData, plot(abbDate, 
                        Global_active_power, 
                        type = "l", 
                        xlab = "", 
                        ylab = "Global Active Power (kilowatts)"))
dev.off()