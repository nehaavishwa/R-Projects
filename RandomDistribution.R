library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv" 
download.file(url, destfile=filename)
head(filename)
x <-read.csv(filename)
head(x)
x
x$Bodyweight
library(dplyr)
y<-filter(x, Diet=="hf") %>% select(Bodyweight) 
mean(y$Bodyweight)
head(y)

set.seed(1)
#sample(x, size=1, weight=x$Bodyweight[13:24])
sample(13:24, 1, replace=TRUE)
x


library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download.file(url, destfile=filename)
x <- unlist( read.csv(filename) )
head(x)
set.seed(1)
y<-mean(sample(x, 5))
y-mean(x)


library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download.file(url, destfile=filename)
x <- unlist( read.csv(filename) )

n=1000
set.seed(1)
nulls <- vector("numeric")
for(i in 1:n){
  x1<-sample(x,5)
  nulls[i]<-mean(x1)
}
nulls

n=1000
set.seed(1)
nulls1 <- vector("numeric")
for(i in 1:n){
  x2<-sample(x,50)
  nulls1[i]<-mean(x2)
}
nulls1

hist(nulls)
hist(nulls1)

library(rafalib) 
###mypa(1,2)r is optional. it is used to put both plots on one page
mypar(1,2)
hist(nulls, xlim=c(18,30))
hist(nulls1, xlim=c(18,30))

mean(nulls1>=23 & nulls1<=25)
pnorm(mean(nulls1>=23 & nulls1<=25), mean = 23.9, sd=0.43)
