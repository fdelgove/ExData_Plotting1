# Plot 2 script
# -------------

# read the file
full_data<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors =FALSE)

#  select the requested dates 
data<-full_data[full_data$Date=="1/2/2007" | full_data$Date=="2/2/2007",]

# convert Global_active_power to numeric and correct NA records
 data$Global_active_power[data$Global_active_power=="?"]<-NA
 data$Global_active_power<-as.numeric(data$Global_active_power)

# create a new vector with date and time together
date_and_time<-strptime(paste(data$Date,data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")


# plot the figure
png(filename="plot2.png",width=480,height=480)

plot(date_and_time,data$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

dev.off()