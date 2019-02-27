# read the CPU data
dat = read.csv("https://raw.githubusercontent.com/peterkabai/dataScience/master/data/cpu.csv")

# plot the data to look at how pairs of features relate to each other
plot(dat)

# pick a feature and produce a scatterplot with 'prp' on the y axis
plot(dat$mmax, dat$prp)

# fit a linear model to the data using 'lm'
fit = lm(prp ~ mmax, data=dat)

# plot the predicted relationship on top of your plot from above
plot(dat$mmax, dat$prp)
abline(fit,col="red")

# compute the residuals
residuals = resid(fit)

# where are the differences between the actual 'prp' values and the predicted ones
plot(density(residuals))

# produce a scatter plot with the residuals on the y axis and the 
# predicted 'prp' values on the x axis
plot(dat$prp, residuals)
abline(0,0,col="red")

# examine the output of summary(fit) and plot(fit)
summary(fit)
plot(fit)

# pick two features to use as predictor variable, to predict 'prp'
fit = lm(prp ~ mmin + chmax, data=machine)

# run summary(fit) to get some information on your model
summary(fit)

# print the coefficients of your model
fit$coefficients

# print the adjusted R-squared value you obtained
summary(fit)$adj.r.squared

# produce a scatterplot in which the predicted prp values are shown on the x axis and 
# the actual prp values are shown on the y axis.
prediction = predict(fit, dat)
plot(prediction, dat$prp)

# run plot(fit) and look at the Residuals vs Fitted plot and the Normal Q-Q plot.
plot(fit)

# analyse for normal distribution, and constant residual variance
residuals = resid(fit)
plot(density(residuals))

# now use two different predictors
fit = lm(prp ~ myct + cach, data=dat)
residuals = resid(fit)
prediction = predict(fit, dat)
plot(prediction, dat$prp)
plot(density(residuals))

# now use all predictors
fit = lm(prp ~ ., data=dat)
residuals = resid(fit)
prediction = predict(fit, dat)
plot(prediction, dat$prp)
plot(density(residuals))
















#create training and test sets, using a 70/30 split.
training = sample()



samp = floor(0.70 * nrow(machine))
set.seed(123)
train_ind = sample(seq_len(nrow(machine)), size = samp)

train = machine[train_ind, ]
test = machine[-train_ind, ]

#3) This lab is open-ended.  I want you to experiment with building linear models using interactions 
# and nonlinear transformations, as discussed in class.  The goal is still to predict performance (feature ‘prp’).  Start simple.


#4) Predict prp using your test set, and write your own R code to compute the RMSE.
# The call to predict will look something like this:
predict(fit, newdata=te_data)

#5) For each experiment, I want you to pick some features, transform them in 
# some way (or not at all), and then build a linear model using the training data.
# Write down the adjusted R^2 score you get from function ‘summary’.
# Predict ‘prp’ using the test data, and use a scatter plot to show predicted versus actual values.  
# Also, use the predicted and actual values to compute the RMSE, and write that down.  
# Note: if you transform ‘prp’, you will need to account for that when you compute RMSE!


#6) See which features and transformations give you the best adjusted R^2 and RMSE scores.


#1) Read the CPU data:
machine = read.csv("https://raw.githubusercontent.com/grbruns/cst383/master/machine.csv")
machine = machine[,3:9]

#2) Split the data randomly into a training set and a test set, using a 70/30 split (70% training data).
sampleSize = floor(0.75 * nrow(machine))
set.seed(123)
trainingIndex = sample(seq_len(nrow(machine)), size = sampleSize)
train = machine[trainingIndex, ]
test = machine[-trainingIndex, ]

#3) Use lm to create a linear model to predict performance (feature ‘prp’).  
# Use a couple of predictor variables of your own choice.  Create the model using your training set.
fit = lm(prp ~ mmax + myct, data=train)

#4) Compute the RMSE of your model on the test data.
summary(fit)$adj.r.squared 
"0.7602922"

#5) Repeat steps 2-4, but this time use new randomly-generated test and training sets.
# How much does the RMSE differ?
trainingIndex = sample(seq_len(nrow(machine)), size = sampleSize)
train = machine[trainingIndex, ]
test = machine[-trainingIndex, ]
fit = lm(prp ~ mmax + myct, data=train)
summary(fit)$adj.r.squared
"0.7455862"

#6) If you have time, write code that will do steps 2-4 100 times, each time creating 
# different training/test sets.  Collect the computed RMSE values, and plot them on a histogram.
count = 1
errors = vector(mode="numeric")
repeat {
  trainingIndex = sample(seq_len(nrow(machine)), size = sampleSize)
  train = machine[trainingIndex, ]
  test = machine[-trainingIndex, ]
  fit = lm(prp ~ mmax + myct, data=train)
  errors = c(errors, summary(fit)$adj.r.squared)
  if (count == 100) {
    break
  }
  count = count + 1
}
hist(errors)

#7) If you still have time, repeat problem 6, but this time use an 80/20 split.
count = 1
errors = vector(mode="numeric")
sampleSize = floor(0.80 * nrow(machine))
repeat {
  trainingIndex = sample(seq_len(nrow(machine)), size = sampleSize)
  train = machine[trainingIndex, ]
  test = machine[-trainingIndex, ]
  fit = lm(prp ~ mmax + myct, data=train)
  errors = c(errors, summary(fit)$adj.r.squared)
  if (count == 100) {
    break
  }
  count = count + 1
}
hist(errors)

#8) If you *still* have time, write R code to perform 10-fold cross validation, and use it on your model.

