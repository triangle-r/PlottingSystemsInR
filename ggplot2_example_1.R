#======================ggplo2 plotting system Example 1============#
# http://www.r-bloggers.com/basic-introduction-to-ggplot2/
#qplot() - for quick plots

#load the package
library(ggplot2)
attach(mtcars)
head(mtcars)

# Simple plot:
qplot(data=mtcars,x=hp, y=mpg,main="MPG vs. hp")

# Color gradient
qplot(data=mtcars,x=log(hp),y=log(mpg),color=mpg)

# Boxplots:
qplot(data=mtcars,x=factor(cyl), y=mpg,geom="boxplot", main="MPG vs. # of Cylinders")

# Faceting
mtcars$cyl <- factor(mtcars$cyl)
qplot(data=mtcars, x=hp, y=mpg, color=mpg, facets = ~ cyl) 

# Some smoothing
qplot(data=mtcars, x=hp, y=mpg, color=mpg, facets = ~ cyl) + stat_smooth(method="lm")

#======================End of ggplo2 plotting system Example 1============#