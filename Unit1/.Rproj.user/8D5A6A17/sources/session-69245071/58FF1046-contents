MetroHealth83 <- read.csv(file.choose())
View(MetroHealth83)
MetroHealth <- MetroHealth83[,c(1,2,4)]
View(MetroHealth)
attach(MetroHealth)
# The par function helps us control a wide variety of graphical parameters, such as
# line style,
# plotting character,
# axes,
# color, and on and on.
# The command par(mfrow = c(2,2)) partitions our graphics window into a 2-by-2 panel of panels,
# so we can get 4 graphs on a single window.
par(mfrow=c(2,2))
plot(NumHospitals, NumMDs,main="Scatterplot of MDs vs. Hospitals")
# fit model
MetroHealth.lm1 <- lm(NumMDs ~ NumHospitals)
# Add line to scatterplot
abline(MetroHealth.lm1)
# Look at scatterplot of residuals
plot(MetroHealth.lm1$fit, MetroHealth.lm1$resid, main="Residuals vs. Fits")
abline(h=0)
# Look at distribution of residuals
hist(MetroHealth.lm1$resid, main="Histogram of Residuals")
# Assess the distribution of residuals
qqnorm(MetroHealth.lm1$resid)
qqline(MetroHealth.lm1$resid)
# return to single graph window
par(mfrow=c(1,1))
#The R code below fits the square-root model and produces the diagnostic plots.
# Create the square-rooted variable
SqrtMDs = sqrt(NumMDs)
# Add it to the data frame
MetroHealth.df = data.frame(MetroHealth,SqrtMDs)
# Check that it got added
dim(MetroHealth.df)
#Check column names
names(MetroHealth.df)
MetroHealth.lm2 = lm(SqrtMDs ~ NumHospitals)
par(mfrow=c(2,2))
plot(NumHospitals, SqrtMDs)
abline(MetroHealth.lm2)
plot(MetroHealth.lm2$fit, MetroHealth.lm2$resid)
abline(h=0)
hist(MetroHealth.lm2$resid)
qqnorm(MetroHealth.lm2$resid)
qqline(MetroHealth.lm2$resid)
par(mfrow=c(1,1))
# Predicting a Value
# The R Code below uses the predict function
# to predict a value of number of doctors given a value of the number of hospitals
# The first argument of the function is the model to base the prediction on;
# the predict function is generic,
# in that it will react appropriately depending on the class of the model object given it
# Our model object is a “linear model” object,
# i.e., one created by the lm function and predict knows what to do with such an object.
# The second argument is a data frame giving values of the the explanatory variable(s)
# that we want to predict response values at.
# Multiple values are possible, as the second line of R code illustrates.
# The first line defines a data frame called new.data
# that contains values of the explanatory variable
# at which we want to predict response values using the model MetroHealth.lm1.
# An example in the text used a value of 18 (a hypothetical)
# for the number of hospitals.
# We have added a second hypothetical value of 6,
# just to illustrate that multiple values are possible.
# This new data frame becomes the second argument in the second line of code.
# This line tells the predict function to use the model MetroHealth.lm1
# and make two predictions.
# The third line of code asks to predict at the same values of 18 and 6,
# this time using the model MetroHealth.lm2.
# Since this model was for the square-rooted data, we must square the results
# to get back to the predicted number of doctors.
# In both cases, the predictions are less than the predictions when using
# the simple linear model on the untransformed data.
# define the data frame to predict at.
new.data = data.frame(NumHospitals=c(18,6))
predict(MetroHealth.lm1,new=new.data)
predict(MetroHealth.lm2,new=new.data)^2
# Adding the Fitted Quadratics—Using R to Draw Curves
# We conclude this section on diagnostics by showing how R can create the scatterplot
# in the original scale with the fitted quadratic superimposed.
# This code suggests a general approach to fitting or drawing curves,
# which we illustrate with a second example.
# Note the main argument in the plot function, which puts a title on the plot.
plot(NumHospitals, NumMDs, main="Doctors vs. Hospitals with Quadratic Fit")
min(NumHospitals)
max(NumHospitals)
xx = seq(2,32,length=101)
newer.data = data.frame(NumHospitals = xx)
#Use the values from the MetroHealth.lm2 list to define your yy function
coef(MetroHealth.lm2)
yy = predict(MetroHealth.lm2, new=newer.data)^2
points(xx,yy,type="l")
# Explanation of code:
# First line reproduces the scatterplot.
# The second and third lines of R code ask for the minimum and maximum values of the x-variable,
# NumHospitals, which we see to be 2 to 32.
# Then, we set up a new variable that is a sequence of numbers of length 101,
# running from 2 to 32.
# We did not print xx, but it equals (2, 2.3, 2.6, 2.9, ..., 31.7, 32).
# Then, we define the variable yy by the quadratic function
# that untransforms the line we fit to the square-root-transformed data.
# Finally, the last line of R code uses the points function.
# The points function adds the 101 (xx,yy) points to the plot
# BUT using the dictates of that third argument type=’l’.
# Without that argument we would have seen 101 new open-circle points
# added to the scatterplot, but the argument is asking to replace
# the individual points with a broken line connecting these points.
# The value of the type argument here is a lower case, not an upper case, L,
# and not the numeral 1.
# There is nothing magical about 101 in this example,
# you just want to pick enough points so the curve looks like a smooth curve
# and not the succession of line segments, which in reality it is.
# Separate Example: A mathematical function.
# We can also graph a mathematical function by itself, not fitted to a scatterplot.
# Here is an example of code to graph the function y = x^2 + x − 1 on the domain x = [−2, 2].
x = seq(-2,2,length=101)
y = x^2 + x -1
plot(x,y,type="l")
abline(h=0, lty = 2)
