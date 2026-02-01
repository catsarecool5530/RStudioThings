
CatFood = read.csv('Files/CatFood.csv')
View(CatFood)

library(ggplot2)


# Essentially random, nice
ggplot(CatFood, aes(x = Price, y = PricePerOz)) +
    geom_point()

# Seeing some outliers, but overall looks good
ggplot(CatFood, aes(Manufacturer, PricePerOz)) +
    geom_boxplot()
attach(CatFood)
SD = tapply(PricePerOz, Manufacturer, sd)
SD
max(SD)/min(SD)

# For conversion of tables to latex
# install.packages('xtable') 
library(xtable)

price.aov = aov(PricePerOz ~ Manufacturer)
summary(price.aov)
plot(price.aov)
xtable(summary(price.aov))

# install.packages('agricolae')

library(agricolae)
lsdTest = LSD.test(price.aov, 'Manufacturer', p.adj = c("bonferroni"))
summary(lsdTest)
xtable(lsdTest$groups)
rating.aov = aov(Rating ~ Manufacturer)
summary(rating.aov)

priceBySize.aov = aov(PricePerOz ~ Price)
summary(priceBySize.aov)
