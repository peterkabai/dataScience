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
