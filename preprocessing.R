# read the red wine data, which measures physical characteristics of wine
dat = read.csv("https://raw.githubusercontent.com/peterkabai/dataScience/master/data/wine.csv")

# make a small version of the data set by selecting 20 random rows of it
small = dat[sample(1:nrow(dat), 20),]

# scale the data using Z score normalization.
scaled_small = scale(small)

# find the column minimums as a vector
apply(scaled_small, 2, min)

# find the column maximums as a vector
apply(scaled_small, 2, max)

# scale the original data using unit interval normalization
scaled_large = scale(dat, center=TRUE)

# find the column mins and maxes
apply(scaled_large, 2, min)
apply(scaled_large, 2, max)

# use the function cor() on the large dataset to 
# see how the features are correlated.
correlation = cor(scaled_large)

# display the correlations with a plot
heatmap(
  correlation, 
  Rowv=NA, Colv=NA, 
  col = blues9, 
  scale="column", 
  margins=c(10,10)
)

# show the features  most correlated to the 'quality'
correlation[correlation==1.00] = 0
sort(correlation[,"quality"], decreasing=TRUE)[1]
sort(correlation[,"quality"], decreasing=TRUE)[2]
sort(correlation[,"quality"], decreasing=TRUE)[3]
