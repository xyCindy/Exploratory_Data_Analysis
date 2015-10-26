# Exploratory Data Analaysis 
# Course Project 2
# Plot 3
setwd("~/Documents/Exploratory_Data_Analysis/Course_Project2")
source("load_data.R")

# Call a png device
png(filename = "./figure/plot3.png", 
    width = 480, 
    height = 480, 
    units = "px",
    bg ="transparent")

# Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in emissions
# from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.
emissionBal <- NEI[fips == "24510", ]
emissionsByYearType <- aggregate(Emissions ~ year + type, emissionBal, FUN  ="sum")
# Plotting function to make plot3
library(ggplot2)
g <- ggplot(emissionsByYearType, aes(year,Emissions, fill = type))
g + facet_wrap(~type) + geom_bar(stat = "identity") +
        labs(title = "Total Emissions by type in Baltimore",
                 x = "Year", 
                 y = "Total Emissions")

# Close the PNG device
dev.off()