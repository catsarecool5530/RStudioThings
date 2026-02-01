# The 5.5 lab uses the aov from the 5.4 lab.
#5.4 lab and 5.5 lab are below.
#5.4 lab
#Fruit flies
#An experiment to test whether increased in sexual activity decreases the life spans of male fruit flies
#125 male fruit flies randomly assigned to 5 groups (Treatments)
flies=read.csv(file.choose(), header=T)
attach(flies)
#Look at dotplot
par(mfrow=c(1, 2))
stripchart(Longevity,method="stack", pch=20, cex=1.5)
#What do groups look like?
#produce comparative dotplots
stripchart(Longevity~Treatment, method="stack", pch=20, cex=1.5)
#If you want to see the dotplots vertically, use vertical=TRUE)
#produce comparative boxplots
boxplot(Longevity)
boxplot(Longevity~Treatment)
#Do residuals look better for null model or ANOVA model?
#Null model
flies.null=lm(Longevity~1)
#ANOVA model
flies.aov=aov(Longevity~Treatment)
summary(flies.aov)
hist(flies.null$residuals, breaks=8)
hist(flies.aov$residuals, breaks=8)
#re-format plots
par(mfrow=c(1, 1))
#Make table including n, mean, sd
#For groups
n=tapply(Longevity, Treatment, length)
mean=tapply(Longevity, Treatment, mean)
SD=round(tapply(Longevity, Treatment, sd),2)
groupdata=cbind(n, mean, SD)
groupdata
#Add row for totals
totaln=length(Longevity)
grandmean=mean(Longevity)
grandsd=sd(Longevity)
totaldata=cbind(totaln, grandmean, grandsd)
totaltotaldata=rbind(groupdata, totaldata)
#this next step just adds the "total" to the end... it is redundant toward and overwrites the other row
names
rownames(totaltotaldata)=c("1 pregnant", "1 virgin", "8 pregnant", "8 virgin", "none", "total")
totaltotaldata
#Check conditions
# Equal variance
# Normal error distribution
# Independent errors with mean=0: Based on how data are collected.
# If there is randomization, we typically assume independence
#Equal variance condition
# Take ratio of largest groupSD and smallest groupSD
# It should be less than or equal to 2
16.45/12.1
# 1.3595
# Resids vs Fits allows us to visually check similarity of spreads
plot(flies.aov$fitted.values, flies.aov$residuals)
abline(h=0)
#Normal probability plot of residuals
qqnorm(flies.aov$residuals)
qqline(flies.aov$residuals)
#5.5 lab
e = flies.aov$resid
MSE = sum(e^2)/120
t.crit = qt(.975, 120)
LSD = t.crit*sqrt(MSE*(1/25 + 1/25))
LSD
# 8.292658
#Notice that this 8.29 value agrees with the example from the notes
#(where a rounded t critical gave us 8.287) .
#To obtain all possible differences in mean values to decide which are
# statistically different from which:
#The outer function takes the matrices in the first two arguments
#and the function named in the third argument to produce an array.
diff=outer(mean, mean, "-")
diff
#Or we can make modified matrices
diffs = outer(mean,t(mean),"-")
diffs
#Here, the first argument is the vector mean, which is coerced into
#a matrix with 5 rows and 1 column.
#The second argument t(mean) takes the transpose of this matrix,
#which will have 1 row and 5 columns.
#Then, all possible differences are computed into an array
#Simply printing off diffs shows all possible differences with
#transparent labels, so that we can easily identify those that are
#significantly different.
#Once conditions are met, we can use model for inference

