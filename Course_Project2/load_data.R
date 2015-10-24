# Exploratory Data Analaysis 
# Course Project 2
# Loading the NEI and SCC data
setwd("~/Documents/Exploratory_Data_Analysis/Course_Project2")
# Check if both data exist. If not, load the data.
if (!"NEI" %in% ls()) {
        NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")
}
if (!"SCCdata" %in% ls()) {
        SCCdata <- readRDS("./exdata-data-NEI_data/Source_Classification_Code.rds")
}
dim(NEI)
# 6497651   6
dim(SCCdata)
# 11717    15
# Only attach NEI dataset
attach(NEI)