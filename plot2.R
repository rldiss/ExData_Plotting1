makePlot2 <- function() {
  df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
  df$POSIXDate <- as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
  keep <- grep("^(1|2)/2/2007", df$Date)
  plot(df$POSIXDate[keep], df$Global_active_power[keep], type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")
  dev.copy(png, "plot2.png", height=480, width=480)
  dev.off()
}
