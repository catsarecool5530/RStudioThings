Fingers.df = read.csv(file=file.choose())
# Get the data.Fingers.df 
# Print the data.

attach(Fingers.df)
tab= tapply(TapRate,list(Subject,Drug),mean) 
# create a table of means
tab 
# print out the table

row.means = tapply(TapRate,Subject,mean)
# compute row means

col.means = tapply(TapRate,Drug,mean)
# compute column means

rbind(cbind(tab,row.means),c(col.means,34)) 
# attach row and column means
# to the table.

# Notice that there is no name for the row of column means.
# We will rectify that.

tab2 = rbind(cbind(tab,row.means),c(col.means,34))
row.names(tab2)

row.names(tab2)[5] = "col.means"
tab2

# If we would prefer to list Placebo first, as in the text, we use:
tab2[,c(2,1,3)]


# In the code, the rbind(cbind(tab,row.means),
# c(col.means,34)) creates a matrix with 5 rows and 4 columns, 
# and then the [,c(2,1,3)] tells R to print out all rows-
# that's the empty spot before the comma-
# and then use the columns in the order 2, 1, and then 3, 
# giving the order we want: Placebo, Caffeine, and then Theobromine.
 
# The code below replicates the two-way additive model fit summarized in the notes.
Fingers.aov= aov(TapRate ~ Drug +  Subject)
summary(Fingers.aov)

# The following code reproduces the two plots in notes.
# The following two give the normal quantile plot,
# with the same axis labels as the text.

qqnorm(Fingers.aov$resid,ylab="Residuals",xlab="Normal Quantiles")
qqline(Fingers.aov$resid)

# The following gives the residuals vs. fits plot:
plot(Fingers.aov$fitted,Fingers.aov$resid,xlab="Fitted Tap Rate", ylab="Residuals")
abline(h=0)
