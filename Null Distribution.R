library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download.file(url, destfile=filename)
x1 <-read.csv(filename)
head(x1)
x <- unlist(x1)
head(x)
mean(x)

set.seed(1) 
y<-sample(x, 5)
abs(mean(y)-mean(x))


set.seed(5)
y<-sample(x, 5)
abs(mean(y)-mean(x))



library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download.file(url, destfile=filename)
x <- unlist( read.csv(filename) )


set.seed(1)
n <- 1000
nulls <- vector("numeric")
for(i in 1:n){
      control <- sample(x, 50)
      nulls[i] <- mean(control)-mean(x)
}

#nulls
mean(abs(nulls) >1)  


