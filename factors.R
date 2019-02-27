# Factors, lists and matrices

# Lets start wuth factors

# Create a vector 'gear' of ordered factor values from the 
# column 'gear' of the mtcars dataset.
gear = ordered(mtcars$gear)

# Display the levels of the factor.
gear

# Now let's do some lists

# Create a list x having component 'a' of value "foo",
# component 'b' of value 1:4, and component 'c' of 
# value function(x) 1.5 * x^2 to c.
x = list(a="foo", b=1:4, c=function(x){1.5 * x^2})
x

# Get the length of the 'a' component of list x, 
# selecting the component by name, then the 'b' component.
length(x$a)
length(x$b)

# Get the second and third elements of component b, accessing the 
# list component by its index number.
x[[2]][c(2,3)]

# Apply function component 'c' of list x to value 2.5
x$c(2.5)

# Define a function avgsum that takes a numeric vector x, and
# returns a list with two elements: 'a', which is the average
# value of x, and 'b', which is the sum of x. Use 'stop' or
# 'stopifnot' to handle the case of an empty list.
avgsum = function(x) {
  stopifnot(length(x) > 0)
  return( list(a=mean(x), b=sum(x) ))
}

# Apply the function to 1:1000, and get the second 
# component of the result.
avgsum(1:1000)

# Create a list y containing two vectors: 'a', with value 1:1000,
# and 'b', with value 1001:2000
y = list(a=1:1000, b=1001:2000)

# Show the first elements of component b of list y.
head(y$b)

# Finally, here we'll do matrices

# Create a 100 x 3 matrix of random values between 1 and 10
x = matrix(sample(1:10, 300, TRUE), nrow=100, ncol=3)
x

# Set the column names of x to "x1", "x2", "x3".
colnames(x) = c("x1", "x2", "x3")

# Show the first rows of matrix x.
head(x)

# Compute the dimensions of matrix x.
dim(x)

# Create a 3 x 1 matrix b containing values 1.2, -0.24, 0.61
b = matrix(c(1.2,-0.24,0.61))
b

# Confirm the dimensions of matrix b.
dim(b)

# Perform matrix multiplication of x and b. Before doing this,
# make sure the understand the dimension of the resulting matrix.
r = x %*% b
r

# Check the dimensions of the resulting matrix.
dim(r)

# Look at the first values of the resulting matrix.
r[1]

# Compute the average value of matrix x.
mean(x)

# Figure out how to create a 3-dimensional plot of the 
# feature vectors in matrix x.
library(scatterplot3d)
scatterplot3d(x, main="Plot of Matrix X")
