makePlot3 <- function() {
  df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
  df$POSIXDate <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
  keep <- grep("^(1|2)/2/2007", df$Date)
  png("plot3.png", height=480, width=480)
  plot(df$POSIXDate[keep], df$Sub_metering_1[keep], type="n", main="", xlab="", ylab="Global Active Power (kilowatts)")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=3, seg.len=1, col=c("black","red","blue"))
  lines(df$POSIXDate[keep], df$Sub_metering_1[keep], col="black")
  lines(df$POSIXDate[keep], df$Sub_metering_2[keep], col="red")
  lines(df$POSIXDate[keep], df$Sub_metering_3[keep], col="blue")
  dev.off()
}
