#Load and attach the BirdNest data
BirdNest <- read.csv(file.choose(), header=TRUE)
attach(BirdNest)

# Look at the entry in the 28th row, 4th column
BirdNest[28, 4]


#Look at all entries for the 28th row

BirdNest[28,]

# Look at all entries for the 4th column

BirdNest[, 4]

#Create a new column called “TotalCare” which adds the entries for Incubate and Nestling

BirdNest$TotalCare <- Incubate + Nestling
attach(BirdNest)
#Sort the dataset according to the TotalCare column in ascending order

BirdNest <- BirdNest[order(TotalCare, decreasing=FALSE),]

#Find the mean of the TotalCare column

mean(TotalCare)

#Find the median of the TotalCare column

median(TotalCare)


#Find the standard deviation of the TotalCare column

sd(TotalCare)

#Find the variance of the TotalCare column

var(TotalCare)


#Find the 5-number summary of the TotalCare column

summary(TotalCare)



#Create a stemplot for TotalCare

stem(TotalCare)



#Create a boxplot for TotalCare

boxplot(TotalCare)

#Create a histogram for TotalCare

hist(TotalCare)

#Adjust histogram so that there are 5 – 8 bins

hist(TotalCare, breaks=c(15, 20, 25, 30, 35, 40)) # 5 bins

#Create a scatterplot for Length, predicted by NoEggs

plot(NoEggs, Length)

#Add a title to the scatterplot

title(main="Number of Eggs vs. Length")

#Assign different colors in the scatterplot according to the condition of the variable “Color”


plot(NoEggs, Length, col=ifelse(Color==1, "red", "blue"), main="Number of Eggs vs. Length", pch=19)


#Add a legend to distinguish the colors

legend("topright", legend=c("Color 1", "Color 2"), fill=c("red", "blue"), cex = 0.9)
