#load weightloss4 file
weightloss=read.csv(file.choose(), header=T)
attach(weightloss)
#produce cooperative boxplots
boxplot(WeightLoss~Group)
#produce cooperative dotplots
stripchart(WeightLoss~Group, method="stack", pch=20, cex=1.5)
#find the n, mean, and sd for each condition
#We could find each item individually
# note the double equals sign...
# a single equals sign is an arithmetic operator
# a double equals sign is a logical operator (tests True/False)
mu.Control=mean(WeightLoss[Group=="Control"])
#OR use tapply function to see both conditions at once
tapply(WeightLoss, Group, length)
tapply(WeightLoss, Group, mean)
tapply(WeightLoss, Group, sd)
#Create a table for the n, mean, and sd according to condition
n=tapply(WeightLoss, Group, length)
mean=tapply(WeightLoss, Group, mean)
SD=tapply(WeightLoss, Group, sd)
cbind(n, mean, SD)
#round table output to 2 decimal places
round(cbind(n, mean, SD),2)
#t-test
t.test(WeightLoss~Group)
#Look at Residuals (many steps to follow)
# Treat Group condition as numeric (Control=0 and Incentive=1)
# Place the numeric condition in a new column called GroupNumeric
GroupNumeric=as.numeric(Group=="Incentive")
mu.control=mean(WeightLoss[GroupNumeric==0])
mu.incentive=mean(WeightLoss[GroupNumeric==1])
# Now we're taking steps to make a column that will contain the correct mean for the condition of
Group variable
Fit=mu.control*(1-GroupNumeric)+mu.incentive*GroupNumeric
# Find Residuals (Difference from observed values and mean)
Resid=WeightLoss-Fit
# Put them all together
cbind(WeightLoss, Fit, Resid)
#We already have t-statistic, but we can also calculate it manually
# compare each result with the computer output from the t-test
sdc=sd(WeightLoss[Group=="Control"])
sdi=sd(WeightLoss[Group=="Incentive"])
nc=length(WeightLoss[Group=="Control"])
ni=length(WeightLoss[Group=="Incentive"])
t.stat=(mu.control-mu.incentive)/sqrt(sdc^2/nc+sdi^2/ni)
#Check the Residuals
# The qqnorm function computes a normal probability plot
# The qqline function adds a reference line to this plot to help assess the straightness of the normal
plot
qqnorm(Resid[Group=="Control"], ylab="Control Residuals")
qqline(Resid[Group=="Control"])
qqnorm(Resid[Group=="Incentive"], ylab="Incentive Residuals")
qqline(Resid[Group=="Incentive"])
#Effect size
#We know from the p-value that the difference of 11.76 pounds is too big to be
#due to the random assignment of subjects to groups (chance).
#We know from the margin of error that with 95% confidence, the incentive is worth
#between 5.5 and 18.1 pounds.
#What we don't know yet is how much of a difference 11.76 pounds actually matters.
#The effect size is the ratio of observed differences (differences in means) to the
#standard deviation for person-to-person differences (pooled sd)
#=(abs(mu1-mu2))/(pooled sd)
#numerator
num=abs(mu.control-mu.incentive)
#denominator
den=sqrt(((nc-1)*sdc^2+(ni-1)*sdi^2)/(nc+ni-2))
effect=num/den
effect
#This tells us that the effect of the incentive is 127% as big as the typical size of