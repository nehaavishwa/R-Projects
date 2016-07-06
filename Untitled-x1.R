library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv" 
#download(url, destfile=filename)
download.file(url, destfile = filename)

library(downloader)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download.file(url,filename)

dat1<-read.csv(filename)
print(dat1)
class(dat1)
table(dat1$vore=="primates")
nrow(dat1)
table(dat1$vore=="Soricomorpha")
install.packages("dplyr")

View(dat1)
P<-filter(dat1, order=="Primates")
class(P)
print(P)
nrow(P)
View(P)
P<-select(P, vore)
unlist(P)

P<-filter(dat1, order=="Primates")%>%select(vore)%>%unlist
P<-filter(dat1, order=="Primates")%>%select(sleep_total)#%>%unlist
class(P)
P<-filter(dat1, order=="Primates")%>%select(sleep_total)%>%unlist
mean(P)
summarize(filter(dat1, order=="Primates"), mean(sleep_total))

LETTERS



