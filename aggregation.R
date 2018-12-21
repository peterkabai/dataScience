# read the census data as a data frame
dat = read.csv("https://raw.githubusercontent.com/peterkabai/dataScience/master/data/census.csv")

# how many people are in each category of education?
edu_tbl = table(dat$education)
edu_tbl

# plot the table with using function 'plot'
plot(edu_tbl)

# plot the table with 'barplot'
barplot(edu_tbl)

# apply sort to edu_tbl, then plot
barplot(sort(edu_tbl))

# convert the table into a data frame, where one column
# shows education and the other column shows a count
frame = as.data.frame(edu_tbl)

# rename the columns of the data frame to "education" and "count"
names(frame) = c("education","count")
frame

# sort the data frame by decreasing count values
frame[order(-frame$count),]

# using 'table', find the count of each combination of sex and workclass
edu_tbl = table(dat$sex, dat$workclass)
edu_tbl

# convert your result to a dataframe, and then rename columns
frame = as.data.frame(edu_tbl)
names(frame) = c("Sex","Workclass","Frequency")
frame

# for each native country, what is the average education num?
age = aggregate(education_num ~ native_country, data=dat, mean)
age

# sort the resulting data frame by decreasing mean education num
age[order(-age$education_num),]

# for each occupation, compute the median age
age = aggregate(age ~ occupation, data=dat, mean)
age

# order the output by increasing age
inc = age[order(age$age),]
inc

# plot the result as a bar plot
barplot(inc$age, names.arg = inc$occupation)

# write a function is_adult that returns TRUE just when the input
# number is >= 21
is_adult = function(number) {
  if (number >= 21) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
is_adult(21) # should be true
is_adult(20) # should be false

# apply this function to every value of the 'age' column using 'sapply'
sapply(dat$age, is_adult)

# create a data frame by getting only capital_gain and capital_loss
# columns from dat
dat_new = dat[,c("capital_gain","capital_loss")]
dat_new

# create a vector consisting of the means of each column
means = c(mean(dat_new$capital_gain),mean(dat_new$capital_loss))
means

# create a vector of boolean values indicating, for each row,
# whether at least one of the two values was 0
at_least_one_zero = c(dat_new[,"capital_gain"] == 0 |  dat_new[,"capital_loss"] == 0)
at_least_one_zero

# using this vector, check whether all rows have at least one 0
all(at_least_one_zero)

# find median age by occupation, not using aggregation, but by
# creating a box plot
boxplot(age ~ occupation, data=dat)

# to make the occupation values easier to read, make a horizontal
# box plot
boxplot(age ~ occupation, data=dat, horizontal=TRUE)

# using one aggregate function call, get both the average
# education_num for each native country, as well as the number of people
# associated with that native country
agg = aggregate(
  education_num ~ native_country, 
  data=dat, 
  function(x) c(mean=mean(x), count=round(length(x)))
)
agg
