# Data Input
selectedData <- read.table(pipe('grep "^[12]/2/2007" "../household_power_consumption.txt"'), 
                   sep = ";");
header <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
            "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2",
            "Sub_metering_3");
names(selectedData) <- header

png("plot1.png")
par("bg" = c("transparent"))
with(selectedData, hist(Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)"))
dev.off()