#Memory Usage in R
library(pryr)
library(ggplot2)
library(devtools)
install.packages("devtools")
devtools::install_github("hadley/lineprof")
# Object_size(),This function is better than the built-in object.size() 
#because it accounts for shared elements within an object and includes the size of environments.)
object_size(1:10)
object_size(mean)
object_size(mtcars)
# empty vector not zero memory, nor mem usage proportional to length
sizes <- sapply(0:50, function(n) object_size(seq_len(n)))
plot(0:50, sizes, xlab = "Length", ylab = "Size (bytes)", type = "s")
?sapply
