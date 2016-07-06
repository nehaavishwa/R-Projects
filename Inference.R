url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download.file(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

set.seed(1)
dat.ns<-(sample(bwt.nonsmoke, 25))

#set.seed(1)
dat.s<-(sample(bwt.smoke, 25))

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

n<-10000
nulls<-vector('numeric')
for(i in 1:n){
  dat.ns<-(sample(bwt.nonsmoke, 25))
  dat.s<-(sample(bwt.smoke, 25))
  nulls[i]<-mean(dat.s)-mean(dat.ns)
}

mean(abs(nulls)>99)
pnorm(mean(nulls))

N <- 25
qnorm(0.995)*sqrt( sd( dat.ns)^2/N + sd( dat.s)^2/N )

Q<-qnorm(1-0.05/2)
Q

set.seed(1)
dat.ns<-(sample(bwt.nonsmoke, 25))

#set.seed(1)
dat.s<-(sample(bwt.smoke, 25))

N<-length(dat.ns)



