file <- list.files("R database", full.name = TRUE)[6]
library("sqldf")
data <- read.csv.sql(file, header = TRUE, sep = ";",
                     sql = "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")
data$Date.Time <- strptime(paste(data$Date, data$Time),  format = "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
png("plot3.png", height = 480, width = 480, bg = "transparent")
with(data, plot(Date.Time, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l"))
with(data, lines(Date.Time, Sub_metering_2, col = "red"))
with(data, lines(Date.Time, Sub_metering_3, col = "blue"))
legend("topright", legend = names(data[, 7:9]), lty = c("solid", "solid", "solid"), col = c("black", "red", "blue"))
dev.off()