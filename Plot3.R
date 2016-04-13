#load the data

Edataset <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings = "?")

#converting Character from character to Date
Edataset$Date <- as.Date(Edataset$Date, format="%d/%m/%Y")

# Retrieving data from initial Data BETWWEN    2007-02-01  and 2007-02-02
Electricity<- subset(Edataset, subset = (Date >="2007-02-01" & Date <="2007-02-02"))


#converting dates 
Edate <- paste(Electricity$Date, Electricity$Time)
datetime <- as.POSIXct(Edate)

#ploting the Energy sub metering

with(Electricity, {
        plot(Sub_metering_1~datetime, type="l",
             ylab="Energy Sub Metering", xlab="")
        lines(Sub_metering_2~datetime,col='red')
        lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#saving  the Histogram in PNG

dev.copy(png, file="plot3.png",height = 480, width=480 )

dev.off()

