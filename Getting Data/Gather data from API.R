########### gather data from API ###############


#we will use httr package to use GET to gather data from web. 

#first load the library
library(httr)
library(tidyverse)

#get data from the url
arxiv <- httr::GET('http://export.arxiv.org/api/query?id_list=2101.05225')

#check the variable class
class(arxiv)

#get the content of the variable as text
content(arxiv, "text") %>% 
  cat("\n")


#we can get data from Twitter API using rtweet package. 
# install.packages('rtweet')
install.packages("rtweet")
library(rtweet)
library(tidyverse)

#now we need to authorise rtweet
get_favorites(user = "pappu_econ") #username of tweeter account. 

