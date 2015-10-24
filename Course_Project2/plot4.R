# Exploratory Data Analaysis 
# Course Project 2
# Plot 4
setwd("~/Documents/Exploratory_Data_Analysis/Course_Project2")
source("load_data.R")

# Call a png device
png(filename = "./figure/plot4.png", 
    width = 480, 
    height = 480, 
    units = "px",
    bg ="transparent")

# Question 4
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?
# ignore.case = T, ignore case sensitive
coalIdx <- grep("coal",SCCdata$Short.Name,ignore.case = TRUE)
# Select only SCC column in SCCdata
coalSCC <- SCCdata[coalIdx, 1]
# Select corresponding subset from NEI dataset
coalSub <- NEI[NEI$SCC %in% coalSCC, ]
coalEmission <- aggregate(Emissions ~ year,coalSub,FUN ="sum")

# Plotting function to make plot4
barplot(height = coalEmission$Emissions,
        names.arg = coalEmission$year,
        col = "orange",
        main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008",
        xlab = "Year", 
        ylab = expression('Total PM'[2.5]*" Emission"))

# Close the PNG device
dev.off()