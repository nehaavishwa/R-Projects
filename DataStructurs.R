f<-function(x){x+1}
f(1)

#creating a vector
v<-c(1, 2, 3)
v


#Creating a sequence
s<-1:5
s

s<-5:1
s


#creating a matrix
m<-matrix(data = 1:6, nrow=2, ncol=3)
m

m<-matrix(data = 1:6, nrow=3, ncol=3)
m

m<-matrix(data = 1:6, nrow=3, ncol=6)
m

#creating a list
l<-list(TRUE, 1L, 2.34, "abc")
l

#creating a set factor
fact<-factor(c("Male", "Female", "Male"))
fact

unclass(fact)

# factor is more like enumeration
levels(fact)
