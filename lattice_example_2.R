#---------- lattice Example #2------------#
# http://www.statmethods.net/advgraphs/trellis.html

library(lattice)
attach(mtcars)

# Customizing Lattice Graphs
panel.smoother <- function(x, y) {
  panel.xyplot(x, y) # show points 
  panel.loess(x, y)  # show smoothed line 
}

hp <- cut(hp,3) # divide horse power into three bands 

xyplot(mpg ~ wt | hp, scales=list(cex=.8, col="red"),
       panel=panel.smoother,
       xlab="Weight", ylab="Miles per Gallon", 
       main="MGP vs Weight by Horse Power", data = mtcars)


histogram(~ wt | hp, data = mtcars)


#------------ End of lattice Example #2 ------------#