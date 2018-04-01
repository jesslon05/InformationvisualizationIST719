crime <- read.csv(file = "~/School/InformationVisualizationIST719/Week6/crimeRatesByState2005.csv"
            , sep = ","
            , header = TRUE)

crime[1:3,]

crime2 <- crime[crime$state != "District of Columbia",] 
crime2 <- crime2[crime2$state != "United States",]

plot(crime2[,2:9])

pairs(crime2[,2:9], panel=panel.smooth)

crimecircle <- read.csv(file = "~/School/InformationVisualizationIST719/Week6/crimeRatesByState2005.tsv"
                  , header = TRUE
                  , sep="\t")

symbols(crimecircle$murder, crimecircle$burglary
        , circles = crimecircle$population)

radius <- sqrt( crimecircle$population/ pi ) 
symbols(crimecircle$murder, crimecircle$burglary, circles = radius)

symbols(crimecircle$murder, crimecircle$burglary, circles = radius
        , inches = 0.35, fg = "white", bg = "red", xlab = "Murders \nper 100,000 population"
        , ylab = "Burglary Rate")
text(crimecircle$murder, crimecircle$burglary, crimecircle$state, cex=0.5)
mtext(text = "MURDERS VERSUS BURGLARIES IN THE UNITED STATES", side = 3
      , line = 2.75, cex = 1, adj = 0)
## \n - means new line
mtext(text = "Burglaries \nper 100,000 population"
      , side = 3, line = 0, cex = 1, adj = 0)
##lower graph text added
mtext(text = "Source: U.S. Census Bureau|Nathan Yau"
      , side = 1, line = 3, cex =.7, adj = 1)




birth <- read.csv("~/School/InformationVisualizationIST719/Week6/birth-rate.csv")

stem (birth$X2008)

hist(birth$X2008, bg = "purple", xlim =c(0,60)
     , xlab = "Live births per 1,000 population"
     , ylab = "Country Count", main = " ")
mtext(text = "GLOBAL DISTRIBUTION OF BIRTH RATES", side = 3
      , line = 2.75, cex = 1, adj = 0)
mtext(text = "In 2008, most countries had birth rates less than 25 live births per 1,000 population. \nThere are, however, many developing countries where women tend to bear more \nchildren."
      , side = 3, line = 0, cex = .8, adj = 0)
mtext(text = "Source: The World Bank"
      , side = 1, line = 3, cex =.7, adj = 1)


birth2008 <- birth$X2008[!is.na(birth$X2008)]
d2008 <- density(birth2008)

d2008$x
d2008$y

d2008frame <- data.frame(d2008$x, d2008$y)
write.table(d2008frame, "birthdensity.txt", sep="\t")

plot(d2008)

plot(d2008, type="n", xlab = "Live births per 1,000 population"
     , ylab = "Density", main = " ")
polygon(d2008, col="#821122", border="#cccccc")
mtext(text = "GLOBAL DISTRIBUTION OF BIRTH RATES IN 2008", side = 3
      , line = 2, cex = 1, adj = 0)
mtext(text = "Source: The World Bank"
      , side = 1, line = 3, cex =.7, adj = 1)

library(lattice)
histogram(birth$X2008, breaks=10)
lines(d2008)

library(haven)
cps2009sample <- read_dta("~/School/InformationVisualizationIST719/Week6/cps2009sample.dta")

View(cps2009sample)

cps2009sample[1:3,]
histogram(cps2009sample$incwage)

plot(sort(cps2009sample$incwage))

colnames(cps2009sample)

cps2009sample2 <- cps2009sample$sex

cps2009samplefemale <- cps2009sample$female
cps2009samplewage <- cps2009sample$incwage

cps2009sample.maleincome <- cps2009sample$incwage[cps2009sample$sex == "1"]
cps2009sample.femaleincome <- cps2009sample$incwage[cps2009sample$sex == "2"]


par(mfrow = c(3,1))
hist(cps2009samplewage, xlim =c(0,120000), ylim = c(0,200)
     , col = "red",  main = "Total")
hist(cps2009sample.maleincome, xlim =c(0,120000), ylim = c(0,200)
     , col = "red"
     , main = "Male")
hist(cps2009sample.femaleincome, xlim =c(0,120000), ylim = c(0,200)
     , col = "red"
     , main = "Female")


options(scipen = 9)

summary(cps2009sample.femaleincome)
summary(cps2009sample.maleincome)
summary(cps2009samplewage)


#cps2009sample.femaleincome 
  
notamanager <- cps2009sample$manager == "0"
isamanager <- cps2009sample$manager == "1"

cps2009sample$region

#my.region <- which(cps2009sample$industry == "11")

income.by.sex.and.region <-tapply(cps2009sample$incwage
                              , list(sexofincome = cps2009sample$sex
                                      , regionofincome = cps2009sample$region)
                                , median)

barplot(income.by.sex.and.region, beside = TRUE,col =c("red", "green")
        , legend.text = row.names(income.by.sex.and.region)
        , xlab = "Region", ylab = "Income"
        , main = "Income by Region")

income.by.sex.and.region

income.by.sex.and.manager <-tapply(cps2009sample$incwage
                                  , list(sexofincome = cps2009sample$sex
                                         , manager = cps2009sample$manager)
                                  , median)

barplot(income.by.sex.and.manager, beside = TRUE,col =c("red", "green")
        , legend.text = row.names(income.by.sex.and.manager)
        , xlab = "Manager", ylab = "Income"
        , main = "Income by Manager Status")

income.by.sex.and.union <-tapply(cps2009sample$incwage
                                   , list(sexofincome = cps2009sample$sex
                                          , union = cps2009sample$union)
                                   , median)
barplot(income.by.sex.and.union, beside = TRUE,col =c("red", "green")
        , legend.text = row.names(income.by.sex.and.union)
        , xlab = "Union", ylab = "Income"
        , main = "Income by Union Status")

income.by.sex.and.education <-tapply(cps2009sample$incwage
                                 , list(sexofincome = cps2009sample$sex
                                        , education = cps2009sample$educ99)
                                 , median)

barplot(income.by.sex.and.education, beside = TRUE,col =c("red", "green")
        , legend.text = row.names(income.by.sex.and.education)
        , xlab = "Education Status", ylab = "Income"
        , main = "Income by Education Attainment")

income.by.sex.and.retail <-tapply(cps2009sample$incwage
                                     , list(sexofincome = cps2009sample$sex
                                            , retail = cps2009sample$ind_retail)
                                     , median)

income.by.sex.and.personal <-tapply(cps2009sample$incwage
                                  , list(sexofincome = cps2009sample$sex
                                         , personal = cps2009sample$ind_personal)
                                  , median)
income.by.sex.and.health <-tapply(cps2009sample$incwage
                                    , list(sexofincome = cps2009sample$sex
                                           , health = cps2009sample$ind_health)
                                    , median)
income.by.sex.and.industryedu <-tapply(cps2009sample$incwage
                                  , list(sexofincome = cps2009sample$sex
                                         , industryedu = cps2009sample$ind_educ)
                                  , median)
income.by.sex.and.govt <-tapply(cps2009sample$incwage
                                       , list(sexofincome = cps2009sample$sex
                                              , govt = cps2009sample$ind_govt)
                                       , median)

par(mfrow = c(2,3))
barplot(income.by.sex.and.retail, beside = TRUE,col =c("red", "green")
        , legend.text = row.names(income.by.sex.and.retail)
        , xlab = "Retail Yes or No", ylab = "Income"
        , main = "Income by Retail Industry")
barplot(income.by.sex.and.health, beside = TRUE,col =c("red", "green")
        , legend.text = row.names(income.by.sex.and.health)
        , xlab = "Health Ind. Yes or No", ylab = "Income"
        , main = "Income by Health Industry")
barplot(income.by.sex.and.personal, beside = TRUE,col =c("red", "green")
        , legend.text = row.names(income.by.sex.and.personal)
        , xlab = "Personal Services Yes or No", ylab = "Income"
        , main = "Income by Personal Care industry")
barplot(income.by.sex.and.industryedu, beside = TRUE,col =c("red", "green")
        , legend.text = row.names(income.by.sex.and.industryedu)
        , xlab = "Education Industry", ylab = "Income"
        , main = "Income by Education Industry")
barplot(income.by.sex.and.govt, beside = TRUE,col =c("red", "green")
        , legend.text = row.names(income.by.sex.and.govt)
        , xlab = "Gov't Yes or No", ylab = "Income"
        , main = "Income by Gov't Position ")
barplot(income.by.sex.and.manager, beside = TRUE,col =c("red", "green")
        , legend.text = row.names(income.by.sex.and.manager)
        , xlab = "Manager", ylab = "Income"
        , main = "Income by Manager Status")
barplot(income.by.sex.and.union, beside = TRUE,col =c("red", "green")
        , legend.text = row.names(income.by.sex.and.union)
        , xlab = "Union", ylab = "Income"
        , main = "Income by Union Status")