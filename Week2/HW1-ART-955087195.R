# IST 719
# HW1-ART
# Jessica O'Neal - ID: 955087195

#Part 2

#1.	What is the distribution of total sales for the whole dataset? 
#Provide two different plots that show two different ways of showing distributions.

sales <- read.csv("~/School/Information Visualiztion IST 719/Week2/art.csv")

plot(sales$total.sale, xlab="Transactions", ylab="Total Sales"
     , main = "Distribution of Total Sales")
plot(sort(sales$total.sale), xlab="Transactions", ylab="Total Sales"
     , main = "Distribution of Total Sales Sorted")
piechart(sales$total.sale,
     , main = "Distribution of Total Sales")

#2.	Next we want to compare two different distributions. 
#Use a different distribution plot type than the ones above, 
#but use the same type for both of these for easy comparison: 

sales[,3:4]

class(sales)
str(sales)
dim(sales)
 

#a. What is the distribution of the totals sales for drawing paper?
drawing.transactions <- sales$total.sale[sales$paper == "drawing"]
hist(drawing.transactions, xlab="Transactions", ylab="Total Sales"
     , prob= TRUE, col="tan", main = "Drawing Paper Distribution of Total Sales")

#b. What is the distribution of the totals sales for watercolor paper?
watercolor.transactions <- sales$total.sale[sales$paper == "watercolor"]
hist(watercolor.transactions, xlab="Transactions", ylab="Total Sales",  
     prob= TRUE, col="lightblue", main = "Watercolor Paper Distribution of Total Sales")

par(mfrow = c(2,2))
plot(sales$total.sale, xlab="Transactions", ylab="Total Sales"
     , main = "Distribution of Total Sales")
plot(sort(sales$total.sale), xlab="Transactions", ylab="Total Sales"
     , main = "Distribution of Total Sales Sorted")
hist(drawing.transactions, prob= TRUE, col="tan", xlab="Transactions", ylab="Total Sales"
     , main = "Drawing Paper Distribution of Total Sales")
hist(watercolor.transactions, prob= TRUE,  col="lightblue", xlab="Transactions", ylab="Total Sales"
     , main = "Watercolor Paper Distribution of Total Sales")


