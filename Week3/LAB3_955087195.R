# IST 719 M001
# Lab 3
# Jessica O'Neal - SUID: 955087195

sales <- read.csv(file = "~/School/Information Visualiztion IST 719/sales.csv"
                 , header = TRUE
                 , stringsAsFactors = FALSE)

str(sales)
colnames(sales)

# Question: What is the relationship between expenses and recipes?
#SUBMIT (1)

sales$expenses
sales$recipt

plot(sales$expenses, sales$recipt)
##

#adj is alignment, mtext is moveable text that add to the graph
#line is referring to what line number, bty = border?
plot(sales$expenses, sales$recipt
     , bty = "n" , col = "forestgreen"
     , xlab = "")
mtext(text = "Recipts and Expenses", side = 3
      , line = 2, cex = 1.5, adj = 0)
## \n - means new line
mtext(text = "Plot shows the relationship between recipts\nfor Acme wine Co."
   , side = 3, line = 0, cex = 1, adj = 0)
##lower graph text added
mtext(text = "Source: Prof Hemsley"
      , side = 1, line = 3, cex =.8, adj = 1)

#Question: what is the relationship betweew reciepts and wine types?
sales$recipt #continuous
sales$type #categorical

#SUBMIT 2
boxplot(sales$recipt ~ sales$type)
##

#Question: which region sells the most units?
sales$rep.region #categorical
sales$units.sold #continuous

hist(sales$units.sold)

boxplot(sales$units.sold ~ sales$rep.region)

sum(sales$units.sold[sales$rep.region == "North"])

table(sales$rep.region)

units.by.reg <- aggregate(sales$units.sold
                          ,by =list(region = sales$rep.region)
                          , FUN = sum)

class(units.by.reg)

#SUBMIT (3)
barplot(units.by.reg$x, names.arg = units.by.reg$region, horiz = TRUE
        , las = 2, col = "forestgreen")
mtext(text = "Wine Sales by Region", side = 3, line = 2, adj = 0, cex = 2)
mtext(text = "US Dollar", side = 1,  line = 3, adj = 0, cex = 1 )
##

#Question: How do the units sold of red wine vs. white wine differ by region?

units.by.reg.type <- aggregate(sales$units.sold
                               , by = list(region = sales$rep.region
                                                   , type = sales$type)
                               , sum)
# tapply - pronounced Tee a plie; function is useful when we need to break up a vector 
# into groups defined by some classifying factor, 
# compute a function on the subsets, and return the results 
# in a convenient form
units.by.type.by.reg <-tapply(sales$units.sold
                              , list(region = sales$rep.region
                              , type = sales$type)
                              , sum)
class(units.by.type.by.reg)

barplot(units.by.type.by.reg) #BAD
barplot(units.by.type.by.reg, beside = TRUE) #subgroup is too big

units.by.type.by.reg.2 <- tapply(sales$units.sold
                                 , list(type = sales$type
                                        ,region = sales$rep.region)
                                  , sum)

#SUBMIT 4
barplot(units.by.type.by.reg.2, beside = TRUE,col =c("purple", "chartreuse")
        , legend.text = row.names(units.by.type.by.reg.2), ylab = "Units")
##

#Question: Are recipts growing over time for each region?
M <- tapply(sales$recipt, list(region = sales$rep.region, sales$year)
            , sum)
max.y = max(M)

x <- as.numeric(colnames(M))

#Specify when to start using scientific notation or turns it off
options(scipen = 9)

#SUBMIT (5)
plot(x, M[1,], ylim = c(0, max.y), col = "darkolivegreen1"
     , lwd = 3, bty = "n", type = "l")
lines(x, M[2,], col = "dodgerblue", lwd = 3)
lines(x, M[3,], col = "forestgreen", lwd = 3)
lines(x, M[4,], col = "peachpuff", lwd = 3)
lines(x, M[5,], col = "rosybrown", lwd = 3)
##

sales$sales.date
class(sales$sale.date)

my.date <- as.Date(strptime(sales$sale.date
                            , "%m/%d/%y"))

class(my.date)

my.year <- which(sales$year == 2014)

my.reg <- which(sales$rep.region == "West")

# Get only the records shared by both my.year and my.ref
my.index <- intersect(my.year, my.reg)

date.df <- aggregate(sales$recipt[my.index]
                     , by =list(my.date[my.index])
                     , FUN = sum)

#SUBMIT (6)
plot(date.df, type = 'l')
