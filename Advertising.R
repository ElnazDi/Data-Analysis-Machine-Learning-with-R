head(advertising)
tail(advertising)
str(advertising)
summary(advertising)
boxplot(advertising$Newspaper)

library(ggplot2)
ggplot(
  data = advertising,
  aes(Newspaper)
)+
  geom_density()

par(mfrow=c(1,3)) # to see all 3 plots in a single figure (nrwo, ncolumn)

tv.lm <- lm(formula = Sales ~ TV, data = advertising) #fit a line
plot(x= advertising$TV, y= advertising$Sales, xlab = "TV", ylab="Sales") #plot data
abline(tv.lm, col="blue" ) #plot fitted line
summary(tv.lm)

radio.lm <- lm(formula= Sales ~ Radio, data=advertising )
plot(x= advertising$Radio, y=advertising$Sales, xlab = "Radio", ylab = "Sales")
abline(radio.lm, col="blue")
summary(radio.lm)


newspaper.lm <- lm(formula = Sales ~ Newspaper, data=advertising)
plot(x=advertising$Newspaper, y=advertising$Sales, xlab = "Newspaper", ylab = "Sales")
abline(newspaper.lm, col="blue")
summary(newspaper.lm)

predict(
  object = tv.lm,
  newdata = data.frame(
    TV = c(230)
  ) 
)


###################################################
head(Auto)
na.omit(Auto) # Omiting the rows with missing values
dim(Auto) #dimension of the data frame
names(Auto)   #column names    
table(Auto$name) #distict name of one column

plot(x=Auto$cylinders, y=Auto$mpg, col="blue")
str(Auto)

table(Auto$cylinders)
cylinders <- as.factor(Auto$cylinders) #to make BOX-PLOT
nlevels(cylinders)
plot(x=cylinders, y=Auto$mpg, col="red", varwidth=T, horizental=T, xlab="Cylinders", ylab="MPG")
hist(Auto$mpg, breaks = 15, col="red")

pairs(Auto) # to see all data in same figure as scatter plot
pairs(~ Auto$mpg + Auto$cylinders)
summary(Auto)
summary(Auto$weight)

####################################################

x<- rnorm(50)
print(x)
