

Babies = read.csv("./Files/WalkingBabies.csv")

View(Babies)















attach(Babies)

stripchart(Age ~ Group, method="stack",  pch=20, cex=1.5)

boxplot(Age ~ Group)

grand.mean = mean(Age)
SST = sum((Age - grand.mean)^2)
group.means = tapply(Age, Group, mean)
group.n = tapply(Age, Group, length)
SSG = sum(group.n * (group.means - grand.mean)^2)

SSE = SST - SSG

df.total = length(Age) - 1
df.group = length(unique(Group)) - 1
df.error = df.total - df.group

MSG = SSG / df.group
MSE = SSE / df.error

F.stat = MSG / MSE

p.value = pf(F.stat, df.group, df.error, lower.tail = FALSE)


# time to check

babies.aov = aov(Age ~ Group)
summary(babies.aov)
