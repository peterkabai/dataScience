# Write a function 'myerr' that takes two vectors x1, x2 as input and returns the 
# sum of the squared differences between corresponding elements of x1 and x2.
# Use 'stopifnot' to ensure that x1 and x2 are the same length, and have length > 0 
# before doing the computation.
myerr = function(x, y) {
  stopifnot(length(x) == length(y))
  squaredDiff = (x-y)^2
  return (sum(squaredDiff))
}

# Write some test code that calls your function.
# This should output: 0.34
myerr(1:5, c(1.2, 2.1, 3.5, 4.0, 4.8)) 

# Write a function 'myerr2', which is like myerr but it take a third 
# parameter, "tolerance". This new function returns the fraction of 
# elements having a squared difference above the tolerance.
myerr2 = function(x, y, tolerance) {
  stopifnot(length(x) == length(y))
  squaredDiff = (x-y)^2
  isOver = squaredDiff[ squaredDiff > tolerance]
  return (length(isOver)/length(squaredDiff))
}

# Write some test code that calls your function.
# This should output: 0.2
myerr2(1:5, c(1.2, 2.1, 3.5, 4.0, 4.8), 0.2)

# Modify your myerr2 function so that the default value 
# of the 'tolerance' parameter is 0.2
myerr2 = function(x, y, tolerance=0.2) {
  stopifnot(length(x) == length(y))
  squaredDiff = (x-y)^2
  isOver = squaredDiff[ squaredDiff > tolerance]
  return (length(isOver)/length(squaredDiff))
}

# Write some test code that calls your function.
# This should output: 0.2
myerr2(1:5, c(1.2, 2.1, 3.5, 4.0, 4.8), 0.5)

# Write a function 'edist' that takes inputs x1, y1, x2, and y2 and 
# returns the Euclidean distance between (x1,y1) and (x2,y2). 
# Write this function on one line of code.
edist = function(x1, y1, x2, y2 ) {
  return (sqrt((x2 - x1)^2 + (y2 - y1)^2))
}

# Write code to test your function.
edist(1,1,2,2)
edist(0,0,3,4)

# Write a function ‘df_dist’ that takes two parameters: 
# a) a data frame with four numeric columns (x1,y1,x2,y2), and 
# b) a distance function dist_fun. The function should return the vector that is the 
# result of applying the distance function to each row of the data frame.  
# Use a ‘for’ loop in your function.
df_dist = function(dat, dist_fun) {
  distances = c()
  for(i in 1:nrow(dat)) {
    distances = c(distances, dist_fun(dat[i,1], dat[i,2], dat[i,3], dat[i,4]))
  }
  return (distances)
}

# Test your function by creating a data frame, and then calling your 
# function using the ‘edist’ function you wrote in the previous problem.
x1 = rep(0,10)
y1 = rep(0,10)
x2 = 1:10
y2 = 1:10
dat = data.frame(x1, y1, x2, y2)
df_dist(dat, edist)

# Write a function to take as input a data frame with only two 
# columns (x and y), and a distance function. 
# The data frame must have at least two rows.
# The result should be a vector of the distances between 
# rows 1 and 2, rows 2 and 3, etc.
row_dist = function(dat, dist_fun) {
  stopifnot(nrow(dat) >= 2)
  i = 1
  distances = c()
  while (i < nrow(dat)) {
    distances = c(distances, dist_fun(dat[i,1], dat[i,2], dat[i+1,1], dat[i+1,2]))
    i=i+2
  }
  return (distances)
}

# Create a data frame and test your new function.
x = 1:10
y = 1:10
dat = data.frame(x, y)
row_dist(dat, edist)
