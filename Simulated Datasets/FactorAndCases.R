
############### Factor and Cases ##############


#load package
library(tidyverse)

install.packages(forcats)
library(forcats)

#A factor is a string that has an inherent ordering. 
#Sometimes you will have a character vector and you will want it ordered in
#a particular way. The default is that a character vector is ordered 
#alphabetically, but you may not want that,
#The way to change the ordering is to change the variable from a character to 
#a factor. I would then use the forcats package to specify an ordering by hand.


#create data
my_data <- tibble(all_names = c("Rohan", "Monica", "Edward"))

head(my_data)

#If we plotted this then Edward would be first, because it would be alphabetical.
#But if instead I want to be first as I am the oldest then we could use forcats
#in the following way.

my_data <-
  my_data %>%
  mutate(all_names = factor(all_names), # Change to factor
         all_names_releveled = fct_relevel(all_names, "Rohan", "Monica"))
                                            # Change the levels or order

# Then compare the two
my_data$all_names

my_data$all_names_releveled



#If you need to write a few conditional statements, 
#then case_when is the way to go.
#Let's start with a tibble of dates and pretend that we want to group them into
#'pre-1950,' '1950-2000,' '2000-onwards'

case_when_example <- 
  tibble(some_dates = c("1909-12-31", "1919-12-31", "1929-12-31", "1939-12-31", 
                        "1949-12-31", "1959-12-31", "1969-12-31", "1979-12-31", 
                        "1989-12-31", "1999-12-31", "2009-12-31")
  )

case_when_example <- 
  case_when_example %>% 
  mutate(some_dates = lubridate::ymd(some_dates) #convert its class from "chr" 
                                                  #to "date" 
  )

head(case_when_example)

#Now we'll use dplyr::case_when() to group these on a conditional basis.

case_when_example <- 
  case_when_example %>% 
  mutate(year_group = 
           case_when(
             some_dates < lubridate::ymd("1950-01-01") ~ "pre-1950",
             some_dates < lubridate::ymd("2000-01-01") ~ "1950-2000",
             some_dates >= lubridate::ymd("2009-01-01") ~ "2000-onwards",
             TRUE ~ "CHECK ME"
           )
  )

head(case_when_example)
