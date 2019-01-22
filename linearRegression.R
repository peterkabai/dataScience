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
