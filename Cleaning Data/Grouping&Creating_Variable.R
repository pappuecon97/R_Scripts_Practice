##### Details #######

title: "Grouping and creating new variables"
author: "Md Johirul Islam"
email: "pappu97cu@gmail.com"
output: html_document 

##############

#necessary package
library(tidyverse)

#load library and load data from excel file
library(readxl)
Covid <- read_excel("Raw and Tidy Data/Covid.xlsx")
View(Covid)

#attach the data
attach(Covid)

#let's do some basic cleaning since we don't need the whole data
#let's check column name
head(Covid)

#let's do some basic cleaning
#select some column
Covid <- Covid %>% 
  select("location", "country", "gender", "age", "visiting Wuhan",
         "from Wuhan", "death", "recovered")

#we can group variables using "group by()" function
# we want to arrange by location within gender and want first three results

Covid %>% 
  group_by(gender) %>% 
      arrange(location) %>% 
      slice(1:3)

#we can add a new variable in the data using mutate() function.
#suppose we want to create a new gender dummy and want to add in the data.
#male =1, female = 0

Covid <- Covid %>% 
        mutate(GenderDummay = if_else( gender == "male", 1, 0))

#check the variable
Covid %>% 
  select("gender", "GenderDummay") %>% 
  head()

