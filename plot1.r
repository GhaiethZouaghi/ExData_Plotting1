datapath="~/Downloads/Coursera/Data Science Specialization/Exploratory data analysis/Project 1/household_power_consumption.txt"
figurepath="~/Downloads/Coursera/Data Science Specialization/Exploratory data analysis/Project 1/ExData_Plotting1/"

mydata <- read.csv(datapath, na.strings="?", sep =";", header=TRUE,skip=66636, nrows = 2880)
colnames(mydata) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

png(filename = paste(figurepath,"plot1.png",sep=""),width = 480, height = 480,bg = "transparent")
hist(x = mydata$Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)", col="red")
dev.off()

