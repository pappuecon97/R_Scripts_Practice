############ ggplot basics #############


#For instances, let's build up a histogram of age of 
#death with increasing complexity

all %>% 
  mutate(days_lived = as.integer(deathDate - birthDate)) %>% #make it integer
  filter(!is.na(days_lived)) %>% 
  ggplot(mapping = aes(x = days_lived)) #start with grey box

#We need to tell it what we want to plot. This is where geom comes in.

all %>% 
  mutate(days_lived = as.integer(deathDate - birthDate)) %>% 
  filter(!is.na(days_lived)) %>% 
  ggplot(mapping = aes(x = days_lived)) +
  geom_histogram(binwidth = 365) 

#Now let's color the bars by gender, which means adding an aesthetics

all %>% 
  mutate(days_lived = as.integer(deathDate - birthDate)) %>% 
  filter(!is.na(days_lived)) %>% #exclude missing data
  ggplot(mapping = aes(x = days_lived, fill = gender)) + #set axis and color
  geom_histogram(binwidth = 365) #set the type of graph


#We can add some labels, change the color, and background

all %>% 
  mutate(days_lived = as.integer(deathDate - birthDate)) %>% 
  filter(!is.na(days_lived)) %>% 
  ggplot(mapping = aes(x = days_lived, fill = gender)) +
  geom_histogram(binwidth = 365) +
  labs(title = "Length of life of Australian politicians", #name of title 
       x = "Age of deaths (days)", #name of x-axis
       y = "Number") + #name of y-axis
  theme_classic() + #set theme type
  scale_fill_brewer(palette = "Set1") # custom fill color



#Facets are subplots and are invaluable 
#because they allow you to add another variable to 
#your plot without having to make a 3D plot.

all %>% 
  mutate(days_lived = as.integer(deathDate - birthDate)) %>% 
  filter(!is.na(days_lived)) %>% 
  ggplot(mapping = aes(x = days_lived)) +
  geom_histogram(binwidth = 365) +
  labs(title = "Length of life of Australian politicians", 
       x = "Age of deaths (days)", 
       y = "Number") +
  theme_classic() +
  scale_fill_brewer(palette = "Set1") +
  facet_wrap(~gender)   #make subplot by gender


