datasets::mtcars
library(ggplot2)
head(mtcars)

mtcars$vs <-  as.factor(mtcars$vs)
mtcars$am <- as.factor(mtcars$am)


cor(mtcars$mpg, mtcars$am)
cor(mtcars$mpg, mtcars)

Fit <- lm(mpg~am , data = mtcars)
summary(Fit)
boxplot(mpg ~ am, data = mtcars, col = (c("lightblue","darkblue")), ylab = "Miles Per Gallon", xlab = "Transmission Type")

bestFit <- lm(mpg~am + cyl + disp + hp + wt, data = mtcars)
summary(bestFit)

anova(Fit, bestFit)
pairs(mpg ~ ., data = mtcars)

par(mfrow = c(2,2))
plot(bestFit) 


