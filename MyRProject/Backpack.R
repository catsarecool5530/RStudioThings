library(readr)
#Load and attach dataset
Backpack <- read_csv("Backpack.csv")

#Find the entry in a particular row and column
print("The 2nd entry of Major is: "); print(Backpack[2, "Major"]);

#Look at all entries of a particular row

print(Backpack[1, ])
#Look at all entries of a particular column

print(Backpack[, "Major"])
#Create a new transformed column according to an arithmetic algorithm
newCol <- Backpack[, "BodyWeight"] / 2.2;
print(newCol)

#Reorder Columns
Backpack <- Backpack[, c("Major", "BackpackWeight", "BodyWeight", "BackProblems", "Ratio", "Year", "Sex", "Status", "Units")]

#we just created a new dataset... granted, it had the same name as the dataset that was transformed to
# make it, but it is new just the same.
#so it must be reattached.
attach(Backpack)
print(Major)
#Since the variable names are the same as the variable names in our previously attached dataset, you
#will see messages stating that they are masked... this is not a problem.
#View all values of a particular variable in ascending order
print(Backpack[order(BackpackWeight, decreasing=FALSE), "BackpackWeight"], n=100)
#View all values of a particular variable in descending order


#Sort dataset by two variables
#Calculate some summary statistics for a variable
#mean
#median
#variance
#standard deviation
#5-number summary
#Visual Summaries
#Create a stemplot for a variable
#Create a boxplot for a variable
#Create a histogram for a variable
#look up the help for histograms
#adjust colors
#adjust bin sizes
#Create a scatterplot of two variables
#Label the plot
#Label the axes
#Challenge
#yesterday, we made a scatterplot of these data according to BackpackWeight and BodyWeight.
#Re-create this plot, but find a way to show different colors according to conditions of the variable Sex
#(Female or Male)
#Challenge2
#Add a legend to identify the sexes by their representative color
