## Task 1
getwd()
read.csv('/Users/janes/Desktop/BIO3100/Data_Course_MCILNAY/Exam_1/cleaned_covid_data.csv')
covid_data <- read.csv('/Users/janes/Desktop/BIO3100/Data_Course_MCILNAY/Exam_1/cleaned_covid_data.csv')

## Task 2
library(tidyverse)
A_States <- covid_data %>% 
  filter(grepl('^A', Province_State))
View(A_States)

## Task 3 
library(ggplot2)
A_States %>% 
  ggplot(aes(x = Last_Update,
             y = Deaths)) +
  geom_point() +
  geom_smooth(method = 'loess', se = FALSE) +
  facet_wrap(~ Province_State, scales = 'free') +
  labs(title = 'Deaths over Time by State', x = 'Date', y = 'Deaths')

## Task 4 
state_max_fatality_rate <- covid_data %>% 
  filter(!is.na(Deaths)) %>% 
  group_by(Province_State)%>% 
  summarise(Maximum_Fatality_Ratio = max(Deaths)) %>% 
  arrange(desc(Maximum_Fatality_Ratio))
View(state_max_fatality_rate)

## Task 5 
state_max_fatality_rate$Province_State <- factor(state_max_fatality_rate$Province_State,
                                                 levels = state_max_fatality_rate$Province_State[order(state_max_fatality_rate$Maximum_Fatality_Ratio, 
                                                                                                       decreasing = TRUE)])

ggplot(state_max_fatality_rate, aes(x = Province_State, y = Maximum_Fatality_Ratio)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))   

## Task 6 (Extra Credit)--I tried 
library(dplyr)
deaths_us_over_time <- covid_data %>% 
  group_by(Last_Update) %>% 
  summarise(cumulative_deaths = sum(Deaths, na.rm = TRUE)) %>% 
  arrange(Last_Update)

ggplot(deaths_us_over_time, aes(x = Last_Update, y = cumulative_deaths))+
  geom_col(color = 'skyblue', size = 1)+
  labs(x = 'Date', y = 'Deaths', title = "Cumulative Deaths in the US Over Time")+
  theme(axis.text.x = element_text(angle = 90))

  
