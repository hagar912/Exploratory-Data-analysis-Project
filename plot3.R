setwd("I:\NTL\files\exdata_data_household_power_consumption")
##reading data from the file
data_full<-read.csv("household_power_consumption.txt", header=T, sep=';', na.string="?" ,nrow=2075259)
## subset the data according to the time
data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
#formating the date
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)
##third plotting
with(data1, {
        plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
legend("topright", col=c("black", "red", "blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png,"plot3.png",height=480, width=480)
dev.off()
