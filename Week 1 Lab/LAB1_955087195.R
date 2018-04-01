# IST 719
# Lab 1
# Jessica O'Neal - ID: 955087195

# Submit 1
# Full color and labeled Pie chart with title
pie(c(10,15,7,20), labels = c(10,15,7,20)
    , main="How many employees per division?", col=c("red", "tan", "brown", "orange"))

# Submit 2
#If you don't add enough numbers, the remaining numbers in the code will return to the begining.
plot(c(1,2,4,8,1,4), pch=c(2,4,5,8,20))

#Submit 3
# This is a line graph with 10 random plots graphed with titles.
my.bucket <- rnorm(n = 10)
plot(my.bucket, type="l", lwd=3, col="orange"
     , main="Net worth over time", xlab="years", ylab="Dollars")

# SUBMIT (4)
# The random plot is now a histogram with the design feature, lend that will square the plot lines at the ends.
plot(my.bucket, type = "h", lwd = 10, col = c("red", "orange", "brown")
     , bty = "n", lend = 2)

# SUBMIT (5)
#Below is a designed horizontal barplot with dummy randomized data showing the amount of employees in different departments. 
x <- rnorm(n = 1000, mean = 10, sd = 1)
n <- 50
my.letters.1 <- sample(letters[1:3], size = n, replace =T)
my.letters.table <- table(my.letters.1)
barplot(my.letters.table, col=c("brown", "tan", "orange")
        , names.arg = c("sales", "ops", "delievery")
        , main = "employees by department"
        , border = "white"
        , horiz = T
        , density = 20
        , xlab = "employees"
        , ylab = "department"
        , angle = c(22, 70, 120))