# Backpack Skills 1
library(readr)
backpack= read_csv("Backpack.csv")
attach(backpack)
#remove "Ratio" column
View(backpack)
backpack <- subset(backpack, select=-Ratio)
#Look up a value by [row, column]
View(backpack[1, 2])
#see values for an entire column
backpack$BackpackWeight
#divide all values by 2.2
#see bodyweight as bodymass, measured in kg
backpack$BodyMass <- backpack$BackpackWeight / 2.2
#Rearrange dataset so that BodyMass is 3rd column
backpack <- backpack[, c("BackpackWeight", "BodyWeight", "BodyMass", "BackProblems", "Major", "Year", "Sex", "Status", "Units")]
#You could also accomplish this with column names instead of numbers
# see aboooove 

#Make a new column: BackpackMass
backpack$BackpackMass <- backpack$BackpackWeight / 2.2
#Make BackpackMass the 2nd column
backpack <- backpack[, c("BackpackWeight", "BackpackMass", "BodyWeight", "BodyMass", "BackProblems", "Major", "Year", "Sex", "Status", "Units")]

#rename column
#Arrange dataset according to ascending BackpackWeight\
backpack <- backpack[order(backpack$BackpackWeight, decreasing=FALSE),]
#First, look at sort
sort(BackpackWeight)
#good to see, but doesn't rearrange
#If you wanted it sorted in descending order, you would have entered
sort(BackpackWeight, decreasing=TRUE)
#Find row rank according to Backpackweight, then Bodyweight
