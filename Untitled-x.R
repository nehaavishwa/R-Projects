library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
x
set.seed(1)
n<-1000
nulls<-vector('numeric')
nulls1<-vector('numeric')
for(i in 1:n){
      y<-sample(x, 5)
      z<-sample(x, 50)
      nulls[i]<-mean(y)
      nulls1[i]<-mean(z)
}
hist(nulls1)
hist(nulls)


set.seed(1)
n<-1000
nulls<-vector('numeric')
for(i in 1:n){
  y<-sample(x, 5)
  nulls[i]<-mean(y)
}
hist(nulls)

set.seed(1)
n<-1000
nulls1<-vector('numeric')
for(i in 1:n){
  z<-sample(x, 50)
  nulls1[i]<-mean(z)
}
m<-mean(nulls1)
mean(nulls1>23 & nulls1<25)
?pnorm
s<-sd(nulls)
s
p1<-pnorm(23, mean = m, sd=s)
p2<-pnorm(25, mean = m, sd=s)
p1-p2
p1<-pnorm(23, mean = 23.9, sd=0.43)
p2<-pnorm(25, mean = 23.9, sd=0.43)
p1-p2
mean(23<=nulls1<=25)
mean(nulls1>23)/mean(nulls1<25)


hist(nulls1)
