#======================ggplo2 plotting system Example 3============#
library(ggplot2)
# Histograms 
attach(mtcars)

# Basic example:
qplot(mtcars$mpg, geom="histogram", title="MPG", x.lab=) 

#======================End of ggplo2 plotting system Example 3============#