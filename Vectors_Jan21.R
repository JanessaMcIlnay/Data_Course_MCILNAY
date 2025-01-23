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
list.files(path = 'Data/', pattern = '.csv$', recursive = T)
vec_2 = list.files(path = 'Data/', pattern = '.csv$', recursive = T)
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

### types of objects in R####
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

#### loops ####

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
