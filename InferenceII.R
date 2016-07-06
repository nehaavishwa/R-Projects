url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download.file(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

set.seed(1)
dat.ns<-(sample(bwt.nonsmoke, 5))

#set.seed(1)
dat.s<-(sample(bwt.smoke, 5))

N<-length(dat.ns)
N
obs<-mean(dat.s)-mean(dat.ns)
se<-sqrt(
  var(dat.s)/N+var(dat.ns)/N
)
tstat<-obs/se
tstat
2*(1-pnorm(abs(tstat)))
t.test(dat.s,dat.ns)

##Power

url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download.file(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

set.seed(1)
dat.ns<-(sample(bwt.nonsmoke, 5))
#set.seed(1)
dat.s<-(sample(bwt.smoke, 5))

N<-length(dat.ns)
N
obs<-mean(dat.s)-mean(dat.ns)
se<-sqrt(
  var(dat.s)/N+var(dat.ns)/N
)
tstat<-obs/se
tstat
2*(1-pnorm(abs(tstat)))
t.test(dat.s,dat.ns)

N<-5
alpha<-0.01
B<-10000
set.seed(1)
reject<-function(N, alpha=0.01){
  dat.ns<-(sample(bwt.nonsmoke, N))
  dat.s<-(sample(bwt.smoke, N))
  pval<-t.test(dat.ns, dat.s)$p.value
  pval < alpha
}

reject(5)
set.seed(1)
rejections<-replicate(B, reject(N))
mean(rejections)

Ns<- seq(90, 120)

power <-sapply(Ns, function(N){
  rejections <- replicate(B, reject(N))
  mean(rejections)
})

plot(Ns, power, type="b")
