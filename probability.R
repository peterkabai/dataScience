# In simulate 10,000 rolls of a die, and calculate the fraction 
# of those rolls that are a prime number.
prime_numbers = c(1,3,5,7,11)
rolls = sample(1:6, 10000, TRUE)
num_primes = length(rolls[rolls %in% prime_numbers])
num_primes/length(rolls)

# repeat problems 1 and 2, but this time for the roll of two dice,
# when rolling two dice we look at the sum of the dice.
rolls = sample(1:6, 10000, TRUE) + sample(1:6, 10000, TRUE)
num_primes = length(rolls[rolls %in% prime_numbers])
num_primes/length(rolls)

# simulate rolling a die until a 6 is rolled, and then record the number of rolls
# run 10000 simulations and plot your result with a histogram
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
