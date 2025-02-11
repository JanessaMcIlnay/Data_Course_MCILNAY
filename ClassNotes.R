# Assignment 2 ####
## Task 4- Write a command that lists all of the .csv files found in the Data/ directory and stores that list in an object called “csv_files”####
list.files(path = 'Data/', pattern = '.csv') 
csv_files <- list.files(path = 'Data/', pattern = '.csv') 
## Task 5- Find how many files match that description using the length() function#### 
length(csv_files)
## Task 6- Open the wingspan_vs_mass.csv file and store the contents as an R object named “df” using the read.csv() function####
read.csv('Data/wingspan_vs_mass.csv') 
df_wingspan = read.csv('Data/wingspan_vs_mass.csv')
df_wingspan
## Task 7- Inspect the first 5 lines of this data set using the head() function####
head(df_wingspan, 5)
## Task 8- Find any files (recursively) in the Data/ directory that begin with the letter “b” (lowercase)####
list.files(path = 'Data/', pattern = '^b', recursive = T)
## Task 9- Write a command that displays the first line of each of those “b” files (this is tricky… use a for-loop)####
vec = list.files(path = 'Data/', pattern = '^b', recursive = T)
for (i in vec) {
  print(readLines(i, n=1))
}
## Task 10- Do the same thing for all files that end in “.csv”####
list.files(pattern = '.csv$', recursive = T)
vec_2 = list.files(pattern = '.csv$', recursive = T)
for (i in vec_2) {
  print(readLines(i, n=1))
}

# change working directpoy
setwd('/Users/janes/Desktop/BIO3100/Data_Course_MCILNAY/Data')
readLines(vec[1], n = 1)


# loop over each file with filenmae start with b
for (i in vec) {
  print(readLines(i, n = 1)) # print out the first line
}


# Class Notes ####

# recursive = F (default): only search current directory
# recursive = T: search current and all subdirectories

list.files(path = 'Assignments/') #print out results on screen
obj_1 <- list.files(path = 'Assignments/') #save results in an object

echo 'some' > README.md # save into README.md

## file name starts with something
list.files(path = 'Data/', pattern = '^')

list.files(path = 'Data/', pattern = '.csv$', recursive = T) # $ means ending with

head(dat) #
tail(dat) #
dat[1:3, 1:4] #pulls up 3 rows and 4 columns


## vectors####
# c() put in desired vector

# numeric vector
vec_num2 <- c(1, 2, 3, 2, 3, 4)
vec_num[2] # 2nd element in vector
vec_num2+1

list <- list(vec, vec_num2)
list


# character vector
vec <- c('apple, banana, kiwi')
vec_chr <- c('apple', 'banana', 'kiwi')
vec_chr[2]
as.character #assignes something as a character
as.numeric #assigns vector as numeric
as.character(vec_num2)

#logical (TRUE/FALSE); used to filter data
thre <- c(TRUE, TRUE, FALSE)
vec_mix <- c(1, 'apple', TRUE) 

## types of objects in R####
# 1. vector (one dim, same type)
# 2. matrix (two dim, same type of data)
# 3. array (multiple dim, same type)
# 4. data frame (two dim, different type of data, same length)
# 5. list (multi dim, different type, different length)
# 6. function (store a function)

mat <- matrix(1:6, nrow = 3)
mat[2,1]
is.matrix(mat)

dat <- sum(iris$Sepal.Length)
head(dat)sum(iris$Sepal.Length)
head(dat)

readLines(file1, n=1)
readLines(file2, n=1)
readLines(file3, n=1)
...

## loops ####

# while loop (gives data till you run out)

# for loop (gives data depending on day)

for(variable in vector) # i.e go through each variable/element in vector
for(index in vector)
for(index in c(1,2,3,4,5,6,7,8,9,10))
print(index)  

vec <- c(1,2,3,4,5,6,7,8,9,10)


for (variable in vector) {
  
}


for(index in vec) {
  new_score <- index+1
  print(new_score)

} 
for(fruit in vec) {
  out = paste('I like', fruit)
  print(out)
}
  ## write a for loop to print out name of 12th month 
vec_month <- c('jan',feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec)


# one loop inside another
for(i in vec) {
  for(j in vec_2) {
  out = paste('I like, j')
  print (out)
  print(i)
}
}
getwd()

## arrays and vectors ####
arr <- array(1:18, dim = c(3,3,2)) # row, col, layer
arr


vec <- c(1, 2, 3)
is.vector(vec) # is the above a vector?

vec+1
str(vec) # is vector numeric or character?

as.character(vec) # makes vector characters
chr <- as.character(vec)
str(chr)

getwd()
dat <- read.csv('1620_scores.csv')
dat[1:3, 1:4]
dat[, 3]
dat[3,4]

## build data frame for 'mtcars' 
data
data("mtcars")
dat <- mtcars
dim(dat) # shows number of rows and cols
str(dat)

## Average, min and max ####
### get cars with cyl greater than 4 ####
cyl_greater_4 <- dat[dat$cyl > 4,]
dat$cyl > 4
View(cyl_greater_4) # to open data set
View(mtcars)
# pull out mpg data and calculate avergae, min, and max mpg
str(dat)
dat$mpg # displays mpg data
car_mpg <- dat$mpg
mean(car_mpg)
max(car_mpg)
dat[, "mpg"] # I want the data from every row with this col
dat[, c("mpg", "cyl")] # every row of cols mpg and cyl
dat[, c(1:2)]
dat[, c(3:4)]

### convert 'mpg' to characters in mtcars data frame####
str(car_mpg)
chrmpg <- as.character(car_mpg)
str(chrmpg)
dat$mpg <- chrmpg # put change of mpg to character to data frame
str(dat)

dat$mpg_num = as.numeric(chrmpg)
View(dat)

### convert entire data frame to character####
mtcars

## 1. What type of object is this?
str(mtcars)
class(mtcars)
View(mtcars)

## 2. Find cars with mpg greater than 20 and 4 cyl, then save to new object
dim(mtcars) #32 11
mtcars <- mtcars[mtcars$mpg > 20 ,]
my_mtcars = mtcars
my_mtcars = mtcars[mtcars$mpg > 20 ,]
my_mtcars = my_mtcars[mtcars$cyl ==4,]
View(my_mtcars)
## can also type 
my_mtcars <- my_mtcars[my_mtcars$mpg > 20 & my_mtcars$cyl ==4,] #[row, col]; a comma and nothing after includes all the rows/cols
View(my_mtcars)
my_mtcars[my_mtcars$disp ==108, 1:3]

## 3. convert mpg to a character data type
my_mtcars$mpg <- as.character(my_mtcars$mpg)
str(my_mtcars)
my_mtcars$newcol <- as.character(my_mtcars$mpg)

## 4. Convert entire  data frame to character data type
names(my_mtcars) # shows col names


for (col in names(my_mtcars)) {
  #print(cols)
  my_mtcars[, cols] <- as.character(my_mtcars[, col])
}

new_dat <- apply(mtcars[1:3, ], 2, as.character) # 2 applies function to all cols within rows 1:3
class(new_dat)
new_dat <- as.data.frame(new_dat)
class(new_dat)

# Saving Data ####
write.csv(new_dat, 'class_practice_28Jan25.csv') 

## Installing Packages ####
install.packages('tidyverse')
library(tidyverse)
mean(mtcars$mpg)

## Class Practice ####
mtcars
my_mtcars = mtcars
mtcars[mtcars$wt>3 & my_mtcars$cyl ==8,]
wt_cyl = mtcars[mtcars$wt>3 & my_mtcars$cyl ==8,]
View(wt_cyl)
mean(wt_cyl$mpg)
c(wt_cyl$hp/wt_cyl$cyl)
hp.cyl = c(wt_cyl$hp/wt_cyl$cyl)
write.csv(hp.cyl, '../../../hp_dividedby_cyl.csv') # relative path
write.csv(hp.cyl, '/Users/janes/Desktop/hp_dividedby_cyl.csv') # absolute path
getwd()


# Tidyverse ####
# ctrl + shift + m for %>% 
mtcars %>% # does the same as above
  filter(wt > 3 & cyl == 8) %>%
  mutate(hp.cyl = hp/cyl) %>%
  write.csv('test.csv')

mtcars$mpg %>%
  mean()

install.packages('palmerpenguins')
library(palmerpenguins)
View(penguins)

name <- penguins %>% # pipe = %>% 
  names()

dat_bill <- penguins %>% 
  filter(bill_length_mm >40)

dat_billfem <- penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') 
  View()
mean(dat_billfem$body_mass_g)

penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  pluck('body_mass_g') %>% 
  mean()

filtered_penguins <- penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 

penguins %>% 
  filter(bill_length_mm > 40 & sex == 'female') %>% 
  group_by(species, island) %>% 
  summarize(mean_body_mass = mean(body_mass_g), max_body_mass = max(body_mass_g), count = n()) %>% 
  write.csv('penguins-1.csv')
  arrange(desc(mean_body_mass)) #arrange from largest to smallest

getwd()

## Penguins ####

library(palmerpenguins)
View(penguins)

# 1. Find penguins with body mass over 5000
fattie <- penguins %>% 
 filter(body_mass_g > 5000)

# 2. count how many are male vs female
penguins %>% 
  filter(body_mass_g > 5000) %>% 
  group_by(sex) %>% 
  summarise(count = n())
  
# 3. return the max body mass for male and female 
penguins %>% 
  filter(body_mass_g > 5000) %>% 
  group_by(sex) %>% 
  summarise(count = n(), 
            fattest = max(body_mass_g))

penguins$body_mass_g %>% 
max(na.rm = T) # removes N/A in max body mass 

# 4. Add new column to penguins dataset that says wheter they're fat or not 
dat_penguin <- penguins
dat_penguin$fat_stat <- dat_penguin$body_mass_g > 5000
View(dat_penguin)


penguins %>% 
  mutate(fat_or_not = body_mass_g > 5000) %>% 
  View()

## Cols and Rows ####
ncol(penguins) # shows number of cols
nrow(penguins) # shows number of rows

bad_dat <- penguins

bad_dat %>% 
  select(-island) %>% # minus sign removes a column 
  View()

bad_dat %>% 
  select(-c(island,sex,year)) %>% 
  View()

dat_penguin <- penguins %>% 
  mutate(fat_or_not = case_when(body_mass_g > 5000 ~ 'fat', 
                                body_mass_g <= 5000 & body_mass_g >3000 ~ 'medium',
                                body_mass_g <= 3000 ~ 'skinny'))  # if true, ~ call it this
  View()

## NA ####
!is.na()
x= c(1,2,3,NA,5,NA)
is.na(x)
!is.na(x)
x[!is.na(x)] # removes NA from dataset
  
  
# Graphs ####
plot(dat_penguin$bill_length_mm, dat_penguin$body_mass_g)

library(ggplot2)

ggplot(data = dat_penguin) # without tidyverse
  
dat_penguin %>% #with tidyverse
   filter(!is.na(sex)) %>%  # removes N/A
   ggplot(aes(x = bill_length_mm, 
               y = body_mass_g, 
               color = sex,
              shape = fat_or_not))+ # build plot base; (+) adds a layer 
    geom_point()

dat_peng %>% 
  filter(!is.na(body_mass_g)) %>% # ! removes something 
  ggplot(aes(x = body_mass_g>5000, 
             y = species))+
  geom_point()

## add a straight line####
dat_peng %>% 
  ggplot(aes(x = bill_length_mm, 
             y = body_mass_g, 
             color = species))+
  geom_point() +
  scale_color_viridis_d()
geom_smooth(method = 'lm', se = F) # lm means "linear model" and creates a  straight line

## Color of plot data####
dat_peng %>% 
  ggplot(aes(x = bill_length_mm, 
             y = body_mass_g, 
             color = species))+
  geom_point() +
  scale_color_viridis_d()

### Manual Color ####
dat_peng %>% 
  ggplot(aes(x = bill_length_mm, 
             y = body_mass_g, 
             color = species))+
  geom_point() +
  scale_color_manual(values = c('Gentoo' = 'pink', 'Adelie' = 'lightblue', 'Chinstrap' = 'black')) +
  theme_dark() +
  theme(axis.text = element_text(angle = 180, face = 'italic')) # changes angle of x and y text and italicized it 

#### Ghibli color ####
  library(ghibli)

## Group and filter####
dat_peng %>% 
  filter(body_mass_g > 3000)%>%   # group is always followed by summarize
  group_by(species, sex) %>% 
  summarise(mean_body_mass_g = mean(body_mass_g), sd_body_mass_g = sd(body_mass_g))
ggplot(aes(x = mean_body_mass_g,
           color = species))+
  geom_bar(stat = 'identity')

## Bar graphs####
dat_peng %>% # bar graphs only have one variable 
  filter(body_mass_g > 5000) %>% 
  ggplot(aes(x = body_mass_g,
             color = species))+
  geom_bar()

dat_peng %>% 
  ggplot(aes(x = flipper_length_mm)) +
  geom_bar()

dat_peng %>% 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g,
             fill = species)) +
  geom_col()

dat_peng %>% 
  ggplot(aes(x = flipper_length_mm, y = body_mass_g,
             fill = species)) +
  geom_col(position = 'dodge') # dodge puts columns side by side

