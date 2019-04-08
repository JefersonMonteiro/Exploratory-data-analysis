#install.packages("data.table")

library("data.table")

getwd()

setwd("H:/DS/Exploratory-Data-Analysis/project1/data")

#Reads data
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)


powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]


powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

# Filter Date
powerDT <- powerDT[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("Plot2.png", width=480, height=480)

## Plot 2
plot(x = powerDT[, dateTime]
     , y = powerDT[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
