##### Details #######

title: "Arranging dataset"
author: "Md Johirul Islam"
email: "pappu97cu@gmail.com"
output: html_document 

##############

#load data
attach(Dallas_Acc)

#check head
head(Dallas_Acc)

#we can arrange the data by "Priority" (low to high)
Dallas_Acc %>% 
  arrange(Priority)

#we can make it descending order (high to low)
Dallas_Acc %>% 
     arrange(desc(Priority))

#we can arrange by more than one column
Dallas_Acc %>% 
  arrange(Priority, Beat) #it will arrange first by Priority (order matter)
#we can pipe one arrange() to another one

Dallas_Acc %>% 
  arrange(Priority) %>% 
  arrange(Beat)

