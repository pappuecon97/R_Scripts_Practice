##### Details #######

title: "Simple and Multiple linear regression"
author: "Md Johirul Islam"
email: "pappu97cu@gmail.com"
output: html_document 

##############
  
#load the data from R ( there are some built-in datasets in R)
data("airquality")

#attach the dataset
attach(airquality)

#summary of the data
summary(airquality)

#check if there is any missing data
is.na(airquality)

#we can see that there are some missing data( TRUE means data are missing),
#so we need to remove the missing data from the data set and store it as
# a new dataset
airquality <- na.omit(airquality)

#let's run simple OLS for "Ozone" and "Solar.R"
SOLS <- lm(Ozone ~ Solar.R) 

#summary of the regression
summary(SOLS) 

#let's draw the fitted line
plot(Ozone ~ Solar.R, main = "Fitted line for Ozone and Solar.R")

#draw the fitted line
abline(SOLS, col = 2, lwd = 3)

#We can also run multiple OLS
MOLS <- lm(Ozone ~ Solar.R + Wind+ Temp) 

#summary of MOLS
summary(MOLS)

