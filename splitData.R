split = function(dat, frac) {
  rowsToSample = round(nrow(dat)*frac)
  indices = sample(nrow(dat), rowsToSample)
  train = dat[indices,]
  test = dat[-indices,]
  return(list(train, test))
} 

# create data frame using the two vectors
v1 = c("one", "two", "three", "four")
v2 = c(1:4)
dat = data.frame("word"=v1, "numbers"=v2, stringsAsFactors=FALSE)

# split the data
splitData = split(dat, 0.75)
splitData[[1]]
splitData[[2]]