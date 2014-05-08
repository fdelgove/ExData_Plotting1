# Plot 1 script
# -------------

# read the file
 full_data<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors =FALSE)

#  select the requested dates
 data<-full_data[full_data$Date=="1/2/2007" | full_data$Date=="2/2/2007",]

# convert Global_active_power to numeric and correct NA records
 data$Global_active_power[data$Global_active_power=="?"]<-NA
 data$Global_active_power<-as.numeric(data$Global_active_power)

# plot the figure
png(filename="plot1.png",width=480,height=480)

hist(data$Global_active_power,
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.off()