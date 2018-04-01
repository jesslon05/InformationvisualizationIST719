# IST 719 M001
# Lab 2
# Jessica O'Neal - SUID: 955087195

#list.files("ADDRESS") allows you to specify a directory. Yours is //hd.ad.syr.edu/02/9931e2/Documents/Data Visualization IST 719

tips <- read.csv(file = "//hd.ad.syr.edu/02/9931e2/Documents/Data Visualization IST 719/tips.csv")
tips <- read.csv(file = "//hd.ad.syr.edu/02/9931e2/Documents/Data Visualization IST 719/tips.csv"
                , header = TRUE
                , stringsAsFactors = FALSE)

tips

paste("Jessica", "ONeal")
paste("Jessica", "ONeal", sep="")
paste("Jessica", "ONeal", sep = "$")


#ways to read files
my.path <- "//hd.ad.syr.edu/02/9931e2/Documents/Data Visualization IST 719/"
my.file <- "//hd.ad.syr.edu/02/9931e2/Documents/Data Visualization IST 719/wine.text"

sales.file <- paste(my.path, my.file, sep = "")

sales <- read.table(sales.file
                    , sep = "\t"
                    , stringsAsFactors = FALSE)

#another way to read a file
load("//hd.ad.syr.edu/02/9931e2/Documents/Data Visualization IST 719/shootings_1_.Rda")

my.data.junk <- list("A", 8 , "Now is the time")
my.data.junk

#tossme.rda is an internal file create
save(my.data.junk, file="//hd.ad.syr.edu/02/9931e2/Documents/Data Visualization IST 719/tossme.rda")

#removing junk file
rm(my.data.junk)

#opens explorer to choose a file
myFile <- file.choose()
  load(myFile)

#save
ls()
  save(list = ls(), file = "//hd.ad.syr.edu/02/9931e2/Documents/Data Visualization IST 719/MycurrentSession.rda")

#Exploring Data

#Fix opens a data editor but it can not be open at the same time as R.
colnames(tips)
fix(tips)

tips[1, ]
#show range of 1 through 3 inclusive
tips[1:3, ]

tips[ ,3]
#asking to show the length of tips with column 3
length(tips[ ,3])

#give the dimentions of tips
dim(tips)
dim(tips)[1]

#what structure is tips
str(tips)

#should all do the same thing
colnames(tips)
tips[,2]
tips[,"total_bill"]
tips$total_bill

tips$total_bill[1]

summary(tips$total_bill)

#Visualing tips data with a plot
plot(tips$total_bill, main = "Distribution of Total Bill")
plot(sort(tips$total_bill)
          , main = "Distribution of Total Bill")
#histogram
hist(tips$total_bill
     , main = "Distribution of Total Bill")
#boxplot graph
boxplot(tips$total_bill
        , main = "Distribution of Total Bill")

d <- density(tips$total_bill)
plot(d, main = "Density of Total Bill")

#I have no clue why this is called polygon
polygon(d, col = "orange", border = "blue")

class(tips)
class(d)
attributes(d)

plot(d$x, d$y, type = "l")

tips$sex
unique(tips$sex)

#asking record for record, is this male? Will return true or false.
tips$sex == "Male"

tips$total_bill[tips$sex == "Male"]
tips$total_bill[tips$sex == "Female"]

# QUESTION: what are the distributions of total bill for males and females?
males.bills <- tips$total_bill[tips$sex == "Male"]
female.bills <- tips$total_bill[tips$sex == "Female"]

#Referening parameter of plot area. Dividing plot area in rows and columns.
par(mfrow = c(1,2))
hist(males.bills, main = "Male")
hist(female.bills, main = "Female")

par(mfrow = c(3,2))
plot(tips$total_bill)
plot(sort(tips$total_bill))
hist(tips$total_bill)
boxplot(tips$total_bill)
plot(d)
polygon(d, col = "orange", border = "blue")
plot(d$x, d$y, type = "l")










