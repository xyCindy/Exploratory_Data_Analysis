# Exploratory Data Analaysis 
# Course Project 2
# Plot 1
setwd("~/Documents/Exploratory_Data_Analysis/Course_Project2")
source("load_data.R")

# Call a png device
png(filename = "./figure/plot1.png", 
    width = 480, 
    height = 480, 
    units = "px",
    bg ="transparent")

# Question 1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 
# 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.
emissionsByYear <- aggregate(Emissions ~ year,FUN ="sum")

# Plotting function to make plot1
barplot(height = emissionsByYear$Emissions,
        names.arg = emissionsByYear$year,
        col = "steelblue",
        main = "Total PM2.5 emission in US from 1999 to 2008",
        xlab = "Year", 
        ylab = expression('Total PM'[2.5]*" Emission"))

# Close the PNG device
dev.off()