makePlot1 <- function() {
  df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
  hist(df$Global_active_power[grep("^(1|2)/2/2007", df$Date)], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
  dev.copy(png, "plot1.png", width=480, height=480)
  dev.off()
}
