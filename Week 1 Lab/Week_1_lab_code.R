# IST 719
# Lab 1
# your name - netid
#

pie(c(10,15,7,20))

pie(c(10,15,7,20), main="How many employees per division?")

# SUBMIT (1)
# Fully colored and labeled Pie chart with title
pie(c(10,15,7,20), labels = c(10,15,7,20)
    , main="How many employees per division?", col=c("red", "tan", "brown", "orange"))


plot(c(1,2,4,8,1,4))
plot(c(1,2,4,8,1,4), pch=8)
# Internet search 'R pch values'

# what happens if you don't give enough numbers?
# SUBMIT (2)
plot(c(1,2,4,8,1,4), pch=c(2,4,5,8,20))


# variables
my.bucket <- rnorm(n = 10)
plot(my.bucket)
plot(my.bucket, type="l")
plot(my.bucket, type="l", lwd=3)
plot(my.bucket, type="l", lwd=3, col="orange")

# SUBMIT (3)
plot(my.bucket, type="l", lwd=3, col="orange"
     , main="Net worth over time", xlab="years", ylab="Dollars")

# type = "h" is for a histogram
plot(my.bucket, type = "h")
plot(my.bucket, type = "h", lwd = 2)
# lty is for line type
plot(my.bucket, type = "h", lwd = 2, lty = 3)
plot(my.bucket, type = "h", lwd = 6, col = c("red", "orange"))

# bty = "n" turns off the box around the plot
plot(my.bucket, type = "h", lwd = 6, col = c("red", "orange", "brown")
     , bty = "n")

# Set the background to gray
par(bg="gray")

plot(my.bucket, type = "h", lwd = 6, col = c("red", "orange", "brown")
     , bty = "n")

# SUBMIT (4)
# lend is for line end 2 = square
plot(my.bucket, type = "h", lwd = 10, col = c("red", "orange", "brown")
     , bty = "n", lend = 2)
# lend is the line end. 0=round, 1=butt, 2=square

par(bg="white")

# other ways to see bars
x <- rnorm(n = 1000, mean = 10, sd = 1)
hist(x, main="What is the distribution of x?")

# variables and data
n <- 50

# letters is a built-in R constant that contains the 26 lowercase letters
my.letters.1 <- sample(letters[1:3], size = n, replace =T)
# what does the data look like?
my.letters.1

my.letters.table <- table(my.letters.1)
# what does the data look like?
my.letters.table

barplot(my.letters.table) 
# what options do we have for bars?
barplot()

barplot(my.letters.table, col=c("brown", "tan", "orange")
        , names.arg = c("sales", "ops", "delievery"))

# so what question might we be asking for this plot?

barplot(my.letters.table, col=c("brown", "tan", "orange")
        , names.arg = c("sales", "ops", "delievery")
        , main = "employees by department"
        , border = "white"
        , ylab = "employees"
        , xlab = "department")

# SUBMIT (5)
barplot(my.letters.table, col=c("brown", "tan", "orange")
        , names.arg = c("sales", "ops", "delievery")
        , main = "employees by department"
        , border = "white"
        , horiz = T
        , density = 20
        , xlab = "employees"
        , ylab = "department"
        , angle = c(22, 70, 120))


