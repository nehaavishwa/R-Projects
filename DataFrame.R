#Creating a data frame

df<-data.frame(
  Name = c("Cat", "Dog", "Cow", "Pig"),
  HowMany =c(5, 10, 15, 20),
  IsPet =c(TRUE, TRUE, FALSE, FALSE)
)
df

# Indexing data frames by row 
df[1, 2]

df[1, ]
df[,2]
df[["HowMany"]]

df$HowMany

#Subsetting data frames

df[c(2,4), ]
df[2:4, ]

df[c(TRUE, FALSE, TRUE, FALSE), ]

df[c(TRUE, FALSE, TRUE, FALSE), c(TRUE, TRUE, FALSE, FALSE)]

df[df$Name %in% c("Cat", "Cow")]
