
#load the data

Edataset <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings = "?")

#converting Character from character to Date
Edataset$Date <- as.Date(Edataset$Date, format="%d/%m/%Y")

# Retrieving data from initial Data BETWWEN    2007-02-01  and 2007-02-02
Electricity<- subset(Edataset, subset = (Date >="2007-02-01" & Date <="2007-02-02"))


#converting dates 
Edate <- paste(Electricity$Date, Electricity$Time)
datetime <- as.POSIXct(Edate)

#ploting the GLOBAL_aCTIVE_POWER IN TIME
plot(Electricity$Global_active_power~datetime,type="l",xlab = "", ylab = "Global Active Power(kilowatts)")
#saving  Graph

dev.copy(png, file="plot2.png",height = 480, width=480 )

dev.off()


