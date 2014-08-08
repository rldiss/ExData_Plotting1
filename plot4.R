makePlot4 <- function() {
  df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
  df$POSIXDate <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
  keep <- grep("^(1|2)/2/2007", df$Date)
  png("plot4.png", height=480, width=480)
  par(mfrow=c(2,2))
  # row 1 col 1
  plot(df$POSIXDate[keep], df$Global_active_power[keep], type="l", main="", xlab="", ylab="Global Active Power")
  # row 1 col 2
  plot(df$POSIXDate[keep], df$Voltage[keep], type="l", main="", xlab="datetime", ylab="Voltage")
  # row 2 col 1
  plot(df$POSIXDate[keep], df$Sub_metering_1[keep], type="n", main="", xlab="", ylab="Energy sub metering")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd=3, seg.len=1, col=c("black","red","blue"), bty="n")
  lines(df$POSIXDate[keep], df$Sub_metering_1[keep], col="black")
  lines(df$POSIXDate[keep], df$Sub_metering_2[keep], col="red")
  lines(df$POSIXDate[keep], df$Sub_metering_3[keep], col="blue")
  # row 2 col 2
  plot(df$POSIXDate[keep], df$Global_reactive_power[keep], type="l", main="", xlab="datetime", ylab="Global_reactive_power")
  dev.off()
}
