# read in the college data
dat = read.csv("https://raw.githubusercontent.com/peterkabai/dataScience/master/data/college.csv")

# replace the values of feature "Private" with a new feature called "PrivPub"
dat$PubPriv = factor(ifelse(dat$Private == "Yes", "private", "public"))
dat$Private = NULL

# do some exploration of the data to remember what it’s like
str(dat)
summary(dat)

# create training and test sets
source("https://raw.githubusercontent.com/peterkabai/dataScience/master/splitData.R")
set.seed(123)
splits = split(dat, 0.75)
train = splits[[1]]
test = splits[[2]]

# install the "rpart" package, and then build a tree classifier using rpart 
# predict whether a college is public or private based on features in the data
# pick a few features that you think are relevant, train with your training data set
library(rpart)
fit = rpart(PubPriv ~ S.F.Ratio + Top10perc, data=train, method="class")

# install the "rpart.plot" package and plot your classification tree
# try playing with some of the options
library(rpart.plot)
rpart.plot(fit)

# use your classification tree to predict whether examples 
# in your test data are public or private
predicts = predict(fit, test, type="class")

# compute the confusion matrix and the accuracy of your predictions
actuals = test$PubPriv
length(actuals)
length(predicts)
table(predicts, actuals)


