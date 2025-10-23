

NFL <- read.csv("1976 NFL Data.csv")
attach(NFL)
NFL.lm <- lm(Wins ~ Rushing + Passing)
library(rgl)
plot3d(x=Rushing, y=Wins, z=Passing)
