#5.1 continued: components of anova

leaf=read.csv(file.choose(), header=T)
attach(leaf)
names(leaf)
head(leaf)

#Compare Fructose to Sucrose
stripchart(Days~Diet, data=leaf[Diet=="Fructose"|Diet=="Sucrose",],vertical=TRUE)
#This is the type of thing that we would approach formally with a t-test

#Compare all
stripchart(Days~Diet,vertical=TRUE)
#ANOVA is a generalized t-test, much like chi square is a generalized proportion test

#We compare differences between groups to differences within groups

#We can find each value with overlays
leaf$grandmean=mean(Days)
leaf$groupmean = ave(Days, Diet)
leaf$groupeffect= groupmean-grandmean
leaf$res=Days-groupmean

#We can set up an ANOVA table
#Finding SST and SSR is easier than finding SSM, so find those first and subtract
SSR=sum((leaf$res)^2)
SST=sum((leaf$Days-leaf$grandmean)^2)
SSDiet=SST-SSR

#Degrees of freedom
library(dplyr)
n_distinct(leaf$Diet)
#dfModel= k - 1
dfDiets=n_distinct(leaf$Diet)-1
#dfResiduals = n - k - 1
dfResid=length(Diet)-dfDiets-1

#MSM = SSM/dfModel
MSDiets=SSDiet/dfDiets
#MSR = SSR/dfResid
MSR=SSR/dfResid

F.Stat=MSDiets/MSR

#Using R's analysis of variance function
leaf.aov=aov(Days~Diet)
summary(leaf.aov)

pf(F.Stat, dfDiets, dfResid, lower.tail = FALSE)

MSR^(.5)
# = RSE
aov(Days~Diet)
