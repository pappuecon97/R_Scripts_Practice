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

#after opening the browser, we need to authenticate by giving username and pass


#we can now save the data about my favorites
pappu_favs <- get_favorites("pappu_econ") #user name

saveRDS(pappu_favs, "Cleaned Data/ pappus_favs.rds") #save the data in 'rds' file
        #filename              #saving directory


#now check the head of the data
head(pappu_favs)

#now we can see my recent favorite tweet by ordering the data by "created_at"
pappu_favs %>% 
  arrange(desc(created_at)) %>% #order in descending by "created_at" variable 
  slice(1) %>%       #select row number 1
  select(screen_name, text) #provide the result by these two column. 


#we can also find who's tweeting about economics using a hashtag #EconTwitter
econ_tweets <- search_tweets(         #use fn "search_tweets"
  q = "#EconTwitter",     #put the desired hashtag
  include_rts = FALSE     #exclude retweets
)

saveRDS(econ_tweets, "Cleaned Data/rstats_tweets.rds") #save the data in desktop

#check the headings of the data
head(econ_tweets)

#check the column names
names(econ_tweets)

#note: to use twitter data, you need to look at their terms and conditions.
