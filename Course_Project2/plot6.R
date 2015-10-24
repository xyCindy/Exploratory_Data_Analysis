# Exploratory Data Analaysis 
# Course Project 2
# Plot 6
setwd("~/Documents/Exploratory_Data_Analysis/Course_Project2")
source("load_data.R")

# Call a png device
png(filename = "./figure/plot6.png", 
    width = 480, 
    height = 480, 
    units = "px",
    bg ="transparent")

# Question 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?
motorIdx <- grep("motor",SCCdata$Short.Name, ignore.case = TRUE)
# Select only SCC column in SCCdata
motorSCC <- SCCdata[motorIdx, 1]
# Select corresponding subset from NEI dataset
motorSub <- NEI[NEI$SCC %in% motorSCC & (fips == "24510"|fips == "06037"), ]
motorBalLA <- aggregate(Emissions ~ year+fips,motorSub,FUN ="sum")
# Replace fips number to location
motorBalLA$fips <- gsub("24510","Baltimore, MD",motorBalLA$fips)
motorBalLA$fips <- gsub("06037","Los Angeles, CA",motorBalLA$fips)

# Plotting function to make plot6
library(ggplot2)
g <- ggplot(motorBalLA, aes(year,Emissions, fill = fips))
g + geom_bar(stat = "identity",position="dodge") +
        labs(title = "Comparison of Total Emissions from Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008",
             x = "Year", 
             y = "Total Emissions")
   
# Close the PNG device
dev.off()