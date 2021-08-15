##### Details #######

title: "Selecting specific row of a dataset"
author: "Md Johirul Islam"
email: "pappu97cu@gmail.com"
output: html_document 

##############

#load package
library(tidyverse)

#load the data
attach(Dallas_Acc)

head(Dallas_Acc)

#we can get row by using "filter()" function
#for example, we can select only "Central" Division
Dallas_Acc %>% 
  filter(Division=="Central")

#we can those central division which have 134 beating rate.
Dallas_Acc %>% 
  filter(Division == "Central", Beat == "134")

#we can filter to a particular row
Dallas_Acc %>% 
  filter(row_number() == 13)

#we can also do it by using "slice" function.
Dallas_Acc %>% 
  slice(13)
