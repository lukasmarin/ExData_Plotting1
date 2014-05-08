all <- read.table("household_power_consumption.txt",
                  sep=";",
                  header=TRUE,
                  na.strings="?")

dates2analyze <- c('1/2/2007','2/2/2007')

x <- all[all$Date %in% dates2analyze,]

x$Timestamp <- strptime(paste(x$Date,x$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

locale_bkp <- Sys.getlocale("LC_TIME")

Sys.setlocale("LC_TIME","English")

png('plot4.png',width=480,height=480,units="px")

par(mfrow=c(2,2))

#First plot
with(x,plot(Timestamp,Global_active_power,type="l",
            main="",
            ylab="Global Active Power",
            xlab=""))

#Second plot
with(x,plot(Timestamp,Voltage,type="l",
            main="",
            ylab="Voltage",
            xlab="datetime"))

#Third plot
with(x,plot(Timestamp,Sub_metering_1,type="l",
            main="",
            ylab="Energy sub metering",
            xlab=""))
lines(x$Timestamp,x$Sub_metering_2,type="l",col="red")
lines(x$Timestamp,x$Sub_metering_3,type="l",col="blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lty=1,
       col=c("black","red","blue"), bty="n")

#Fourth plot
with(x,plot(Timestamp,Global_reactive_power,type="l",
            main="",
            xlab="datetime"))

dev.off()

Sys.setlocale("LC_TIME",locale_bkp)