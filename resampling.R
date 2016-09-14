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
alpha(Xy$X1,Xy$y)
# alpha(Xy$X2, Xy$y)
alpha.fn = function(data,index){
        with(data[index,],alpha(Xy$X1,Xy$y))
}

alpha.fn<-function(data, index) {
        fit1<-lm(y~., data=Xy[index,])
        coefficients(fit1)[['X1']]
}
set.seed(1)
alpha.fn (Xy,sample(1:100,100,replace=TRUE))

boot(Xy,function(tptp,idx){
        idx <- rep(sample(0:9,10,replace=T) * 100,each= 100) + 1:100
        coef(glm(y~X1+X2,data=tptp[idx,]))[[2]]
     },R=10000)