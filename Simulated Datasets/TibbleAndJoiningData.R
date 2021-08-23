######### Tibble and Joinining data  ############


#load the package
library(tidyverse)

#load and attach the data

attach(all)

#tibble is a data frame, unlike data.frame it makes the work easy.
#it is helpful in simulating data

Marks <- 
        tibble(SName = c("Saiful", "Babu", "Ahsan", "Salman", "Hriday"),
               Number = c(76, 70, 70, 89, 35), 
               Grade = c("A", "A-","A-", "A+", "F"))


head(Marks)

#let's add another variable
Marks <- Marks %>% 
  mutate(fav_colour = c("white", "blue", "white", "white", "blue"))

#attach another dataset to join the dataset with another one.
attach(simulated_data)

#check heads
head(simulated_data)

#We can join two datasets together
#to join two datasets we need to have one common column in both datasets

both <- 
  simulated_data %>% 
  left_join(Marks, by = "fav_colour")

#check heads
head(both)




