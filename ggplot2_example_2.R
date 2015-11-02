#======================ggplo2 plotting system Example 2============#
library(plyr)
setwd("~/Dropbox/Data Scientist Specialization/Exploratory Data Analysis/Project2/")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("NEI_data/Source_Classification_Code.rds")


library(ggplot2)
data <- ddply(NEI[NEI$fips == "24510", ], c("year", "type"), numcolwise(sum))

p <- ggplot(data=data, aes(year, Emissions)) + geom_line(aes(y = Emissions, color=type),cex=2) + 
   xlab("Year") + ylab("PM2.5") + facet_grid( ~ type) + 
  labs(title = "PM2.5 emissions from sources for Baltimore City")
p
#======================End of ggplo2 plotting system Example 2============#