#install.packages("data.table")

library("data.table")

getwd()

setwd("H:/DS/Exploratory-Data-Analysis/project1/data")

#Reads data
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]


powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Date
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("Plot1.png", width=480, height=480)

## Plot - 1
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
