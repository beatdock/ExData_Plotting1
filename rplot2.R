file <- list.files("R database", full.name = TRUE)[6]
library("sqldf")
data <- read.csv.sql(file, header = TRUE, sep = ";",
                     sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
data$Date.Time <- strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
png("plot2.png", height = 480, width = 480, bg = "transparent")
with(data, plot(Date.Time, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()