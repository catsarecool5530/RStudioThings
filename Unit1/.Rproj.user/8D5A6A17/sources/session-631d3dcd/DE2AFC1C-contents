Data <- read.csv(file.choose())
attach(Data)
View(Data)
plot(Time, Voltage)
Data.lm = lm(Voltage ~ Time)
plot(Time, resid(Data.lm))
abline(0, 0)
Voltage = log(Voltage)
plot(Time, Voltage)
abline(logForm)
logForm = lm(Voltage ~ Time)
logForm
plot(logForm)

plot(Time, resid(logForm))

abline(0,0)
library(ggplot2)
Data$logVolt <- log(Data$Voltage)
plot1 <- ggplot(Data, aes(x=Time, y=logVolt)) +
  geom_point() + 
  geom_smooth(method='lm')

Data$resid <- resid(logForm)
plot2 <- ggplot(Data, aes(x=Time, y=resid)) +
  geom_point() + 
  geom_hline(yintercept = 0)

library(gridExtra)

grid.arrange(plot1, plot2)


