data(ChickWeight)
head(ChickWeight)
ChickWeight
ch <-filter(ChickWeight, Chick==4)
head(ch)
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",
                direction="wide")

head(chick)
chick = na.omit(chick)
head(chick)
Noutlier <-mean(chick$weight.4)
Noutlier
NoutlierMed <-median(chick$weight.4)
NoutlierSD <-sd(chick$weight.4)
chickO<-c(chick$weight.4,3000)
chickO
chick21<-c(chick$weight.21,3000)
outlier <-mean(chickO)
outlierMed <-median(chickO)
outlierSD <-sd(chickO)
outlier/Noutlier
outlierMed/NoutlierMed
outlierSD/NoutlierSD

1.4826* median(chick$weight.4-median(chick$weight.4))
mad(chick$weight.4)#-median(chick$weight.4))
1.4826* median(chickO-median(chickO))
mad(chickO)


cor(chick$weight.4,chick$weight.21)
cor(chickO,chick21)

cor(chick$weight.4,chick$weight.21)/
  cor(chickO,chick21)/cor(chick$weight.4,chick$weight.21)
