# Plot 3 script
# -------------

# read the file
full_data<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors =FALSE)

#  select the requested dates 
data<-full_data[full_data$Date=="1/2/2007" | full_data$Date=="2/2/2007",]

# concert Sub_metering variables to numeric
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)

# create a new vector with date and time together
date_and_time<-strptime(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")

# plot the figure
png(filename="plot3.png",width=480,height=480)

plot(date_and_time,data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(date_and_time,data$Sub_metering_2,col="red")
lines(date_and_time,data$Sub_metering_3,col="blue")
legend("topright",lty=c(1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()