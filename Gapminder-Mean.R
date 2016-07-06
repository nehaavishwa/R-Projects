install.packages("gapminder")
library(gapminder)
data("gapminder")
head(gapminder)
class(gapminder)
x<-filter(gapminder, year==1952)
head(x)
x$lifeExp
class(x)
y <-mean(x$lifeExp)
y
mean(x$lifeExp<=40)
mean(x$lifeExp<=60) - mean(x$lifeExp<=40)

