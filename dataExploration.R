# load the census data from the csv file
dat = read.csv("https://raw.githubusercontent.com/peterkabai/dataScience/master/data/census.csv")

# print the datatype for each column
str(dat)
  
# use 'summary' to get some statistics on the 'education_num' attribute
summary(dat$education_num)

# since it is a categorical feature, you need to display 'education_num'
# with a barplot not a histogram
barplot(table(dat$education_num))
  
# plot 'capital_gain' with a density plot
plot(density(dat$capital_gain))

# look at 'workclass', andplot it in the most appropriate way
summary(dat$workclass)
par(mar=c(3,10,3,3))
barplot(table(dat$workclass), horiz=TRUE, las=1)

# use a bar plot to show the distribution of attribute 'sex'
par(mar=c(3,3,3,3))
barplot(table(dat$sex))

# use a horizontal bar plot to visualize attribute 'marital_status'
par(mar=c(3,10,3,3))
barplot(table(dat$marital_status), horiz=TRUE, las=1)

# visualize 'relationship'
par(mar=c(3,10,3,3))
barplot(table(dat$relationship), horiz=TRUE, las=1)

# percentage where native country is united states
table(dat$native_country)[["United_States"]]/nrow(dat)

# load the  US News and World Report college data 
dat = read.csv("https://raw.githubusercontent.com/peterkabai/dataScience/master/data/college.csv")

# create scatter plots to compare some of the variables
# do smaller colleges spend more
plot(Expend ~ F.Undergrad, data=dat)

# do smaller colleges charge more
plot(Outstate ~ F.Undergrad, data=dat, pch=".")

# plot the tuition vs the percent of applicants accepted
percent.accept = dat$Accept/dat$Apps
percent.accept
plot(dat$Outstate, percent.accept, pch=".")

# plot the tuition vs the percent of applicants enrolled
percent.enroll = dat$Enroll/dat$Apps
percent.enroll
plot(dat$Outstate, percent.enroll, pch=".")

# plot the numebr of accepted students vs the number of
# applications with a line of best fit
plot(Accept ~ Apps, data=dat)
fit = lm(Accept ~ Apps, data=dat)
abline(fit, lwd=1, col="blue")

# plot a mean, median, min, or max line
abline( h=mean(dat$Accept), lwd=2, col="red")
abline( h=min(dat$Accept), lwd=2, col="yellow")
abline( h=max(dat$Accept), lwd=2, col="green")

# plot the density plot for 'F.Undergrad' values 
# and add lines to divide the data into thirds
top_of_small = quantile(dat$F.Undergrad, 1/3)[[1]]
top_of_medium = quantile(dat$F.Undergrad, 2/3)[[1]]
plot(density(dat$F.Undergrad))
abline( v=top_of_small, lwd=1, col="red")
abline( v=top_of_medium, lwd=1, col="red")

# add a column to the data, with small, medium and large values 
# determined by the 'F.Undergrad' value and the thirds
dat$Size = ifelse(
  dat["F.Undergrad"] < top_of_small, "small", ifelse(
    dat["F.Undergrad"] < top_of_medium, "medium", "large"
  )
)

# make a scatterplot with 'PhD' on the x axis and 'Outstate' on the y axis
# for each third using the 'Size' column
par(mfrow=c(3,1))
plot(dat$PhD[dat$Size == "small"], dat$Outstate[dat$Size == "small"])
plot(dat$PhD[dat$Size == "medium"], dat$Outstate[dat$Size == "medium"])
plot(dat$PhD[dat$Size == "large"], dat$Outstate[dat$Size == "large"])

# plot again on a single scatterplot, with color used to distinguish the thirds
par(mfrow=c(1,1))
plot(
  dat$PhD, 
  dat$Outstate,
  pch=20,
  col=ifelse(dat["Size"] == "small", "green", ifelse(dat["Size"] == "medium", "yellow", "red"))
)

# show 3 histograms of the PhD variable, one each for 
# small, medium, and large schools
par(mfrow=c(3,1))
hist(
  dat$PhD[dat$Size == "small"], 
  main="Histogram of PhD's for Small Colleges", 
  xlab="PhD's",
  xlim=c(0,100),
  ylim=c(0,100)
)
hist(
  dat$PhD[dat$Size == "medium"], 
  main="Histogram of PhD's for Medium Colleges", 
  xlab="PhD's",
  xlim=c(0,100),
  ylim=c(0,100)
)
hist(
  dat$PhD[dat$Size == "large"], 
  main="Histogram of PhD's for Large Colleges", 
  xlab="PhD's",
  xlim=c(0,100),
  ylim=c(0,100)
)
