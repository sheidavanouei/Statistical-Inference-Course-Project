set.seed(539)
lambda <- 0.2
n <- 40
size <- 1000
simulate <- replicate(size, rexp(n, lambda))

means_expo <- apply(simulate, 2, mean)

sample_mean <- mean(means_expo)
THEOmean <- 1 / lambda

sample_var <- var(means_expo)
THEOvar  <- (1 / lambda)^2 / (n) 
sample_sd <- sd(means_expo)
THEOsd  <- 1/(lambda * sqrt(n))

library(ggplot2)

plot1 <- data.frame(means_expo)
p <- ggplot(plot1, aes(x =means_expo))
p <- p + geom_histogram(aes(y=..density..), colour="black",fill = "lightblue")
p <- p + labs(title = "Distribution of means of 40 Samples", x = "Mean of 40 Samples", y = "Density")
p <- p + geom_vline(aes(xintercept = sample_mean, colour = "sample"))
p <- p + geom_vline(aes(xintercept = THEOmean, colour = "black" ))
p <- p + stat_function(fun = dnorm, args = list(mean = sample_mean, sd = sample_sd), color = "green", size = 2.0)
p <- p + stat_function(fun = dnorm, args = list(mean = THEOmean, sd = THEOsd), colour = "red", size = 2.0)
