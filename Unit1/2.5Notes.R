#R Lab 1.5 Outliers and Influential Points
#Analyze potential outliers in a dataset using residuals
#Introduction to standardized and studentized residuals
#Load LongJumpOlympics dataset
jump<-read.csv(file.choose(), header=T)
attach(jump)
#Look at the plot of gold medal winning jumps, by year
plot(Gold~Year)
jump.lm=lm(Gold~Year)
View(jump.lm)
abline(jump.lm)
#Notice the 1968 performance of 8.9 meters
#Is it an outlier?
#Look at the residuals
jump.lm$residuals
plot(jump.lm$residuals~jump.lm$fitted.values)
abline(h=0)
#What is the residual of the 1968 jump?
jump.lm$residuals[16]
#Load the MASS library (necessary for standardized and studentized residuals)
library(MASS)
#Look at the standardized residuals
stdres(jump.lm)
plot(stdres(jump.lm)~jump.lm$fit, ylim=c(-4,4))
abline(h=-2, lty=3)
abline(h=2, lty=3)
#The standardized residual of the 1968 jump was:
stdres(jump.lm)[16]
#... But the existence of the potential outlier affects the regression line...
#Go back to the original plot of (Gold~Year)
#Add a red line to show what the regression line would look like without the 1968 data
no68.df=jump[!Year=="1968",]
no68.lm=lm(no68.df$Gold~no68.df$Year)
plot(Gold~Year)
abline(jump.lm)
abline(no68.lm, col="red", lty=3)
#What would be the standardized residual of the point if the regression line were computed without it
# (studentized residual)?
stud_resids=studres(jump.lm)
stud_resids
#Studentized Residual Plot
plot(stud_resids~Year, ylim=c(-4,4))
abline(h=-2, lty=3)
abline(h=2, lty=3)
#The studentized residual of the 1968 jump was
stud_resids[16]
#New problem
detach(jump)
#Analyze the PalmBeach dataset for outliers


