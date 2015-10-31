#======================Base plotting system Example1============#

#===========================Basics================================#
attach(mtcars)

head(mtcars[, c("hp", "mpg")])
plot(hp, mpg)

#==========================Some more===============================#
plot(hp, mpg, type = "l") # Looks ugly
plot(hp, mpg, type = "p")
# Add a title:
plot(hp, mpg, main = "MPG vs. hp")
# Change point shape
# Let's see available point shapes:
# From: http://www.r-bloggers.com/some-basics-for-base-graphics/
#======================More======================#
x <- rep(1,25)
plot(x, pch = 1:25, axes = F, xlab = "", ylab = "")
text(1:25,.95,labels = 1:25)
# So:
plot(hp, mpg, type = "p", main = "MPG vs. hp", pch=3)

#===========================Extended with parameter explanations==============================#
# From: http://www.r-bloggers.com/some-basics-for-base-graphics/
# Some handy plotting parameters
par(mfrow = c(1,2))                    # Put 2 plots on the same device
plot(hp,mpg)                        
# Parameters with explanation:
plot(hp,mpg,
     main = "MPG vs. HP",    # Add a title
     type = "p",
     col = "grey",                     # Change the color of the points
     pch = 16,                         # Change the plotting symbol  see help(points)
     cex = 1,                          # Change size of plotting symbol     
     xlab = "Horse power",   # Add a label on the x-axis
     ylab = "Miles per Gallon",        # Add a label on the y-axis
     bty = "n",                        # Remove the box around the plot
     font.axis = 1,                    # Change axis font to bold italic
     col.axis = "black",               # Set the color of the axis
     xlim = c(20,500),                 # Set limits on x axis
     ylim = c(5,50),                  # Set limits on y axis
     las=1)                            # Make axis labels parallel to x-axis

abline(lm(mpg ~ disp),                 # Add regression line y ~ x
       col="red",                      # regression line color
       lty = 2,                        # use dashed line
       lwd = 2)                        # Set thickness of the line

lines(lowess(mpg ~ disp),              # Add lowess line y ~ x
      col="dark blue",                 # Set color of lowess line
      lwd= 2)                          # Set thickness of the lowess line

leg.txt <- c("red = lm", "blue = lowess") # Text for legend
legend(list(x = 180,y = 35),           # Set location of the legend
       legend = leg.txt,               # Specify text 
       col = c("red","dark blue"),     # Set colors for legend
       lty = c(2,1),                   # Set type of lines in legend
       merge = TRUE)                   # merge points and lines

#=========End of base ploting system Example 1===========#