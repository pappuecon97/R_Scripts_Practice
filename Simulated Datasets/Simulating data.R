######## Simulating Data #####



#we can create data. Before doing it, we need to set seed to make it
#repeatable

set.seed(100)

#Let's get 10 observations from the standard normal

number_of_observations <- 10
simulated_data <- tibble(person = c(1:number_of_observations),
                         observation = rnorm(number_of_observations, 
                                             mean = 0, 
                                             sd = 1)
)

#head
head(simulated_data)

#let's add 10 draws from the uniform distribution between 0 and 10
simulated_data$another_observation <- runif(number_of_observations, 
                                            min = 0, 
                                            max = 10)

#Finally, let's use sample, which allows use to pick from a list of items,
#to add a favourite colour to each observation

simulated_data$fav_colour <- sample(x = c("blue", " white "), 
                                    size = number_of_observations,
                                    replace = TRUE) #to repeat the trial

