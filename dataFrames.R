# Create two vectors
v1 = c("one", "two", "three", "four")
v2 = c(1:4)

# Create data frame using the two vectors
dat = data.frame("word"=v1, "numbers"=v2, stringsAsFactors=FALSE)

# Get the number of rows in data frame
nrow(dat)

# Get the names of the colums
names(dat)

# Name of column 2 specifically
names(dat)[2]

# Rows for which the “points” column value is > 2
dat[dat$numbers > 2,]

# Get rows for which the length of the "word" column value is > 3
dat[length(dat$word) > 3]

# Get two randomly selected rows
# This samples 2 numbers from 1 to 4 for the rows in dat
# Note that the columns is blank, meaning "all columns"
# Rows always come before colums
dat[sample(1:4, 2, FALSE),]

# Change the name of the second column
names(dat) = c("let", "num")
dat[]