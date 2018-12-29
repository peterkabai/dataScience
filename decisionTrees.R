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

# import another library
library(maptree)

# load the heart dataset
dat = read.csv("https://raw.githubusercontent.com/peterkabai/dataScience/master/data/heart.csv")
#names(dat) <- c("AGE", "SEX", "CHESTPAIN", "RESTBP", "CHOL", "SUGAR", "ECG", "MAXHR", "ANGINA", "DEP", "EXERCISE", "FLUOR", "THAL", "OUTPUT")
#names(dat) = tolower(names(dat))
#dat$output = factor(dat$output)

# here is an R function to compute the Gini index
giniIndex = function(vec) {
  tbl = table(vec)
  probs = tbl/sum(tbl)
  terms = sapply(probs, function(p) p * (1 - p))
  return(sum(terms))
}

# test the gini index function
giniIndex(c(0,1,0,0,0,1,1,0))
giniIndex(sample(c(0:1), 10000, replace=TRUE))
giniIndex(c(0,0,0,0,0,0,0,0))

# assign all examples to a data frame 'node'
# which represents the root node of a classification tree
node = dat[,c("age","restbp","maxhr","output")]

# compute the Gini index of the node
giniIndex(node$output)

# load the CPU dataset
dat = read.csv("https://raw.githubusercontent.com/peterkabai/dataScience/master/data/cpu.csv")
dat = dat[,3:9]

# create training and test sets
set.seed(123)
splits = split(dat, 0.75)
train = splits[[1]]
test = splits[[2]]

# create a regression tree to predict variable 'prp' using variables 'cach', 
# 'myct', and 'mmin' with your training data
fit = rpart(prp ~ cach + myct + mmin, data=train)

# use 'summary' to look at your fitted model
summary(fit)

# plot the fitted tree
rpart.plot(fit)

# predict 'prp' values from your tree using your test data
prediction = predict(fit, test)

# plot your prediction errors as a histogram.
hist(prediction- test$prp)

# calculate the root mean squared error (RMSE), which is the square 
# root of the mean prediction error
sqrt(sum((prediction - test$prp)^2)/(nrow(test)))

# plot predicted against actual values
plot(prediction, test$prp, main="Predictions", ylab="Actual", xlab="Predicted")
points(test$prp, test$prp, type="l", col="blue")

# try again, this time using other features, possible all of the input features
# compare your error histograms with what you obtained from your first model
fit = rpart(prp ~ cach + mmax + mmin + chmax, data=train)
rpart.plot(fit)
prediction = predict(fit, test)
sqrt(sum((prediction - test$prp)^2)/(nrow(test)))
plot(prediction, test$prp, main="Predictions", ylab="Actual", xlab="Predicted")
points(test$prp,test$prp, type="l", col="blue")

# see how much the tree varies as you use different training/test sets
par(mfrow=c(3,1))

set.seed(123)
splits = split(dat, 0.75)
train = splits[[1]]
test = splits[[2]]
fit = rpart(prp ~ cach + mmax + mmin + chmax, data=train)
rpart.plot(fit)

set.seed(321)
splits = split(dat, 0.75)
train = splits[[1]]
test = splits[[2]]
fit = rpart(prp ~ cach + mmax + mmin + chmax, data=train)
rpart.plot(fit)

set.seed(213)
splits = split(dat, 0.75)
train = splits[[1]]
test = splits[[2]]
fit = rpart(prp ~ cach + mmax + mmin + chmax, data=train)
rpart.plot(fit)

# reset parameters
par(mfrow=c(1,1))
