d = read.csv("assoctest.csv")

head(d)
table(d)
chisq.test(table(d))
fisher.test(table(d))
