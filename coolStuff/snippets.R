# Snippets of code I find useful

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

