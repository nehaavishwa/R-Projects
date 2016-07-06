data(ChickWeight)
head(ChickWeight)
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)

chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",
                direction="wide")
head(chick)
chick = na.omit(chick)
head(chick)
dim(chick)
mean(chick$weight.4)
sd(chick$weight.4)
x<-sum(chick$weight.4)
sd(chick$weight.4+c(3000))
x1<-x+c(3000)
x1/46
mean(x)/
mean(chick$weight.4)
124.0652/mean(chick$weight.4)
1.486 * median()