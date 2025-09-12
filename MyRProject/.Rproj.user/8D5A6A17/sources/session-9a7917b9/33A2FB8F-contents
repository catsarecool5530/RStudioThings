
#Load and attach the airquality

data("airquality")
View(airquality)
attach(airquality)
# Look at the entry in the 7th row, 4th column
airquality[6, 4]
#Look at all entries for the 8th row
airquality[7]
# Look at all entries for the 3th column
airquality[,2]
#Create a new column called “Temp C*” its in F*
View(airquality)
airquality$TempC <- 5/9 * (Temp - 32)
#Sort the dataset according to the Wind column in ascending order
airquality <- airquality[order(Wind),]
#Find the mean of the wind column
mean(Wind)
#Find the median of the wind column
median(Wind)
#Find the standard deviation of the wind column
sd(Wind)
#Find the variance of the wind column
var(Wind)
#Find the 5-number summary of the wind column
summary(Wind)
#Create a stemplot for Wind
stem(Wind)
#Create a boxplot for Wind
box(Wind)
#Create a histogram for Wind
hist(Wind)
#Adjust histogram so that there are 5 – 8 bins
hist(Wind, breaks=6)
#Create a scatterplot for Wind vs Temp F*
plot(Wind, Temp, pch=19)
#Add a title to the scatterplot
title(main="Wind vs Temp (F)")
#Assign different colors in the scatterplot according to the condition of the variable “Color”

airquality$Color <- ifelse(Solar.R <= 50, "red", ifelse(Solar.R < 200, "blue", "green"))
plot(Wind, Temp, pch=19, col=airquality$Color)
#Add a legend to distinguish the colors
legend("topright", legend=c("Low Solar Power", "Medium Solar Power", "High Solar Power"), cex=0.5, fill=c("red", "blue", "green"))

