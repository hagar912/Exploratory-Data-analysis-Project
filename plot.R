> setwd("I:\NTL\files\exdata_data_household_power_consumption")
Error: '\N' is an unrecognized escape in character string starting ""I:\N"
> setwd("I:/NTL/files/exdata_data_household_power_consumption")
> ##reading data from the file
> full_data<-read.csv("household_power_consumption.txt", header=T, sep=';', na.string="?" ,nrow=2075259)
> ## subset the data according to the time 
> data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
Error in subset(data_full, Date %in% c("1/2/2007", "2/2/2007")) : 
object 'data_full' not found
> data_full<-read.csv("household_power_consumption.txt", header=T, sep=';', na.string="?" ,nrow=2075259)
> 
> data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
> ## subset the data according to the time 
> data1 <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
> #formating the date
> data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
> 
> ##plotting the hist
> hist(data1$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
> dev.copy(Png,"plot1.png",width=480, height=480)
Error in dev.copy(Png, "plot1.png", width = 480, height = 480) : 
object 'Png' not found
> dev.copy(png,"plot1.png",height=480, width=480)
png 
4 
> dev.off()
RStudioGD 
2 
> datetime <- paste(as.Date(data1$Date), data1$Time)
> 
> data1$Datetime <- as.POSIXct(datetime)
> 
> ##the second plot
> with(data1, {
+     plot(Global_active_power~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")})
> dev.copy(png,"plot2.png",height=480, width=480)
png 
4 
> dev.off()
RStudioGD 
2 
> ##third plotting
> with(data1, {
+     plot(Sub_metering_1~Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
+     lines(Sub_metering_2~Datetime,col='Red')
+     lines(Sub_metering_3~Datetime,col='Blue')})
> legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
> legend("topright", col=c("black", "red", "blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
> legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
> dev.copy(png,"plot3.png",height=480, width=480)
png 
4 
> dev.off()
RStudioGD 
2 
> ##plot4
> ##for determining no of row and col
> par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
> with(data1, {
+     plot(Global_active_power~Datetime, type="l", 
+          ylab="Global Active Power (kilowatts)", xlab="")
+     plot(Voltage~Datetime, type="l", 
+          ylab="Voltage (volt)", xlab="")
+     plot(Sub_metering_1~Datetime, type="l", 
+          ylab="Global Active Power (kilowatts)", xlab="")
+     lines(Sub_metering_2~Datetime,col='Red')
+     lines(Sub_metering_3~Datetime,col='Blue')
+     legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
+     plot(Global_reactive_power~Datetime, type="l",ylab="Global Rective Power (kilowatts)",xlab="")
+ })
> dev.copy(png,"plot4.png",height=480, width=480)
png 
4 
> dev.off()