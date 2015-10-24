# Exploratory Data Analaysis 
# Course Project 2
# Plot 5
setwd("~/Documents/Exploratory_Data_Analysis/Course_Project2")
source("load_data.R")

# Call a png device
png(filename = "./figure/plot5.png", 
    width = 480, 
    height = 480, 
    units = "px",
    bg ="transparent")

# Question 5
# How have emissions from motor vehicle sources changed from 1999–2008 in 
# Baltimore City?
motorIdx <- grep("motor",SCCdata$Short.Name, ignore.case = TRUE)
# Select only SCC column in SCCdata
motorSCC <- SCCdata[motorIdx, 1]
# Select corresponding subset from NEI dataset
motorSub <- NEI[NEI$SCC %in% motorSCC & fips == "24510", ]
motorEmission <- aggregate(Emissions ~ year,motorSub,FUN ="sum")

# Plotting function to make plot5
barplot(height = motorEmission$Emissions,
        names.arg = motorEmission$year,
        col = "pink",
        main = "Total Emissions from motor vehicle source \nin Baltimore MD from 1999 to 2008",
        xlab = "Year", 
        ylab = expression('Total PM'[2.5]*" Emission"))

# Close the PNG device
dev.off()