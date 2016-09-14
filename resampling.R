#Re-Sampling
require(boot)
require(ISLR)
setwd("/Users/ntabgoba/Desktop/StatLearning/")
rdata <- load("5.R.RData")
rdata.info()
file.info(rdata)
lm(x~y,data = rdata)
ls()
head(Xy)
dim(Xy)
attach(Xy)
tail(Xy)
fit1 <- lm(y ~ X1 + X2)
summary(fit1)
matplot(Xy,type="l")
?matplot

#3 Question
library(boot)
alpha = function(x,y){
        vx = var(x)
        vy = var(y)
        cxy= cov(x,y)
        (vy-cxy)/(vx+vy-2*cxy)
}
