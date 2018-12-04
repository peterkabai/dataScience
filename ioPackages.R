# Read csv file from a URL
url = "https://raw.githubusercontent.com/peterkabai/dataScience/master/data/censusSample.csv"
dat = read.csv(url)

# Display first few lines
head(dat)

# Count the number of rows in the datafram
nrow(dat)

# Get the unique values in the marital status column
unique(dat$marital_status)

# Get the number of unique native countries
length(unique(dat$native_country))

# Get the min and max of age
min(unique(dat$age))
max(unique(dat$age))

# Create a new dataframe by randomly sampling 500 rows from the data frame without replacement
datSample = dat[sample(1:nrow(dat), 500, FALSE), ]

# Count the rows, there should be 500
nrow(datSample)

# Write newDat to a csv file in the working directory
write.csv(datSample, "census-sample.csv")

# Write to a data file in the working directory
save(datSample, file="census-sample.RData")
