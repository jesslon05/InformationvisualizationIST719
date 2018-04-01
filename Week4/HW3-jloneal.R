# IST 719
# HW1-VT3
# Jessica O'Neal - NetID: jloneal

#Plot 1

barplot(hotdogs$Dogs.eaten, names.arg=hotdogs$Year, ylim = c(0, 70), col=fill_colors, 
        main="Nathan's Hot Dog Eating Contest Results, 1980-2010", 
        border=NA, space=0.3, xlab="Year", ylab="Hot dogs and buns (HDB) eaten")

#Plot 2
hot_dog_places <- read.csv("~/School/Information Visualiztion IST 719/Week2/hot-dog-places.csv"
                           , sep=",", header=TRUE)
hot_dog_places

names(hot_dog_places) <- c("2000", "2001", "2002", "2003", "2004", "2005"
                           , "2006", "2007", "2008", "2009", "2010")

hot_dog_matrix <- as.matrix(hot_dog_places)

barplot(hot_dog_matrix, border=NA, space=0.25, ylim=c(0, 200)
        , xlab="Year", ylab="Hot dogs and buns (HDBs) eaten"
        , main="Hot Dog Eating Contest Results, 1980-2010")

#Plot 3
subscribers <- read.csv("~/School/Information Visualiztion IST 719/Week2/flowingdata_subscribers.csv"
                        , sep=",", header=TRUE)

subscribers[1:5,] 

plot(subscribers$Subscribers, ylim=c(0, 30000)
     , xlab="Day", ylab="Subscribers")
points(subscribers$Subscribers, pch=19, col="black")

#Plot 4
population <- read.csv("~/School/Information Visualiztion IST 719/Week2/world-population.csv"
                       , sep=",", header=TRUE)

plot(population$Year, population$Population, type="l"
     , ylim=c(0, 7000000000), xlab="Year", ylab="Population") 

#Plot 5
postage <- read.csv("~/School/Information Visualiztion IST 719/Week2/us-postage.csv"
                    , sep=",", header=TRUE)

plot(postage$Year, postage$Price, type="s"
     , main="US Postage Rates for Letters, First Ounce, 1991-2010", xlab="Year"
     , ylab="Postage Rate (Dollars)")


#Plot 6
unemployment <- read.csv(        
  "~/School/Information Visualiztion IST 719/Week4/unemployment-rate-1948-2010.csv"
  ,sep=",", header = TRUE) 

unemployment[1:10,]

plot(1:length(unemployment$Value), unemployment$Value) 
scatter.smooth(x=1:length(unemployment$Value)
               , y=unemployment$Value
               , ylim=c(0,11)
               , degree=2, col="#CCCCCC", span=0.5)

