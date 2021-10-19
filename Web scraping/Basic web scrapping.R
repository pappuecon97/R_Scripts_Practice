################ Basic Web scrapping #######################


#first save extract a name

website_extract <- "<p>Hi, I’m <b>Rohan</b> Alexander.</p>"

#use rvest package
# install.packages("rvest")
install.packages("rvest")
library(rvest)

#store the extracted data
rohans_data <- read_html(website_extract)

#open the stored data
rohans_data


#The language used by rvest to look for tags is ‘node,’ 
#so we will focus on bold nodes. By default html_nodes() returns the tags as well 
#We can focus on the text that they contain, using html_text().

rohans_data %>% 
  html_nodes("b") #look for bold words

first_name <-            #store the bold name
  rohans_data %>% 
  html_nodes("b") %>%
  html_text()          #store as text

#check the name
first_name


#gather data from website

#### Contact details ####
# Title: Get data from rohanalexander.com
# Purpose: This script gets data from Rohan's website about the books that he 
# owns. It calls his website and then saves the dataset to inputs.
# Author: Rohan Alexander
# Contact: rohan.alexander@utoronto.ca
# Last updated: 20 May 2020


#### Set up workspace ####
library(rvest)
library(tidyverse)


#### Get html ####
rohans_data <- read_html("https://rohanalexander.com/bookshelf.html")
# This takes a website as an input and will read it into R, in the same way that we 
# can read a, say, CSV into R.

#save the raw data
write_html(rohans_data, "Cleaned Data/raw_data.html") 
# Always save your raw dataset as soon as you get it so that you have a record 
# of it. This is the equivalent of, say, write_csv() that we have used earlier.



#cleaning the data


#### Set up workspace ####
library(tidyverse)
library(rvest)

rohans_data <- read_html("inputs/my_website/raw_data.html")

rohans_data

#now we need to find the list by tag "li" in source code
#and get the text and save the dataset using "tibble"

# Identify the lines that have books on them based on the list html tag
text_data <- rohans_data %>%
  html_nodes("li") %>%  #select "list" 
  html_text()   #store as text

all_books <- tibble(books = text_data)         #store data in new variable.

head(all_books)  #check headings


#now we want to separate "title" and "author"
# All content is just one string, so need to separate title and author
all_books <-
  all_books %>%
  separate(books, into = c("title", "author"), sep = "”") #separate into column

# Remove leading comma and clean up the titles a little
all_books <-
  all_books %>%
  mutate(author = str_remove_all(author, "^, "),
         author = str_squish(author),
         title = str_remove(title, "“"),
         title = str_remove(title, "^-")
  )

head(all_books)


#Finally, some specific cleaning is needed.

# Some authors have comments after their name, so need to get rid of them, although there are some exceptions that will not work
# J. K. Rowling.
# M. Mitchell Waldrop.
# David A. Price
all_books <-
  all_books %>%
  mutate(author = str_replace_all(author,
                                  c("J. K. Rowling." = "J K Rowling.",
                                    "M. Mitchell Waldrop." = "M Mitchell Waldrop.",
                                    "David A. Price" = "David A Price")
  )
  ) %>%
  separate(author, into = c("author_correct", "throw_away"), sep = "\\.", extra = "drop") %>%
  select(-throw_away) %>%
  rename(author = author_correct)

# Some books have multiple authors, so need to separate them
# One has multiple authors:
# "Daniela Witten, Gareth James, Robert Tibshirani, and Trevor Hastie"
all_books <-s
  all_books %>%
  mutate(author = str_replace(author,
                              "Daniela Witten, Gareth James, Robert Tibshirani, and Trevor Hastie",
                              "Daniela Witten and Gareth James and Robert Tibshirani and Trevor Hastie")) %>%
  separate(author, into = c("author_first", "author_second", "author_third", "author_fourth"), sep = " and ", fill = "right") %>%
  pivot_longer(cols = starts_with("author_"),
               names_to = "author_position",
               values_to = "author") %>%
  select(-author_position) %>%
  filter(!is.na(author))

head(all_books)


# let’s look at the distribution of the first letter of the author names.

all_books %>% 
  mutate(
    first_letter = str_sub(author, 1, 1)
  ) %>% 
  group_by(first_letter) %>% 
  count()
