
getwd()
setwd("/Users/nehaavishwa/Documents/R-DataScience")
getwd()
load("skew.RData")
dim(y)
head(y)
y

y <-par(mfrow = c(3,3))
for (i in 1:9){
  qqnorm(dat[i])
}

qqnorm(dat)
qqline(dat)

head(InsectSprays)
dim(InsectSprays)
hist(InsectSprays$count)
hist(InsectSprays$spray)
median(InsectSprays$count)
boxplot(InsectSprays)
boxplot(split(InsectSprays$count, InsectSprays$spray))

install.packages("UsingR")
library(dplyr)
data(nym.2002, package="UsingR")
head(nym.2002)
boxplot(split(nym.2002$time, nym.2002$gender))
t <-filter(nym.2002, nym.2002$gender=="Male")
t
hist(t$time)
qqnorm(t$time)
qqline(t$time)

t1 <-filter(nym.2002, nym.2002$gender=="Female")
t1
hist(t1$time)
qqnorm(t1$time)
qqline(t1$time)


mypar(1,3)
males <- filter(nym.2002, gender=="Male") %>% select(time)%>% unlist
females <- filter(nym.2002, gender=="Female") %>% select(time) %>% unlist
head(males)
head(females)
boxplot(females, males)
hist(females,xlim=c(range( nym.2002$time)))
hist(males,xlim=c(range( nym.2002$time)))

males1 <- filter(nym.2002, gender=="Male") %>% select(time, age)
females1 <- filter(nym.2002, gender=="Female") %>% select(time, age) 
head(males1)
head(females1)
library(Hmisc)
install.packages("Hmisc")
rcorr(as.matrix(males1))
rcorr(males1$time,males1$age, type="pearson")

rcorr(as.matrix(females1))
rcorr(females1$time,females1$age, type="pearson")

head(nym.2002)
boxplot(split(nym.2002$time, round(nym.2002$age)))
