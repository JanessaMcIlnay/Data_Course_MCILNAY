library(tidyverse)
dat <- read_csv("../../Data/BioLog_Plate_Data.csv")
View(dat)

# Task 1: Cleans this data into tidy (long) form
new_dat <- dat %>% 
  pivot_longer(cols = starts_with("Hr"),
               names_to = 'Time',
               values_to = "Absorbance") %>% 
  mutate(Time = as.numeric(str_remove(Time, "Hr_")))
  

names(new_dat)
unique(new_dat$`Sample ID`)

# Task 2: Creates a new column specifying whether a sample is from soil or water
soil_or_water <- new_dat %>% 
  mutate(`Type`= case_when(`Sample ID` == 'Soil_1' ~ 'Soil',
                           `Sample ID` == 'Soil_2' ~ 'Soil',
                           `Sample ID` == 'Clear_Creek' ~ 'Water',
                           `Sample ID` == 'Waste_Water' ~ 'Water')) %>% 
  View()


# Task 3: Generates a plot that matches this one (note just plotting dilution == 0.1)
library(ggplot2)

soil_or_water %>% 
  filter(Dilution == 0.1) %>% 
  ggplot(aes(x = Time,
             y = Absorbance, 
             color = Type))+
  geom_smooth(method = "loess", se = FALSE)+
  facet_wrap(~ Substrate )+
  theme_minimal()

# Task 4: Generates an animated plot that matches this one (absorbance values are mean of all 3 replicates for each group)
library(gganimate)

new_dat$Time = as.numeric(new_dat$Time)
str(new_dat)

new_dat %>% 
  filter(Substrate == "Itaconic Acid") %>% 
  group_by(`Sample ID`, Dilution, Time) %>% 
  summarise(mean_absorbance = mean(Absorbance)) %>% 
  ggplot(aes(x = Time, y = mean_absorbance, 
             color = `Sample ID`))+
  geom_line()+
  facet_wrap(~ Dilution) +
  labs(x = 'Time', 
       y = 'Mean_absorbance',
       color = 'Sample ID')+
  theme_minimal()+
  transition_reveal(Time)



