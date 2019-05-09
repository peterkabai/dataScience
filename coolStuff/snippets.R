# ------------------------------ 
# Snippets of code I find useful
# ------------------------------

# Concatinate all values in a vector
c = c("a"," ","l","o","t"," ","o","f"," ","s","t","r","i","n","g","s")
s = paste(c, collapse="")
s

# Generate sequences of letters
length(letters)
# Sample just the letters 'a' to 'j'
letters[1:10]
# Randomly sample 100 letters
sample(letters, 100, TRUE)
# Same thing with capital letters
sample(LETTERS, 100, TRUE)

# The R implimentation of "_ is in _"
colors = c("red","blue","green","yellow")
"purple" %in% colors
"yellow" %in% colors

# ----------------------
# Playing with try catch
# ----------------------
tryCatch({
  table(1:10, 1:5)
}, error = function(e) {
  print("Nope, didn't work")
})

# ---------------------------------------------
# Stacked bar graph with unequal vector lengths
# ---------------------------------------------

# Here, samples of different lengths are created
sun = sample(0:23, 1000, replace = TRUE)
mon = sample(0:23, 500, replace = TRUE)

# Putting it into a table fails, since they are different lengths.
# Instead, each table is created seperatly
sunday = table(sun)
monday = table(mon)

# And then is combined using rbind
combined = rbind(sunday, monday)

# This can then be used to plot the barplot.
barplot(combined, legend = rownames(combined), col=c("red","blue"), beside=TRUE)


