df <- read.csv('Data/wide_income_rent.csv')
library(tidyverse)
library(gganimate)

df %>% 
  pivot_longer(cols = -variable,
               names_to = 'state',
               values_to = 'value') %>% 
  pivot_wider(names_from = 'variable',
              values_from = 'value') %>% 
  ggplot(aes(x = state, y = income, colour = income))+
  geom_point()+
  geom_text(aes(label = rent))+
  theme(axis.title = element_text(angle = 270))+
  theme(axis.title.y.left = element_text(angle = 45))+
  labs(title = 'PLOTTTTT', x = 'state?', y = 'none of your business')+
  theme(panel.background = element_rect(fill = 'red', color = 'purple'))+
  transition_time(time = income)

anim_save('ugly_plot.gif')  
