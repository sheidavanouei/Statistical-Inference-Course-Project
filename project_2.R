data("ToothGrowth")
summary(ToothGrowth)
str(ToothGrowth)
head(ToothGrowth)
unique(ToothGrowth$len)
unique(ToothGrowth$supp)
unique(ToothGrowth$dose)

library(ggplot2)

p <- ggplot(ToothGrowth, aes(x=dose, y=len)) 
p <- p + geom_boxplot(aes(fill=factor(dose)))
p <- p + facet_grid(.~supp)
p <- p + ggtitle("Tooth Growth by Supplement & Dosage")
p

t.test(len ~ supp, data=ToothGrowth)
dose1 <- subset(ToothGrowth, dose %in% c(0.5, 1.0))
dose2 <- subset(ToothGrowth, dose %in% c(0.5, 2.0))
dose3 <- subset(ToothGrowth, dose %in% c(1.0, 2.0))
t.test(len ~ dose, paired = F, var.equal = F, data = dose1)
t.test(len ~ dose, paired = F, var.equal = F, data = dose2)
t.test(len ~ dose, paired = F, var.equal = F, data = dose3)      
    
       
       