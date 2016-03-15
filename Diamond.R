
#install.packages('ggplot2', dep = TRUE)
require(ggplot2)
data(package='ggplot2')
head(diamonds)
ggplot(diamonds, aes(color, fill=cut)) + geom_bar()

View(diamonds)
summary(diamonds)
subset(diamonds, cut %in% 'Fair' & color %in% 'J' & price < 1000)
subset(diamonds, cut %in% 'Fair' & color %in% 'J' & price < 1000)$price

mean(subset(diamonds, cut %in% 'Fair' & color %in% 'J' & price < 1000)$price)

