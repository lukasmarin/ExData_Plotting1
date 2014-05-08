all <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

dates2analyze <- c('1/2/2007','2/2/2007')

x <- all[all$Date %in% dates2analyze,]

x$Timestamp <- strptime(paste(x$Date,x$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

locale_bkp <- Sys.getlocale("LC_TIME")

Sys.setlocale("LC_TIME","English")

png('plot2.png',width=480,height=480,units="px")

with(x,plot(Timestamp,Global_active_power,type="l",
            main="",
            ylab="Global Active Power (kilowatts)",
            xlab=""))

dev.off()

Sys.setlocale("LC_TIME",locale_bkp)
