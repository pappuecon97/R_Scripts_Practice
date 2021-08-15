##### Details #######

title: "Selecting specific column of a dataset"
author: "Md Johirul Islam"
email: "pappu97cu@gmail.com"
output: html_document 

##############


#We can select specific column by "select" function from "tidyverse" package. 

#load library
library(tidyverse)

#download the data
Dallas_Acc<- read_csv(
file = 
"https://www.dallasopendata.com/api/views/iwpr-sj2f/rows.csv?accessType=DOWNLOAD"
)

#check the name of variables (column)
head(Dallas_Acc)

#Now we can select specific columns for our analysis. 

Dallas_Acc <- Dallas_Acc %>%
  select(Division, `Nature of Call`, Priority, Beat,
         `Reporting Area`, Status)

head(Dallas_Acc)

#we can select by "unselecting" a column. 
#suppose we want to exclude "Reporting Area"
Dallas_Acc %>% 
  select(-"Reporting Area")

  #we can save the data into the computer. 
readr::write_csv(Dallas_Acc, "Cleaned Data/DallasAcc.csv")


