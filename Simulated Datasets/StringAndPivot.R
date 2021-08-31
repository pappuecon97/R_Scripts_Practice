############# String and pivot ##########

#load package
library(tidyverse)

#make dataset

people <- 
       tibble(names = c("rohan", "monica"),
                           website = c("rohanalexander.com", "monicaalexander.com"),
                           fav_colour = c("blue", " white "),
                    )

head(people)

#there are three essential string function namely
#stringr::str_detect(), stringr::str_replace(), stringr::str_squish()
#we use stringr::strdetect() to create new logical variable by name or something
#we use stringr::str_replace() to replace any componnent in a variable
#we use string:;str_squish() 

people <- 
  people %>% 
  mutate(is_rohan = stringr::str_detect(names, "rohan"), #give TRUE if name is rohan
         make_howlett = stringr::str_replace(website, "alexander", "howlett"),
                        #replace the word "alexander" in website by "howlett"
         fav_colour_trim = stringr::str_squish(fav_colour) #trim the variable
  )                     

head(people)



#Datasets tend to be either long or wide. 
#To go from one to the other you can use the pivot_longer() 
#and pivot_wider() functions.

#create example data
pivot_example_data <- 
  tibble(year = c(2019, 2020, 2021),
         blue_team = c(1, 2, 1),
         red_team = c(2, 1, 2))

head(pivot_example_data)

#data is now in long wide format, to convert it into longer format
#we use tidy::pivot_longer function
data_pivoted_longer <- 
  pivot_example_data %>% 
  tidyr::pivot_longer(cols = c("blue_team", "red_team"), #component of the
                                                         #variable "team"
                      names_to = "team",  #give the variable name "team"
                      values_to = "position") #give the value to variable "position"

head(data_pivoted_longer)


#Occasionally, you'll need to go from long data to wide data. 
#We accomplish this with tidyr::pivot_wider.

data_pivoted_wider <- 
  data_pivoted_longer %>% 
  tidyr::pivot_wider(id_cols = c("year", "team"),
                     names_from = "team",
                     values_from = "position")

head(data_pivoted_wider)




