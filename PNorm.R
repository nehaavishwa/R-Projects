library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)

X <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist
length(X)
length(Y)
mean(X)
sqrt((sd(X)^2)/12+(sd(Y)^2)/12)

N<-length(X)
obs<-mean(X)-mean(Y)
se<-sqrt(
  var(X)/N+var(Y)/N
)
tstat<-obs/se
tstat

2*(1-pnorm(abs(tstat)))
t.test(X,Y)

Z <- ( mean(Y) - mean(X) ) / sqrt( var(X)/12 + var(Y)/12)
Z
2*( 1-pnorm(Z))

a<-(mean(X)-mean(dat$Bodyweight))
a
dim(dat)
sqrt((((mean(dat$Bodyweight)-mean(X))^2)/12)+((((mean(dat$Bodyweight)-mean(Y)))^2)/12))
sd(dat$Bodyweight)
dim(dat)
b<-1/12*((dat$Bodyweight-mean(dat$Bodyweight))*(dat$Bodyweight-mean(dat$Bodyweight)))
b

mean(b)
mean(a/(b))
head(dat)
avgs <- replicate(10000, mean( sample(y, 25)))
n<-100
x=sample(1:6, n, replace=TRUE)
x1<-mean(x==6)
x1
n<-10000
x=sample(1:6, n, replace=TRUE)

x1<-mean(x==6)
x1
p<-1/6
set.seed(1)
z = (x1 - p) / sqrt(p*(1-p)/n)
z
z1<-replicate(10000, mean(z==6))
z1
mean(abs(z)>2)
z

set.seed(1)
n <- 5
sides <- 6
p <- 0.5#1/sides
zs <- replicate(10000,{
  x <- sample(1:sides,n,replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
}) 
qqnorm(zs)
abline(0,1)#confirm it's well approximated with normal distribution
mean(abs(zs) > 2)

ps <- c(0.5,0.5,0.01,0.01)
ns <- c(5,30,30,100)
library(rafalib)
mypar(4,2)
for(i in 1:4){
  p <- ps[i]
  sides <- 1/p
  n <- ns[i]
  zs <- replicate(10000,{
    x <- sample(1:sides,n,replace=TRUE)
    (mean(x==1) - p) / sqrt(p*(1-p)/n)
  }) 
  hist(zs,nclass=7)
  qqnorm(zs)
  abline(0,1)
}