url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download.file(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)
head(babies)
library(dplyr)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist


library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

set.seed(1) 
y<-sample(bwt.nonsmoke, 10)
head(y)

y1<-sample(bwt.smoke, 10)
head(y1)

s <-t.test(y, y1)
s
N <- length(bwt.nonsmoke)
obs <- mean(bwt.nonsmoke)-mean(bwt.smoke)
se <- sqrt(
  var(bwt.nonsmoke)/N+var(bwt.smoke)/N
)
tstat <-obs/se
tstat
1-pnorm(tstat)


1-
1-2*pnorm(-abs(2.1209))

mean(y)-mean(y1)
sd(y)

pnorm(y, mean=9.92, sd=1)

set.seed(1)
n <- 1000
nulls <- vector("numeric")
for(i in 1:n){
  control <- sample(y1, 50)
  nulls[i] <- mean(y)-mean(y1)
}

#nulls
mean(abs(nulls) >1)  



-abs(s)
pnorm(y)
pnorm(y1, )
hist(y)
hist(y1)
