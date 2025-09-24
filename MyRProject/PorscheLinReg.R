porsche = read.csv(file.choose());
View(porsche);
#View the dimensions (rows x columns)
dim(porsche)
#Check the column names
colnames(porsche)
#Look at the first few records
head(porsche)
#Attach the file so that we can more easily refer to variable names
attach(porsche)
#Look at a plot of mileage and price
plot(Mileage, Price)
#The data appear to be distributed in a roughly linear configuration
#with a negative trend
#Use R's lm function to see the linear model (the defined equation for y-hat)
#Store the linear model as porsche.lm
porsche.lm=lm(Price~Mileage)
#The lm function returns a list with a lot of useful information
length(porsche.lm)
names(porsche.lm)
#View the linear model
porsche.lm
#Other ways to see this information
porsche.lm$coefficients
porsche.lm$coef
#This tells us that the line of best fit for our sample data is pricehat=71.0905 - .5894(Mileage)
#View the regression line
abline(porsche.lm,)
#You can also write abline by giving any intercept and slope such as
#abline(71.0905, -.5894)
#Add a horizontal, dotted line at the mean price level
abline(h=mean(Price), lty=3, col="red")
#lty gives characteristics of the line (line type)
#lty1 = solid
#lty2 = dashed
#lty3 = dotted
#lty4 = dot-dash
#lty5 = long dash
#Look at the fitted values and residuals
cbind(Mileage, Price, porsche.lm$fitted.values, porsche.lm$residuals)
#Do the same thing, but only look at the first 5 rows
cbind(Mileage, Price, porsche.lm$fitted.values, porsche.lm$residuals)[1:5,]
#Or use the head function to look at the top of the dataset
head(cbind(Mileage, Price, porsche.lm$fitted.values, porsche.lm$residuals))
#Save the table
porsche.lm.table=data.frame(cbind(Mileage, Price, porsche.lm$fitted.values, porsche.lm$residuals))
#View column names
colnames(porsche.lm.table)
#change the names of columns 3 and 4
names(porsche.lm.table)[c(3,4)]=c("fits", "resids")
#check your work
str(porsche.lm.table)
#summary
summary(porsche.lm)
