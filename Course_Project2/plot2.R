# Exploratory Data Analaysis 
# Course Project 2
# Plot 2
setwd("~/Documents/Exploratory_Data_Analysis/Course_Project2")
source("load_data.R")

# Call a png device
png(filename = "./figure/plot2.png", 
    width = 480, 
    height = 480, 
    units = "px",
    bg ="transparent")

# Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
# plot answering this question.
emissionBal <- NEI[fips == "24510", ]
emissionsByYear <- aggregate(Emissions ~ year,emissionBal,FUN ="sum")

# Plotting function to make plot2
barplot(height = emissionsByYear$Emissions,
        names.arg = emissionsByYear$year,
        col = "green",
        main = "Total PM2.5 emission in Baltimore MD from 1999 to 2008",
        xlab = "Year", 
        ylab = expression('Total PM'[2.5]*" Emission"))

# Close the PNG device
dev.off()