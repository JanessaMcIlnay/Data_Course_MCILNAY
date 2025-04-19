
# I am redoing Exam 1 ####
library(tidyverse)
library(ggplot2)

# Task 1 ####

read.csv('cleaned_covid_data.csv')
covid_data <- read.csv('cleaned_covid_data.csv')

# Task 2 ####
A_states <- covid_data %>% 
  filter(grepl('^A', Province_State))

# Task 3 ####
A_states <- A_states %>%
  mutate(Last_Update = as.Date(Last_Update, format = "%Y-%m-%d"))

ggplot(A_states, aes(x = Last_Update, y = Deaths)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "loess", se = FALSE) +
  facet_wrap(~ Province_State, scales = "free") +
  labs(title = "COVID-19 Deaths Over Time in States Starting with 'A'",
       x = "Date", y = "Deaths") +
  scale_x_date(date_labels = "%b %Y", date_breaks = "3 months") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Task 4 ####
state_max_fatality_rate <- covid_data %>%
  group_by(Province_State) %>%
  summarize(Maximum_Fatality_Ratio = max(Case_Fatality_Ratio, na.rm = TRUE)) %>%
  arrange(desc(Maximum_Fatality_Ratio))
print(state_max_fatality_rate)

# Task 5 ####
state_max_fatality_rate %>%
  mutate(Province_State = fct_reorder(Province_State, Maximum_Fatality_Ratio)) %>%
  ggplot(aes(x = Province_State, y = Maximum_Fatality_Ratio)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(title = "Peak Case Fatality Ratio by State",
       x = "State", y = "Maximum Fatality Ratio") +
  theme_minimal()
## Note : I used coord_flip() instead of rotating the labels 90° because it makes the plot more readable

# Task 6 (bonus) ####
covid_data2 <- covid_data %>%
  mutate(Last_Update = as.Date(Last_Update))
us_cumulative_deaths <- covid_data2 %>%
  group_by(Last_Update) %>%
  summarize(Total_Deaths = sum(Deaths, na.rm = TRUE))
ggplot(us_cumulative_deaths, aes(x = Last_Update, y = Total_Deaths)) +
  geom_line(color = "red", size = 1) +
  labs(title = "Cumulative COVID-19 Deaths in the US Over Time",
       x = "Date", y = "Total Deaths") +
  scale_x_date(date_labels = "%b %Y", date_breaks = "2 months") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


