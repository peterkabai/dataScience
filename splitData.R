split = function(dat, frac) {
  rowsToSample = round(nrow(dat)*frac)
  indices = sample(nrow(dat), rowsToSample)
  train = dat[indices,]
  test = dat[-indices,]
  return(list(train, test))
}