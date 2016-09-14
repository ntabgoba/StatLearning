#Support Vector Machines
install.packages("e1071")
library(MASS)
library(e1071)

set.seed(2020)
x1 = mvrnorm(n = 50, mu = rep(0,10))