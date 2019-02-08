#
# lab work for R lecture 9 - R factors, lists, and matrices
#

#############################################################
#
# factors
#
#############################################################

#
# let's look at the mtcars dataset (again)
#

# create a vector 'gear' of ordered factor values from the column 'gear'
# (do you need to specify the ordering of the factor levels?)
gear = ordered(mtcars$gear)

# display the levels of the factor
gear

#############################################################
#
# lists
#
#############################################################

# create a list x having component 'a' of value "foo", component 'b' of value 1:4,
# and component 'c' of value function(x) 1.5 * x^2 to c
x = list(a="foo", b=c(1:4), c=function(x){1.5 * x^2})

# get the length of the 'a' component of list x, selecting the component by name
length(x$a)

# get the second and third elements of component b, accessing the 
# list component by its index number
x[[2]]
x[[3]]

# apply function component 'c' of list x to value 2.5
x$c(2.5)

# define a function avgsum that takes a numeric vector x, and
# returns a list with two elements: 'a', which is the average
# value of x, and 'b', which is the sum of x.  Use 'stop' or
# 'stopifnot' to handle the case of an empty list
avgsum = function(x) {
  stopifnot(length(x) > 0)
  return( list(a=mean(x), b=sum(x) ))
}

# apply the function to 1:1000, and get the second component of
# the result
avgsum(1:1000)

# create a list y containing two vectors: 'a', with value 1:1000,
# and 'b', with value 1001:2000.
y = list(a=(1:1000), b=(1001:2000))

# show the first elements of component b of list y
y$b

# y is a lot like a data frame: it is a list of vectors where
# all the vectors have the same length.  However, can you access
# the b component of the third "row" of y, like you could with
# a data frame?  Try it.

# No you can't

#############################################################
#
# matrices
#
#############################################################

# create a matrix of feature vectors
# In particular, create a 100 x 3 matrix of random values
# between 1 and 10.
mat = matrix(sample(1:10, 300, TRUE), nrow=100, ncol=3)

# set the column names of x to "x1", "x2", "x3"


# show the first rows of matrix x


# compute the dimensions of matrix x


# Create a 3 x 1 matrix b containing values 1.2, -0.24, 0.61.


# confirm the dimensions of matrix b


# perform matrix multiplication of x and b.  Before doing this,
# make sure the understand the dimension of the resulting matrix


# check the dimensions of the resulting matrix


# look at the first values of the resulting matrix


# if each row of matrix x represents a feature vector, then how would you describe
# matrices b and z?

# ANSWER: b is a vector of linear coefficients; each value in z can be thought of as a
# "weighted combination" of a feature vector (i.e. a row) of x

#
# if time permits...
#

# compute the average value of matrix x


# figure out how to create a 3-dimensional plot of the feature vectors in matrix x
# Google is your friend.



