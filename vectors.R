# creates a vector of strings
v1 = c("foo", "bar", "baz")

# gets the first value
# note that R is not 0 indexed
v1[1]

# creates a vector of numbers
v2 = c(1, 2, 3)

# concatinate vectors
# dote that "paste" concatinates with spaces and "paste0" without spaces
paste(v1, v2)
paste0(v1, v2)

# generate 10 random numbers from 1 to 100
# note the "FALSE" argument means without replacement
# the default is "TRUE" meaning there can be duplicates
x = sample(1:100, 10, FALSE)
print(x)

# the mean can be found in multiple ways
mean(x)
sum(x)/length(x)

# the trim argument is used to cut off a fraction of observations before finding the mean
# by default it's 0
mean(c(1,2,3,4,5,6,7,8,9,10), 0.2)

# the "na.rm" argument can remove "NA" values before computing
mean(c(1,3,NA,NA,NA))
mean(c(1,3,NA,NA,NA), na.rm=TRUE)   

# here are some other functions that can be used on vectors
v = c(1,2,3,4,5,6,7,8,9,10)
min(v)
max(v)
