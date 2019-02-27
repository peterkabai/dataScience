# Simulate 10,000 rolls of a die, and calculate the fraction 
# of those rolls that are a prime number.
prime_numbers = c(1,2,3,5,7,11)
rolls = sample(1:6, 10000, TRUE)
num_primes = length(rolls[rolls %in% prime_numbers])
num_primes/length(rolls)

# Repeat, but this time for the roll of two dice.
rolls = sample(1:6, 10000, TRUE) + sample(1:6, 10000, TRUE)
num_primes = length(rolls[rolls %in% prime_numbers])
num_primes/length(rolls)

# Simulate rolling a die until a 6 is rolled, and then record the number of rolls
# run 10000 simulations and plot your result with a histogram.
roll_till_six = function() {
  roll = 1
  roll_count = 0
  while (roll != 6) {
    roll = sample(1:6, 1, TRUE)
    roll_count = roll_count + 1
  } 
  return(roll_count)
}
counts = replicate(10000, roll_till_six())
hist(counts)

# Here's a better way to do it, without a while loop
roll_six = function(num_rolls = 0) {
  roll = sample(1:6, 1)
  num_rolls = num_rolls + 1
  ifelse (roll != 6, roll_six(num_rolls), num_rolls)
}
counts = replicate(10000, roll_six())
hist(counts)

# You apply to 10 companies for a job, and each company offers
# jobs to 20% of (qualified) applicants. Compute a sample of
# replies, using 0 for no offer, and 1 for offer.
samp = sample(c(0,0,0,0,1), 10, TRUE)
samp

# Repeat the experiment 10,000 times, and record in a vector
# the number of offers for each experiment.
vec = replicate(10000, sum(sample(c(0,0,0,0,1), 10, TRUE)))
vec

# Plot your vector from above as a bar plot, showing for each possible
# value 0-10, the fraction of experiments that resulted in that value.
barplot(table(vec))

# Using your data from before, create another graph, but this time,
# for value i (from 0-10) show the fraction of experiments in which
# the number of offers was less than or equal to i. 
# The value for 10 should be 1.0 because all values are 10 or less.
probs = cumsum(table(vec))/10000
probs
barplot(probs)

# Repeat the experiment 10,000 times, and record in a vector, 
# but this time get your vector using the function 'rbinom'.
vec = replicate(10000, sum(rbinom(10, 1, 0.2)))

# Create one more plot as before, but this time get the values
# from calls to 'dbinom'.

# TODO: fix this
vec = dbinom(10, 1, 0.2)
plot(vec)

# Create another plot as before, but this time get the 
# values from calls to 'pbinom'.

# Work out the probability of getting 2 job offers after 8 applications, 
# given the the probability of an offer in one application is 0.1.  
vec = replicate(10000, sum(rbinom(8, 1, 0.1)))
mean(vec == 2)

# Plot the PDF of a normal distribution with mean 5 and standard deviation 0.5.
# Let the x axis range from 3 to 7. Use R's 'curve' function, which plots a 
# function over some range. The function that gives the density 
# of the normal distribution is 'dnorm'. 
curve(dnorm(x, 5, 0.5), 3, 7)

# Sample 1000 values from the normal distribution we saw above.
# Produce a histogram of your values. Run your code a few times to see how the histogram varies.
hist(rnorm(1000, 5, 0.5))

# Suppose a distance measurement is made between two points that are 
# exactly 10 meters apart, but that there is measurement error, so 
# the observed distance is 10 + X, where X is a continuous 
# random variable with a normal distribution having mean 0 and variance 0.04.
# Plot the PDF of observed observed measurements using R functions 'curve' and 'dnorm'.
curve(dnorm(x, 10, 0.04), 9, 11)

# What range of measurement values would you expect 68% of the data to fall within?
"9.9"

# What is the probability that the observed measurement is within 0.4 
# meters of the true distance? Solve the problem in two ways: 
# once analytically, and once through simulation.  
# Hint: use the idea of part b for the analytical part.

# In one of the problems above we plotted a histogram 
# of 1000 samples from a normal distribution. Figure out how you could plot 
# the histogram and then superimpose on the histogram the PDF 
# of the normal distribution. Hint: look at the help page for 'hist'.

