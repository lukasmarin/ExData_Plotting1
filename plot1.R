all <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")

dates2analyze <- c('1/2/2007','2/2/2007')

x <- all[all$Date %in% dates2analyze,]

x$Timestamp <- strptime(paste(x$Date,x$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

png('plot1.png',width=480,height=480,units="px")

hist(x$Global_active_power,col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency")

dev.off()