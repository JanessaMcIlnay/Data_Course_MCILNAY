# Task 1: Read in the unicef data (10 pts) ####
library(tidyverse)
library(ggplot2)
u5 <- read.csv('unicef-u5mr.csv')

# Task 2: Get it into tidy format (10 pts) ####
clean_u5 <- u5 %>% 
  pivot_longer(cols = -c(CountryName, Continent, Region),
               names_to = 'Year',
               values_to = 'U5MR') %>% 
  drop_na() %>% 
  mutate(Year = str_remove(Year, "U5MR\\.")) 

str(clean_u5)

clean_u5$Year = as.numeric(clean_u5$Year)

# Task 3: Plot each country’s U5MR over time (20 points)####
graph1 <- clean_u5 %>% 
  ggplot(aes(x = Year,
             y = U5MR,
             group = CountryName)) +
  geom_line()+
  scale_x_continuous(breaks = c(1960, 1980, 2000)) +  
  facet_wrap(~ Continent) 

# Task 4: Save this plot as LASTNAME_Plot_1.png (5 pts)####
ggsave("MCILNAY_Plot_1.png", plot = graph1, width = 10, 
       height = 6, dpi = 300)

# Task 5: Create another plot that shows the mean U5MR for all the countries within a given continent at each year (20 pts)####
mean_u5mr <- clean_u5 %>% 
  group_by(Year, Continent) %>% 
  summarise(mean_u5mr = mean(U5MR, na.rm = TRUE))

graph2 <- mean_u5mr %>% 
  ggplot(aes(x = Year,
             y = mean_u5mr,
             group = Continent,
             colour = Continent))+
  geom_line(size = 2)+
  scale_x_continuous(breaks = c(1960, 1980, 2000)) +
  labs(title = "Mean Under-5 Mortality Rate by Continent",
       x = "Year",
       y = "Mean_U5MR",
       color = "Continent") +
  theme_minimal() 
  
# Task 6: Save that plot as LASTNAME_Plot_2.png (5 pts) ####
ggsave("MCILNAY_Plot_2.png", plot = graph2, width = 10, 
       height = 6, dpi = 300, bg = "white")

# Task 7: Create three models of U5MR (20 pts) ####
library(easystats)
mod1 <- glm(data = clean_u5, 
            formula = U5MR ~ Year)
mod2 <- glm(data = clean_u5, 
            formula = U5MR ~ Year + Continent)
mod3 <- glm(data = clean_u5, 
            formula = U5MR ~ Year * Continent)
# Task 8: Compare the three models with respect to their performance####
compare_performance(mod1, mod2, mod3) 
## According to the results, I think model 3 is the best as it has the highest R^2 value and the lowest AIC, RMSE, and sigma values. ####

# Task 9: Plot the 3 models’ predictions like so: ####
predu5 <- clean_u5

predu5$pred1 <- predict(mod1, clean_u5)
predu5$pred2 <- predict(mod2, clean_u5)
predu5$pred3 <- predict(mod3, clean_u5)

graph3 <- predu5 %>% 
  pivot_longer(starts_with('pred'),
               names_to = 'prediction',
               values_to = 'predicted_u5mr') %>% 
  ggplot(aes(x = Year, 
             y = predicted_u5mr,
             color = Continent))+
  geom_line(size = 1)+
  labs(title = "Model Predictions",
       x = "Year",
       y = "Predicted_U5MR",
       color = "Continent") +
  theme_light()+
  facet_wrap(~ prediction)

ggsave("MCILNAY_Plot_3.png", plot = graph3, width = 10, 
       height = 6, dpi = 300, bg = "white")

