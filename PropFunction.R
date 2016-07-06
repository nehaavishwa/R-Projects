prop = function(q)
{
  x <- filter(gapminder, year==1952)
  y <-x$lifeExp
  mean(y<=q)
}
prop(40)

x <- filter(gapminder, year==1952)
qs <-seq(from=min(x$lifeExp), to=max(x$lifeExp), length=20)
qs
props <- sapply(qs, prop)
props
plot(qs, props)
plot(ecdf(x))
