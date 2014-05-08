# Plot 4 script
# -------------

# read the file
full_data<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors =FALSE)

#  select the requested dates 
data<-full_data[full_data$Date=="1/2/2007" | full_data$Date=="2/2/2007",]

# convert Global_active_power to numeric and correct NA records
data$Global_active_power[data$Global_active_power=="?"]<-NA
data$Global_active_power<-as.numeric(data$Global_active_power)

# concert Sub_metering variables to numeric
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)

# create a new vector with date and time together
date_and_time<-strptime(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

# convert Voltage & Global_reactive_power to numeric
data$Voltage<-as.numeric(data$Voltage)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)

# plot the figure
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

# upper left plot
plot(date_and_time,data$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

# upper right plot
plot(date_and_time,data$Voltage,
     type="l",
     ylab="Voltage",
     xlab="datetime")

# bottom left plot
plot(date_and_time,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(date_and_time,data$Sub_metering_2,col="red")
lines(date_and_time,data$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "white")

# bottom right plot
plot(date_and_time,data$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")

dev.off()