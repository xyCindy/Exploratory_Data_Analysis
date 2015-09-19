#Week 2 Quiz
#Question 1
#---an object of class "trellis"

#Question 2
#What is produced by the following code?
install.packages("nlme")
install.packages("lattice")
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)
str(BodyWeight$Diet)
#---A set of 3 panels showing the relationship between weight and time 
#---for each diet.

#Question 3
# panel.lmline(x,y,...) = panel.abline(lm(y~x), ...)
#---panel.lmline()

#Question 4
#---The object 'p' has not yet been printed with the appropriate print method.

#Question 5
#---trellis.par.set()
#---Functions used to query, display and modify graphical parameters 
#---for fine control of Trellis displays

#Question 6
#What is ggplot2 an implementation of?
#---the Grammar of Graphics developed by Leland Wilkinson

#Question 7
library(datasets)
data(airquality)
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

#Question 8
#---a plotting object like point, line, or other shape

#Question 9
library(ggplot2)
g <- ggplot(movies, aes(votes, rating))
print(g)
#---ggplot does not yet know what type of layer to add to the plot.

#Question 10
qplot(votes, rating, data = movies) + geom_smooth()
