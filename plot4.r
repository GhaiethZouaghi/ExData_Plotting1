datapath="~/Downloads/Coursera/Data Science Specialization/Exploratory data analysis/Project 1/household_power_consumption.txt"
figurepath="~/Downloads/Coursera/Data Science Specialization/Exploratory data analysis/Project 1/ExData_Plotting1/"

mydata <- read.csv(datapath, na.strings="?", sep =";", header=TRUE,skip=66636, nrows = 2880)
colnames(mydata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
mydata$Date_Time<-paste(mydata$Date,mydata$Time,sep=" ")
mydata$Date_Time <- strptime(mydata$Date_Time, "%d/%m/%Y %H:%M:%S")

png(filename = paste(figurepath,"plot4.png",sep=""), width = 480, height = 480, bg = "transparent")
par(mfrow = c(2,2))
#first plot topleft
with(mydata, plot(x=Date_Time,y=Global_active_power,type="n",xlab="",ylab="Global Active Power"))
with(mydata, lines(x=Date_Time,y=Global_active_power))

#second plot topright
with(mydata, plot(x=Date_Time,y=Voltage,type="n",xlab="datetime",ylab="Voltage"))
with(mydata, lines(x=Date_Time,y=Voltage))

#third plot bottom left
with(mydata,plot(x=Date_Time,y=Sub_metering_1, type="n",xlab = "", ylab = "Energy sub metering",ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))))
with(mydata,lines(x=Date_Time,y=Sub_metering_1))
par(new=TRUE, col="red")
with(mydata,plot(x=Date_Time,y=Sub_metering_2, type="n",axes = FALSE, xlab= "", ylab ="",ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))))
with(mydata,lines(x=Date_Time,y=Sub_metering_2))
par(new=TRUE,col="blue")
with(mydata,plot(x=Date_Time,y=Sub_metering_3, type="n",axes = FALSE, xlab="", ylab="",ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))))
with(mydata,lines(x=Date_Time,y=Sub_metering_3))
par(new=TRUE,col="black")
legend("topright", col = c('black','red', 'blue'), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1) ,bty = "n")

#fourth plot bottom right
with(mydata, plot(x=Date_Time,y=Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power"))
with(mydata, lines(x=Date_Time,y=Global_reactive_power))

dev.off()

