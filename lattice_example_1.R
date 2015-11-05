#---------- lattice Example #1------------#
# http://www.statmethods.net/advgraphs/trellis.html

library(lattice)
attach(mtcars)
## Simple scatterplot
xyplot(mpg ~ hp, data = mtcars)


## More complex:
# Create factors with value labels 
gear.f<-factor(gear,levels=c(3,4,5),
               labels=c("3gears","4gears","5gears")) 
cyl.f <-factor(cyl,levels=c(4,6,8),
               labels=c("4cyl","6cyl","8cyl")) 

# Kernel density plot 
densityplot(~mpg, 
            main="Density Plot", 
            xlab="Miles per Gallon")

# Kernel density plots by factor level 
densityplot(~mpg|cyl.f, 
            main="Density Plot by Number of Cylinders",
            xlab="Miles per Gallon")

# Kernel density plots by factor level (alternate layout) 
densityplot(~mpg|cyl.f, 
            main="Density Plot by Numer of Cylinders",
            xlab="Miles per Gallon", 
            layout=c(1,3))

# Boxplots for each combination of two factors 
bwplot(cyl.f~mpg | gear.f,
        ylab="Cylinders", xlab="Miles per Gallon", 
       main="Mileage by Cylinders and Gears", 
       layout=c(1,3))
       
# Scatterplots for each combination of two factors 
xyplot(mpg ~ wt|cyl.f*gear.f, 
      main="Scatterplots by Cylinders and Gears", 
      ylab="Miles per Gallon", xlab="Car Weight")
       
# 3d scatterplot by factor level 
cloud(mpg ~ wt*qsec|cyl.f, 
      main="3D Scatterplot by Cylinders") 
       
# Dotplot for each combination of two factors 
dotplot(cyl.f~mpg|gear.f, 
       main="Dotplot Plot by Number of Gears and Cylinders",
       xlab="Miles Per Gallon")
       
# Scatterplot matrix 
splom(mtcars[c(1,3,4,5,6)], 
       main="MTCARS Data")

# Levelplot:
require(geoR)
data(elevation)

elevation.df = data.frame(x = 50 * elevation$coords[,"x"],
                          y = 50 * elevation$coords[,"y"], z = 10 * elevation$data)
elevation.loess = loess(z ~ x*y, data = elevation.df, degree = 2, span = 0.25)
elevation.fit = expand.grid(list(x = seq(10, 300, 1), y = seq(10, 300, 1)))

z = predict(elevation.loess, newdata = elevation.fit)
elevation.fit$Height = as.numeric(z)

levelplot(Height ~ x*y, data = elevation.fit,
          xlab = "X Coordinate (feet)", ylab = "Y Coordinate (feet)",
          main = "Surface elevation data",
          col.regions = terrain.colors(100)
)


#------------ End of lattice Example #1 ------------#