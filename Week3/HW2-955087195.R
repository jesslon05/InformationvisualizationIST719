# IST 719
# HW2
# Jessica O'Neal - ID: 955087195

artsales <- read.csv("~/School/Information Visualiztion IST 719/art.csv"
                     , header = TRUE
                     , stringsAsFactors = FALSE)

#1.	What are the distributions of total sales for water color and drawing papers? 
#Show this as a grouped boxplot (two boxplots in the same plot).

artsales$total.sale
artsales$paper

boxplot(artsales$total.sale ~ artsales$paper
        , xlab="Paper", ylab="Total Sales"
        , main = "Distributions of Total sales of Paper")
##

#2.	Are total sales growing for each store over the years covered in the dataset? 
#Show as a muli-line plot. Yes

S <- tapply(artsales$total.sale, list(artstore = artsales$store, artsales$year)
            , sum)
max.y = max(S)
z <- as.numeric(colnames(S))

plot(z, S[1,], xlab="Years", ylab="Total Sales", ylim = c(0, max.y), col = "rosybrown1"
     , lwd = 3, bty = "n", type = "l"
     , main = "Distributions of Total Paper Sales Store")
lines(z, S[2,], col = "orangered", lwd = 3)
lines(z, S[3,], col = "peru", lwd = 3)
lines(z, S[4,], col = "palevioletred", lwd = 3)

#3.How do the total units sold of water color and drawing paper differ by store? 
#Is one type of paper always outselling the other, or some different stores tend to sell more drawing paper and some more water color?

units.by.type.by.store <- tapply(artsales$units.sold
                                 , list(papercategory = artsales$paper
                                        , artstore = artsales$store)
                                 , sum)


barplot(units.by.type.by.store, beside = TRUE,col =c("purple", "lightblue")
        , legend.text = row.names(units.by.type.by.store)
        , xlab = "Stores", ylab = "Units"
        , main = "Units of Watercolor & Drawing Paper By Store")

#4.	Each paper (watercolor and drawing) has different subtypes. 
#For watercolor only, how are the total sales of the different paper 
#types (column is paper.type) similar or different for each store? 
#(hint: make a watercolor subset of the whole dataset, then show a
#grouped barchart using a matrix from tapply)

my.paper <- which(artsales$paper == "watercolor")

sales.by.type.by.papertype.and.store <-tapply(artsales$total.sale[my.paper]
                                     , list(artsales$store[my.paper]
                                            , artsales$paper.type[my.paper])
                                                       , sum)

barplot(sales.by.type.by.papertype.and.store, beside = TRUE
        , col =c("lightcoral", "rosybrown1", "honeydew3","mediumpurple")
        , legend.text = row.names(sales.by.type.by.papertype.and.store)
        , xlab = "Papertypes", ylab = "Total Sales"
        , main = "Watercolor Paper Sales By Store")


#5.	In the Davenport store, do the sales representatives 
#(column is 'rep') tend to sell the same amounts (units) of 
#water color and drawing paper? Yes in portion.

my.store <- which(artsales$store == "Davenport")

unitssold.by.store.and.rep <-tapply(artsales$units.sold[my.store]
                                              , list(artsales$rep[my.store]
                                                     , artsales$paper[my.store])
                                              , sum)

barplot(unitssold.by.store.and.rep, beside = TRUE
        , col =c("lightcoral", "rosybrown1")
        , legend.text = row.names(unitssold.by.store.and.rep)
        , xlab = "Paper", ylab = "Units Sold"
        , main = "Davenport Store Units Sold by Rep.")

#6. Over the years, does the ratio of units sold for watercolor
#and drawing paper stay the same? No.
#Is one growing while the other stays constant? Drawing fluctuates and watercolor keeps growning.

unitssold.of.paper.by.year <- tapply(artsales$units.sold, 
            list(papercategory = artsales$paper, artsales$year)
            , sum)

barplot(unitssold.of.paper.by.year
        , col =c("lightcoral", "orangered") 
        ,legend.text = row.names(unitssold.of.paper.by.year)
        , xlab="Years", ylab="Units Sold"
        , main = "Ratio of Units Sold of Paper by Year")
##
#All Graphs
par(mfrow = c(2,3))
boxplot(artsales$total.sale ~ artsales$paper
        , xlab="Paper", ylab="Total Sales"
        , main = "Distributions of Total sales of Paper")
plot(z, S[1,], xlab="Years", ylab="Total Sales", ylim = c(0, max.y), col = "rosybrown1"
     , lwd = 3, bty = "n", type = "l"
     , main = "Distributions of Total Paper Sales Store")
lines(z, S[2,], col = "orangered", lwd = 3)
lines(z, S[3,], col = "peru", lwd = 3)
lines(z, S[4,], col = "palevioletred", lwd = 3)
barplot(units.by.type.by.store, beside = TRUE,col =c("purple", "lightblue")
        , legend.text = row.names(units.by.type.by.store)
        , xlab = "Stores", ylab = "Units"
        , main = "Units of Watercolor & Drawing Paper By Store")
barplot(sales.by.type.by.papertype.and.store, beside = TRUE
        , col =c("lightcoral", "rosybrown1", "honeydew3","mediumpurple")
        , legend.text = row.names(sales.by.type.by.papertype.and.store)
        , xlab = "Papertypes", ylab = "Total Sales"
        , main = "Watercolor Paper Sales By Store")
barplot(unitssold.by.store.and.rep, beside = TRUE
        , col =c("lightcoral", "rosybrown1")
        , legend.text = row.names(unitssold.by.store.and.rep)
        , xlab = "Paper", ylab = "Units Sold"
        , main = "Davenport Store Units Sold by Rep.")
barplot(unitssold.of.paper.by.year
        , col =c("lightcoral", "orangered") 
        ,legend.text = row.names(unitssold.of.paper.by.year)
        , xlab="Years", ylab="Units Sold"
        , main = "Ratio of Units Sold of Paper by Year")

