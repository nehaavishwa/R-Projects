url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download.file(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

N=10
set.seed(1)
nonsmokers <- sample(bwt.nonsmoke , N)
smokers <- sample(bwt.smoke , N)
obs <- mean(smokers) - mean(nonsmokers)
obs
obs1 <-median(smokers) - median(nonsmokers)

dat <- c(smokers,nonsmokers)
shuffle <- sample( dat )
smokersstar <- shuffle[1:N]
nonsmokersstar <- shuffle[(N+1):(2*N)]
mean(smokersstar)-mean(nonsmokersstar)

set.seed(1)
n <- 1000
nulls <- vector("numeric")
for(i in 1:n){
  dat <- c(smokers,nonsmokers)
  shuffle <- sample( dat )
  smokersstar <- shuffle[1:N]
  nonsmokersstar <- shuffle[(N+1):(2*N)]
  nulls[i] <-mean(smokersstar)-mean(nonsmokersstar)
  #nulls[i] <- mean(control)-mean(x)
}
( sum( abs(nulls) >= abs(obs)) +1 ) / ( length(nulls)+1 ) 

set.seed(1)
n <- 1000
nulls <- vector("numeric")
for(i in 1:n){
  dat <- c(smokers,nonsmokers)
  shuffle <- sample( dat )
  smokersstar <- shuffle[1:N]
  nonsmokersstar <- shuffle[(N+1):(2*N)]
  nulls[i] <-median(smokersstar)-median(nonsmokersstar)
  #nulls[i] <- mean(control)-mean(x)
}
( sum( abs(nulls) >= abs(obs1)) +1 ) / ( length(nulls)+1 )

mean(abs(nulls))
dF <- function(x)dnorm(x)
pF <- function(q)integrate(dF,-Inf,q)$value 
pF(mean(nulls))
pnorm(nulls)

t.test(nulls, mu=abs(mean(nulls)))
2*pnorm()
2*pt(-abs(nulls),df=N-1)
mean(abs(nulls))  

set.seed(1)
null <- replicate(1000, {
  shuffle <- sample( dat )
  smokersstar <- shuffle[1:N]
  nonsmokersstar <- shuffle[(N+1):(2*N)]
  mean(smokersstar)-mean(nonsmokersstar)
})
( sum( abs(null) >= abs(obs)) +1 ) / ( length(null)+1 ) 
##we add the 1s to avoid p-values=0 but we also accept:
( sum( abs(null) >= abs(obs)) ) / ( length(null) )

