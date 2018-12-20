# compute vector child1, a vector of 10^4 (10,000) samples of 1 (boy) or 2 (girl)
child1 = sample(1:2, 10^4, TRUE)
child1

# c another vector child2, in the same way
child2 = sample(1:2, 10^4, TRUE)
child2

# count the number of families with at least one girl
one_girl = child1[] + child2[] > 2
sum(one_girl)

# count the number with both girls
both_girls = child1[] + child2[] == 4
sum(both_girls)

# estimate the conditional probability of a family having two 
# girls if it has at least one girl.
sum(both_girls)/sum(one_girl)

# find the number of families in which the second child is a girl
elder_girl = child2[] == 2
sum(elder_girl)
  
# then estimate the probability has two girls given the family has an elder girl.
sum(both_girls)/sum(elder_girl)

# run your code a bunch of times to see how much your results vary
two_girls_given_elder_girl = function() {
  child1 = sample(1:2, 10^4, TRUE)
  child2 = sample(1:2, 10^4, TRUE)
  elder_girl = child2[] == 2
  both_girls = child1[] + child2[] == 4
  return(sum(both_girls)/sum(elder_girl))
}
results = replicate(10000, two_girls_given_elder_girl())
dev.off()
hist(results, breaks=75, main="Two Girls Given Elder Girl")
