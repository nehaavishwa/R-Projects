set.seed(1)

library(rafalib)

dat <- read.csv("mice_pheno.csv")
controlPopulation <-read.csv("femaleControlsPopulation.csv")
controlPopulation <- unlist(controlPopulation)

ttestgenerator <-function(n){
  cases <-sample(controlPopulation, n)
  controls <-sample(controlPopulation, n)
  tstat <- (mean(cases)-mean(controls))/sqrt(var(cases)/n + var(controls)/n)
  return(tstat)
}

ttests <- replicate(1000, ttestgenerator(3))

hist(ttests)
qqnorm(ttests)
abline(0,1)

## how well the T-distribution approximates

ps <- (seq(0, 999)+0.5)/1000
qqplot(qt(ps, df=2*3-2), ttests, xlim=c(-6,6), ylim = c(-6,6))
abline(0,1)

qqnorm(controlPopulation)
qqline(controlPopulation)

controls <-rnorm(5000, mean=24, sd=3.5)
ttestgenerator <-function(n, mean=24, sd=3.5){
  cases <-rnorm(n,mean,sd)
  controls <-rnorm(n, mean, sd)
  tstat <- (mean(cases)-mean(controls))/sqrt(var(cases)/n + var(controls)/n)
  return(tstat)
  
}

ttests <- replicate(1000, ttestgenerator(3))

hist(ttests)
qqnorm(ttests)
abline(0,1)


########## 1st
set.seed(1)
random<-rnorm(5)
random
t<-(sqrt(5)*mean(random))/sd(random)
t


###########2nd
set.seed(1)

ttestgenerator <-function(){
  #cases <-rnorm(n,mean,sd)
  #controls <-rnorm(n, mean, sd)
  random<-rnorm(5)
  tstat <- (sqrt(5)*mean(random))/sd(random) #(mean(cases)-mean(controls))/sqrt(var(cases)/n + var(controls)/n)
  return(tstat)
}
t<-replicate(1000, ttestgenerator())
#t<-(sqrt(1000)*mean(random))/sd(random)
mean(t>2)

hist(t)
rep <-replicate(1000, t)
hist(rep)
qqnorm(rep)
rep>2
######
set.seed(1)
random<-rnorm(1000)
#random
#random>2
t<-(sqrt(5)*mean(random))/sd(random)
t
hist(t)
qqnorm(t)


##############
set.seed(1)
N <- 5
B<- 1000

tstats <- replicate(B,{
  X <- rnorm(N)
  sqrt(N)*mean(X)/sd(X)
})
mean(tstats>2)

############

set.seed(1)
N <- 1000
B<-100
tstats <- replicate(B,{
  X <- rnorm(N)
  sqrt(N)*mean(X)/sd(X)
})
ps = seq(1/(B+1), 1-1/(B+1),len=B)
qqplot(qt(ps,df=4), ttests, xlim=c(-6,6), ylim = c(-6,6))
abline(0,1)

################

set.seed(1)
N <- 500
B<-100
tstats <- replicate(B,{
  X <- rnorm(N)
  sqrt(N)*mean(X)/sd(X)
})
ps = seq(1/(B+1), 1-1/(B+1),len=B)
qqplot(qt(ps,df=2*N-2), ttests, xlim=c(-6,6), ylim = c(-6,6))
abline(0,1)

###############

X=rnorm(15)
tstat <- sqrt(15)*mean(X) / sd(X)
tstat
X =sample(c(-1,1), 15, replace=TRUE)
tstat <- sqrt(15)*mean(X) / sd(X)
tstat
