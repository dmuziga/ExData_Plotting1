#load the data

Edataset <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings = "?")

#converting Character from character to Date
Edataset$Date <- as.Date(Edataset$Date, format="%d/%m/%Y")

# Retrieving data from initial Data BETWWEN    2007-02-01  and 2007-02-02
Electricity<- subset(Edataset, subset = (Date >="2007-02-01" & Date <="2007-02-02"))


#converting dates 
Edate <- paste(Electricity$Date, Electricity$Time)
datetime <- as.POSIXct(Edate)

#ploting the graph 

par(mfrow = c(2,2))

plot(Electricity$Global_active_power~datetime,type="l",xlab = "", ylab = "Global Active Power(kilowatts)")
plot(Electricity$Voltage~datetime, type= "l", xlab = "datetime", ylab = "Voltage")

with(Electricity, {
        plot(Sub_metering_1~datetime, type="l",
             ylab="Energy Sub Metering", xlab="")
        lines(Sub_metering_2~datetime,col='red')
        lines(Sub_metering_3~datetime,col='Blue')
})

plot(Electricity$Global_reactive_power~datetime, type= "l", xlab = "datetime", ylab = "Global_reactive_power")

#saving  the Graph in PNG
dev.copy(png,file="Plot4.png", height = 480, width=480 )

dev.off()