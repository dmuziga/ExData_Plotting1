
#load the data

Edataset <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings = "?")

#converting Character from character to Date
Edataset$Date <- as.Date(Edataset$Date, format="%d/%m/%Y")

# Retrieving data from initial Data BETWWEN    2007-02-01  and 2007-02-02
Electricity<- subset(Edataset, subset = (Date >="2007-02-01" & Date <="2007-02-02"))


#converting dates 
Edate <- paste(Electricity$Date, Electricity$Time, sep=" ")
datetime <- strptime(Edate, "%d/%m/%Y %H:%M:%S") 

#ploting the Histogram

hist(Electricity$Global_active_power, xlab = "Global Active Power (Kilowatts)", ylab = "Frequency",
     main = "Global Active Power",col = "Grey")

#saving  the Histogram in PNG

dev.copy(png, file="plot1.png",height = 480, width=480 )

dev.off()


