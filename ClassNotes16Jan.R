# 1st level ####
'this' 
list.files(path = 'Assignments/')
# recursive = F (default): only search current directory
# recursive = T: search current and all subdirectories 

list.files(path = 'Data/', recursive = F)
list.files(path = 'Data/', recursive = T)

## how many total files under 'Data' directory, including subdirectories 
list.files(path = 'Data/', recursive = T)
## answer is 1000

list.files(path = 'Assignments/') #print out results on screem
obj_1 <- list.files(path = 'Assignments/') #save results in an object
length(obj_1)


echo 'some' #print on the screen
echo 'some' > README.md # save into README.md

print() # () means a function
list.files() # this is a function

no_of_files = length(obj_1)
no_of_files

# echo in bash = print() in R = print
print('something')
print(obj_1)
print(length(obj_1))


list.files(path = 'Data/', pattern = '.csv')

## file name starts with something
list.files(path = 'Data/', pattern = '^') # ^ means beginning with
list.files(path = 'Data/', pattern = '^B')

# end with
list.files(path = 'Data/', pattern = 'b$', recursive = T) # $ means ending with 

## to learn more, search: regex (regular expression which is short and precise)

readLines('Data/wide_income_rent.csv')

line = readLines('Data/wide_income_rent.csv')
length(line)

read.csv('Data/wide_income_rent.csv')

## read a file and save into an object
df_rent_by_state = read.csv('Data/wide_income_rent.csv')
df_rent_by_state
dim(df_rent_by_state) # 2 53 [no of rows, no of cols]

df_rent_by_state = read.csv('Data/wide_income_rent.csv', header = F)
dim(df_rent_by_state)
