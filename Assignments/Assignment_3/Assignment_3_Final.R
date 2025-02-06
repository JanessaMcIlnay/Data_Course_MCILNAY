
# YOUR REMAINING HOMEWORK ASSIGNMENT (Fill in with code) ####

# 1.  Get a subset of the "iris" data frame where it's just even-numbered rows
iris -> dat_iris
dat_iris[seq(2,150,2),]


# 2.  Create a new object called iris_chr which is a copy of iris, except where every column is a character class
names(iris)
for (col in names(iris)) {
  iris[, col] <- as.character(iris[, col])
}
str(iris)

# 3.  Create a new numeric vector object named "Sepal.Area" which is the product of Sepal.Length and Sepal.Width
for (col in names(dat_iris)) {
  dat_iris[, col] <- as.numeric(dat_iris[, col])
}
str(dat_iris)
Sepal.Area <- dat_iris$Sepal.Length*dat_iris$Sepal.Width

# 4.  Add Sepal.Area to the iris data frame as a new column
dat_iris$Sepal.Area <- dat_iris$Sepal.Length*dat_iris$Sepal.Width
View(dat_iris)


# 5.  Create a new dataframe that is a subset of iris using only rows where Sepal.Area is greater than 20 
# (name it big_area_iris)
dat_iris[dat_iris$Sepal.Area > 20,]
big_area_iris <- dat_iris[dat_iris$Sepal.Area > 20,]
View(big_area_iris)


# 6.  Upload the last numbered section of this R script (with all answers filled in and tasks completed) 
# to canvas
# I should be able to run your R script and get all the right objects generated
