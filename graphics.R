# using mtcars, create a scatterplot showing each car’s mpg 
# as a function of engine displacement
plot(
  mtcars$disp, 
  mtcars$mpg
)

# change the x,y axis labels to “displacement” and “mileage (mpg)”. 
plot(
  mtcars$disp, 
  mtcars$mpg, 
  xlab="Displacement", 
  ylab="Mileage (MPG)"
)

# make the dots dark blue.
plot(
  mtcars$disp,
  mtcars$mpg, 
  xlab="Displacement", 
  ylab="Mileage (MPG)", 
  col="dark blue"
)

# make the dots solid.
plot(
  mtcars$disp, 
  mtcars$mpg, 
  xlab="Displacement", 
  ylab="Mileage (MPG)", 
  col="dark blue", 
  pch=19
)

# add a grid.
plot(
  mtcars$disp, 
  mtcars$mpg, 
  xlab="Displacement", 
  ylab="Mileage (MPG)", 
  col="dark blue", 
  pch=19
)
grid(col="lightgray")

# add a title.
plot(
  mtcars$disp, 
  mtcars$mpg, 
  xlab="Displacement",
  ylab="Mileage (MPG)", 
  col="dark blue", 
  pch=19, 
  main="Mileage by Displacement")
grid(col="lightgray")

# add a dotted red horizontal line showing the average miles per gallon.
plot(
  mtcars$disp, 
  mtcars$mpg, 
  xlab="Displacement", 
  ylab="Mileage (MPG)", 
  col="dark blue", 
  pch=19, 
  main="Mileage by Displacement"
)
grid(col="lightgray")
abline(h=mean(mtcars$mpg), col="red", lty=3)

# color the dots according to manual or automatic transmission (column ‘am’, where am == 0 mean automatic transmission).  
plot(
  mtcars$disp, 
  mtcars$mpg, 
  xlab="Displacement", 
  ylab="Mileage (MPG)", 
  col=ifelse(mtcars$am == 0,"blue","red"), 
  pch=19, 
  main="Mileage by Displacement"
)
grid(col="lightgray")
abline(h=mean(mtcars$mpg), col="red", lty=3)

# add a legend 
legend(
  "topright", 
  c("Automatic","Manual"), 
  inset=0.04, 
  lty=c(1,1), 
  lwd=c(2.5,2.5), 
  col=c("blue","red")
)

# compute the number of cars for each possible value of number of cylinders
tbl = table(mtcars$cyl)

# produce a simple barplot, with one bar for each possible number of cylinders 
barplot(tbl)

# improve your barplot by adding title, x/y axis labels, and color.
barplot(
  tbl, 
  main="Cars With Cylinders", 
  xlab="Number of Cylinders", 
  ylab="Number of Cars", 
  col="blue"
)

# Create a simple box plot showing mileage as a function of number of cylinders.  
# Use function ‘boxplot’.
boxplot(mpg ~ cyl, range=0, data=mtcars)

# Improve your boxplot by adding color, title, and x/y axis labels.
boxplot(
  mpg ~ cyl, 
  range=0, 
  data=mtcars, 
  col="blue", 
  main="MPG as effected by Cylinders", 
  xlab="Cylinders", 
  ylab="MPG"
)

# switching to the Old Faithful data (built-in data set ‘faithful’),
# plot a histogram of eruption length (column ‘eruptions’).
hist(x=faithful$eruptions)

# try using 15 breaks
hist(
  x=faithful$eruptions, 
  breaks=15
)

# try a different color.
hist(
  x=faithful$eruptions, 
  breaks=15,
  col="red"
)

# change the title an x axis label,
# and try to save the plot using RStudio
hist(
  x=faithful$eruptions, 
  breaks=15,
  col="red",
  xlab="Eruptions",
  main="Frequency of Eruptions"
)
