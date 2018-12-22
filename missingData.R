# load the built in 'airquality' data
dat = airquality

# display the first rows of the data frame in the console
dat[1,]

# what are the types of the columns in the data frame
names(dat)

# what is the total number of NA values in the data frame
sum(is.na(dat))

# show how many rows contain NA values
sum(!complete.cases(dat))

# for each column, show the fraction of the column values that are NA values
apply(dat, 2, function(x) sum(!complete.cases(x))/length(x))

# for each row, show the fraction of the row values are NA
apply(dat, 1, function(x) sum(!complete.cases(x))/length(x))

# plot for each column the fraction of the values in that column that are NA
plot(
  apply(dat, 2, function(x) sum(!complete.cases(x))/length(x)), 
  main="Fraction of NA's per Column", 
  ylab="Fraction of NA's", 
  xlab="Column Number"
)

# create a new data frame dat_cleanrows that is like dat except 
# all rows containing NA values are removed
dat_cleanrows = dat[complete.cases(dat),]

# create a new data frame dat_cleancols that is like dat except 
# all columns containing NA values are removed
dat_cleancols = dat[,colSums(is.na(dat)) == 0]

# print which contains more data, dat_cleanrows or dat_cleancols
size_of_col_dat = dim(dat_cleancols)[1]*dim(dat_cleancols)[2]
size_of_row_dat = dim(dat_cleanrows)[1]*dim(dat_cleanrows)[2]
if (size_of_col_dat > size_of_row_dat) {
  print("With NA rows removed")
} else {
  print("With NA cols removed")
}

# create a new data frame dat_med from the original data frame
# by replacing each NA value with the median of its column
dat_med = as.data.frame(sapply(dat, function(x) { x[is.na(x)] == mean(x, na.rm = TRUE)
  x
}))
dat_med

# create a new data frame dat_med from your original data frame
# by replacing each NA value with the mean of its column
dat_mea = as.data.frame(sapply(dat, function(x) { x[is.na(x)] == mean(x, na.rm = TRUE)
  x
}))
dat_mea

# load the US product safety violations data
dat = read.csv("https://raw.githubusercontent.com/peterkabai/dataScience/master/data/productSafety.csv")

# Explore this data for NA values
explore_na = function(dat) {
  print(paste(sum(is.na(dat)), "NA values"))
  dat_cleanrows = dat[complete.cases(dat),]
  dat_cleancols = dat[,colSums(is.na(dat)) == 0]
  size_of_col_dat = dim(dat_cleancols)[1]*dim(dat_cleancols)[2]
  size_of_row_dat = dim(dat_cleanrows)[1]*dim(dat_cleanrows)[2]
  if (size_of_col_dat > size_of_row_dat) {
    print("Less data lost if NA cols removed")
  } else {
    print("Less data lost if NA rows removed")
  }
}
explore_na(dat)
