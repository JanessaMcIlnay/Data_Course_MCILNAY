install.packages('modelr')
install.packages('broom')
install.packages('fitdistrplus')

library(tidyverse)
library(easystats)
library(modelr)
library(broom)
library(fitdistrplus)
library(dplyr)
library(caret)

# 1. loads the “/Data/mushroom_growth.csv” data set ####
mush <- read.csv('mushroom_growth.csv')
View(mush) 

# 2. creates several plots exploring relationships between the response and predictors####
str(mush)
mush$Light <- as.numeric(mush$Light)
mush$Nitrogen <- as.numeric(mush$Nitrogen)
mush$Temperature <- as.numeric(mush$Temperature)
mush$Humidity <- as.factor(mush$Humidity)
mush$Species <- as.factor(mush$Species)

ggplot(mush, aes(x = Light, y= GrowthRate))+
  geom_point()+
  geom_smooth(method = "lm")+
  theme_minimal()

ggplot(mush, aes(x = Temperature, y= GrowthRate))+
  geom_point()+
  geom_smooth(method = "lm")+
  theme_minimal()

ggplot(mush, aes(x = Humidity, y = GrowthRate)) +
  geom_boxplot(fill = "orange") +
  labs(title = "GrowthRate vs Humidity")

ggplot(mush, aes(x = Species, y = GrowthRate)) +
  geom_boxplot(fill = "darkcyan") +
  labs(title = "GrowthRate vs Species")

# 3. defines at least 4 models that explain the dependent variable “GrowthRate”####

model1 <- lm(GrowthRate ~ Light, data = mush)
model2 <- lm(GrowthRate ~ Light + Temperature, data = mush)
model3 <- lm(GrowthRate ~ Light + Temperature + Humidity, data = mush)
model4 <- lm(GrowthRate ~ Light + Temperature + Humidity + Nitrogen, data = mush)

# 4. calculates the mean sq. error of each model####
mse <- function(model, data) {
  mean((predict(model, data) - mush$GrowthRate)^2)
}

mse1 <- mse(model1, mush)
mse2 <- mse(model2, mush)
mse3 <- mse(model3, mush)
mse4 <- mse(model4, mush)

cat("MSEs:\n")
cat("Model 1 (Light):", mse1, "\n")
cat("Model 2 (Light + Temp):", mse2, "\n")
cat("Model 3 (Light + Temp + Humidity):", mse3, "\n")
cat("Model 4 (All Variables):", mse4, "\n")

# 5. selects the best model you tried####
mse_values <- c(mse1, mse2, mse3, mse4)
best_model_index <- which.min(mse_values) 
## result is 4 meaning model 4 is best as the mean squared error is lowest 
best_model <- list(model1, model2, model3, model4)[[best_model_index]]
cat("\nBest model is Model", best_model_index, "\n")

# 6. adds predictions based on new hypothetical values for the independent variables used in your model####
new_data <- data.frame(
  Light = c(10, 20, 30),
  Temperature = c(20, 25, 30),
  Humidity = c(40, 50, 60),
  Nitrogen = c(0.1, 0.2, 0.3),
  Species = as.factor(c("species1", "species2", "species3"))  # match dataset's factor levels
)
                                        
new_data$Humidity <- factor(new_data$Humidity, levels = levels(mush$Humidity))
new_data$Species <- factor(new_data$Species, levels = levels(mush$Species)) 
new_data$PredictedGrowthRate <- predict(best_model, newdata = new_data)
view(new_data)
                                        
# 7. plots these predictions alongside the real data####

ggplot() +
  geom_point(data = mush, aes(x = 1:nrow(mush), y = GrowthRate), color = "blue", alpha = 0.6) +
  geom_point(data = new_data, aes(x = (nrow(mush) + 1):(nrow(mush) + nrow(new_data)),
                                  y = PredictedGrowthRate), color = "red", size = 3) +
  labs(title = "Real vs. Predicted Growth Rates",
       x = "Sample Values", y = "Growth Rate") +
  theme_minimal()

                                        
                                        