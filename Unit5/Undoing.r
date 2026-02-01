
undoing = read.csv("Files/Undoing.csv")
View(undoing)

attach(undoing)
library(dplyr)
undoing <- filter(undoing, Group %in% c("I", "III", "IV"))
attach(undoing)
View(undoing)
grand.mean = mean(Score)
group.mean = tapply(Score, Group, mean)
group.effect = group.mean - grand.mean

group.resid = Score - group.mean[Group]

# its all correct!

SST = sum((Score - grand.mean)^2)
group.n = tapply(Score, Group, length)
SSM = sum(group.n * (group.mean - grand.mean)^2)
SSE = SST - SSM
df.total = length(Score) - 1
df.model = length(unique(Group)) - 1
df.error = df.total - df.model

MSM = SSM / df.model
MSE = SSE / df.error

F.stat = MSM / MSE

p.val = pf(F.stat, df.model, df.error, lower.tail = FALSE)

undoing.aov = aov(Score ~ Group)
summary(undoing.aov)

# works!