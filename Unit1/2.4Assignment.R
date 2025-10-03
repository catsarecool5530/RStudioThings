CricketOriginal <- read.csv(file.choose())
Cricket <- CricketOriginal[, c('Length', 'Jump')]
View(Cricket)
attach(Cricket)
plot(Length, Jump)
linModel <- lm(Jump ~ Length)
linResid <- resid(linModel)
plot(Length, linResid)
abline(h=0)

Cricket$sqrtJump <- sqrt(Jump)
attach(Cricket)
sqrtModel <- lm(sqrtJump ~ Length)
plot(sqrtModel)
plot(sqrtJump ~ Length)
abline(sqrtModel)
sqrtResid <- resid(sqrtModel)
plot(Length, sqrtResid)

plot(log(Length), log(Jump)) # looks good!
loglogModel <- lm(log(Jump) ~ log(Length))
loglogResid <- resid(loglogModel)
plot(Length, loglogResid)
library(ggplot2)
ggplot(Cricket, aes(log(Length), log(Jump))) +
  geom_point()

coef(loglogModel)
plot(Length, Jump)
xx <- seq(min(Length), max(Length), length=101)
xx
yy <- exp(1.9665191 + 0.9462983 * log(xx))
line_data <- data.frame(Length=xx, Jump=yy)
points(xx, yy, type='l')


ggplot(Cricket, aes(Length, Jump)) +
  geom_point() + 
  geom_line(data = line_data, aes(Length, Jump))
  


