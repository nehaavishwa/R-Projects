library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download.file(url, destfile=filename)
dat <- na.omit( read.csv(filename) )
head(dat)
m<-mean(dat$Bodyweight)
s<-sample(dat$Bodyweight, 25)
pnorm(25, mean = m, sd=1)
set.seed(1)
x1<-sample_n(dat, 25)
mean(x1)
pnorm(nrow(x1), mean = mean(x1$Bodyweight), sd=1)
hist(pnorm(x, mean = mean(dat$Bodyweight), sd=1))

y<-filter(dat, Diet=='chow' & Sex=='M')
head(y)
y<-select(y, Bodyweight)
avg<-mean(dat$Bodyweight)
avg
p<-popsd(dat$Bodyweight)
p
pnorm(avg,mean(y$Bodyweight), sd=p)
