##### Details #######

title: "Summarization, Counting, and Proportions"
author: "Md Johirul Islam"
email: "pappu97cu@gmail.com"
output: html_document 

##############


#load the data
#attach the data
attach(Covid)
#check heading
head(Covid)

#we can use summarise() function to create new summary variable.
#we want to know age of the people who are visit wuhan
Covid%>% 
  summarise(Max_Age_Visit_Wuhan = max(age[`visiting Wuhan`],
                                     na.rm = TRUE))



#this function is powerful with group_by()
#we want to know age of the people who are visit wuhan within gender
Covid %>%
  group_by(gender) %>% 
  summarise(Max_Age_Visit_Wuhan = max(age[`visiting Wuhan`], na.rm = TRUE))

#let's load another dataset
attach(all)

#let's calculate the mean age at death by gender
all %>%
  mutate(days_lived = deathDate - birthDate) %>% #adding new variable
  filter(!is.na(days_lived)) %>% #exclude missing data 
  group_by(gender) %>% 
  summarise(mean_days_lived = round(mean(days_lived), 2)) %>% 
  arrange(-mean_days_lived) #arrange by mean_days_lived

#we can group by() function for more than one group
all %>%
  mutate(days_lived = deathDate - birthDate) %>% 
  filter(!is.na(days_lived)) %>% 
  group_by(gender, wasPrimeMinister) %>% 
  summarise(mean_days_lived = round(mean(days_lived), 2)) %>% 
  arrange(-mean_days_lived)


#We can use the function count() to create counts by groups.
#we use to know the total number of people by group.
all%>% 
  group_by(gender, wasPrimeMinister) %>% 
  count()

#Finally, often calculating proportions is a combination of 
#summarise() and mutate() (and group_by()).
#Let's calculate the proportion of genders.
#Note here, that we needed to ungroup() the data before mutating.

all %>% 
  group_by(gender) %>% 
  count() %>% 
  ungroup() %>% 
  mutate(prop = n/(sum(n)))
