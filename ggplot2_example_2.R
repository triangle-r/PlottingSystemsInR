#======================ggplo2 plotting system Example 2============#
library(ggplot2)
attach(mtcars)

# ggplot()

# Basic:
ggplot(mtcars, aes(hp, mpg)) + geom_point()
# With color:
ggplot(mtcars, aes(hp, mpg)) + geom_point(aes(color = cyl))

# Boxplots:
ggplot(data=mtcars, aes(hp, mpg)) + geom_boxplot(aes(as.factor(cyl)))

# Faceting
mtcars$cyl <- factor(mtcars$cyl)
ggplot(data=mtcars, aes(hp, mpg)) + geom_point() + facet_grid(~ cyl)

# Smoothing:
ggplot(data=mtcars, aes(hp, mpg)) + geom_point() + facet_grid(~ cyl) + 
  geom_smooth(colour = "blue", size = 1, method=lm)


#======================End of ggplo2 plotting system Example 2============#