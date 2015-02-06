file <- list.files("R database", full.name = TRUE)[6]
library("sqldf")
data <- read.csv.sql(file, header = TRUE, sep = ";",
        sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
data$Date.Time <- strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S")
png("plot1.png", height = 480, width = 480, bg = "transparent")
with(data, hist(Global_active_power, main = "Global Active Power",
                col = "red", xlab = "Global Active Power (kilowatts)"))
dev.off()