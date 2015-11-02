#======================ggplo2 plotting system Example 3============#
library(ggplot2)
# Histograms (http://www.r-bloggers.com/how-to-make-a-histogram-with-ggplot2/)
attach(mtcars)

# Basic example:
qplot(mtcars$mpg, geom="histogram", title="Histogram for Miles Per Gallone") 
# With ggplot:
ggplot(data=mtcars, aes(mtcars$mpg)) + geom_histogram()


# Histogram for the "mpg" column in the "mtcars" dataset, with title "Histogram for Age" and label for the x-axis ("Age"), with bins of a width of 0.5 that range from values 20 to 50 on the x-axis and that have transparent blue filling and red borders
qplot(mtcars$mpg,
      geom="histogram",
      binwidth = 0.5,  
      main = "Histogram for Miles Per Gallone", 
      xlab = "MPG",  
      fill=I("blue"), 
      col=I("red"), 
      alpha=I(.2),
      xlim=c(20,50))

# Bins
qplot(mtcars$mpg,
      geom="histogram", 
      binwidth = 0.5)

# Names and colors
qplot(mtcars$mpg,
      geom="histogram",
      binwidth = 0.5,
      main = "Histogram for MPG",
      xlab = "MPG",  
      fill=I("blue"))

qplot(mtcars$mpg,
      geom="histogram",
      binwidth = 0.5,
      main = "Histogram for MPG",
      xlab = "MPG",  
      fill=I("blue"),
      col=I("red"))

# Trendline
ggplot(data=mtcars, aes(mtcars$mpg)) + 
  geom_histogram(aes(y =..density..), 
                 breaks=seq(5, 40, by = 2), 
                 col="red", 
                 fill="green", 
                 alpha = .2) + 
  geom_density(col=2) + 
  labs(title="Histogram for MPG") +
  labs(x="MPG", y="Count")


#======================End of ggplo2 plotting system Example 3============#