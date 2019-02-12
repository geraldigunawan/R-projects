#create a vector
name <- c("Mike", "Lucy", "John")
age <- c(20, 25, 30)
name
for (i in name){
  print(i)
}

#create array/maxtrix
x <- matrix(c(1,2,3,4,5,6,7,8), nrow=3, ncol=4)
x
x[-1,-2]
x[-2,]
for (i in x[,2]){
  print(i)
}

#create a list
y <- list(name="Mike", gender="M", company="ProgramCreek")
y
y$name
y$gender
for (i in y){
  print(i)
}

#create a dataframe
name <- c("Mike", "Lucy", "John")
age <- c(20, 25, 30)
student <- c(TRUE, FALSE, TRUE)
df = data.frame(name,age,student)
df
for (i in df){
  print(i)
}