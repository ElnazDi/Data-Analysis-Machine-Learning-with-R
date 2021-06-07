# Problem 3
# Get Help
?ls
help(ls)
help.search("ls")
#install.packages("boot")
help(package="boot")

# Problem 4
# R as a calculator
5 + 5
sqrt(100)


# Problem 5
# Explore some mathematical functions and try them.
?sum
sum(2+2)
x <- 1:10
sum(x)
?sqrt
sqrt(8)
?abs
abs(-3)
abs(x)
abs(c(-4, -3))

# Problem 6
# Your working directory is the folder on your computer in which you are currently working. Explore:
getwd()
# [1] "/Users/dehkharghanielnaz/Desktop/SRH_Classes_Second/Analytics_2/R_Second_Problems/data"
# /Users/dehkharghanielnaz = ~
setwd("~/Desktop/SRH_Classes_Second/Analytics_2/R_Second_Problems/data")
?setwd
setwd("..") # Go one directory up

# Problem 7
save()
load() 
save.image()

# Problem 8
# Create two scalars a and b and do some calculations with these. 
# Learn how to use c(). Use <- or = to assign values to variables.

a <- c(2,3,5)
b <- c(4,4,5)
print(a+b)

c <- 4
d <- 9 # if put 5 here bothe sqrt(c(c,d)) convert to double

c(c,d)
sqrt(c(c,d))

e <- c(c,d)
sqrt(e)

# Problem 9
# What are valid variable names in R? Check function:
?make.names()
a <- c("1var", "!var", " var", "var1") #begin with char, avoid begin with special char and numbers
make.names(a)

# Problem 10
# Build two sequences a and b with numbers 1 to 5 and 6 to 10. Use functions seq() and :
a <- seq(1,5)
b <-seq(6,10)

# or

a <- 1:5
b <- 6:10

# or

a <- c(1:5)
b <- c(6:10)

# Problem 11
# Learn to use more arguments from seq() and build some vectors.
?seq()
seq(from = -2, to= 2, length.out=10)
seq(from = -2, to= 2, length=10)

seq(from=1, to=10, by=2)

x <- c(1,3,"f",5,3) #use length of this for seq() -> along.with
seq(from= 1, to= 10, along.with=x)

# Problem 12
# Use rep() to build vectors.
?rep
rep(1:4, 2)
rep(1:4, each=2)
rep(1:4, c(2,2,2,2)) #same with above
rep(1:4, each=2, len=4)
rep(1:4, each=2, len=10)
rep(1:4, each=2, times=3)


rep(c("a", "b"), each=2) 
rep(c("a", "b"), c(2,3)) # each
rep(c("a", "b"), times=2) # Or rep(c("a", "b"), 2)

# Problem 13
# Generate the following sequence with paste():
# [1] "Number: 1" "Number: 2" "Number: 3" "Number: 4" "Number: 5"
?paste
paste("Number", 1:5, sep=": ")

paste(1:12)
as.character(1:12) #same

paste(1:12, c("st", "nd", "rd", rep("th", times=9)), sep = "")

# Problem 14
# R comes with many functions to generate random numbers with different distributions.
# Check function rnorm() and its arguments, as well as set.seed().
?rpois()
rpois(5, lambda= 3) #each time produce random numbers

?rnorm()
rnorm(5) #mean=0 and sd=1
rnorm(5, mean = 5, sd=2)

set.seed(4) #each time same result
rnorm(5)

set.seed(1234) # each time same result
rpois(5, lambda=3)

# Problem 15
# Try other random number functions.
# Generate a random number between 5.0 and 7.5
?runif
runif(x=2, min=5.0, max=7.5) # x: how many random numbers?
runif(x=10)

# Generate a random integer between 1 and 10
sample(1:10, 2)

?rchisq
rchisq(n=10, df=3)


# Problem 16
# Missing values NA and the NULL object are specialy treated in R:

x <- c(1:10, NA)
a <- NULL
#Check is.na(), is.null() and mean(). How to deal with missing values in mean() and other R functions?
is.na(x)
is.null(x)
is.na(a)
is.null(a)
mean(x)
mean(x, na.rm = TRUE)


# Problem 17
# Use rbind() and cbind() to cohere sequences a and b to a matrix.
a.1 <- 1:5
b.1 <- 6:10
rbind(a.1,b.1)
cbind(a.1,b.1)

# a <- Null
# b <- 6:10
cbind(a,b)
rbind(a,b)

# Problem 18
# Generate a matrix m of dimension 4 rows and 5 columns with random numbers. Use function matrix().
m <- matrix(c(rnorm(20)), nrow=4, ncol=5)
print(m)

# Problem 19
# Round the values to 1 digit.
round(m, digits = 1)
?round()

# Problem 20
# What are lists in R? Hint: use function list() and read help pages.
?list() # Combine different objects together


# Problem 21
# Create a list l with a vector v and matrix m. Name the elements of the list „v“ and „m“
v <- c(1,2,3)
m <- matrix(1:9, nrow = 4, ncol=3)
l <- list(v, m)
names(l) <- c("v", "m")
print(l)

## Or, this one is simpler

sl <- list("v"=c(44,55,66), "m"=matrix(data=runif(9, min=4, max=23), nrow=3, ncol=3, byrow=TRUE))
sl

# Problem 22
# Make row and column names in m. Explore dimnames(), rownames() and colnames().

cm <- matrix(data=sample(18), nrow = 2, ncol=9, byrow = TRUE, 
             dimnames = list(
               paste("row", 1:2, sep=": "),
               paste("col", 1:9, sep=": ")
             ))
cm

# Or
pm <- matrix(round(rnorm(15), digits = 2), ncol = 3, nrow = 3, byrow = TRUE)
pm

dimnames(pm) <- list(
  paste("row", 1:nrow(pm), sep = ": "),
  paste("col", 1:ncol(pm), sep = ": ")
)

dimnames(pm)
rownames(pm)
colnames(pm)

#Problem 23
#Create a vector x with values from 1 to 10. 

x <- 1:10
i <- x <= 5
i
x[i]
x[!i]
sum(i) # sum number of Trues

# Problem 24
# Index 1) the 3rd col in matrix m, 2) the 4th row in matrix m and 3) value in 1st row, 1st column.

m <- matrix(runif(24), nrow=4, ncol=6)
m

m[, 3]
m[4, ]
m[1,1]



# Problem 25
# How to you get the values of the second row in your matrix m from list l?


mylist <- list("v" = c(1:10), "m"= matrix(rpois(20, lambda=5), nrow=5, ncol = 4, dimnames = 
                                            list(
                                              paste("row", 1:5, sep=":"),
                                              paste("col", 1:4, sep=":")
                                            )))

mylist

mylist$m[2, ]
# Or
mylist[["m"]][2, ] # list is something like this [[[[[[]]]]]]



# Problem 26
# Make familiar with data frames. What are factors in R?

# Data type in R: 1. numeric 2. Integer 3. complex 4. character 5. Raw 6. Logical
# Objects in R:  1. Matrix 2. List 3. vactor 4. data frame 5. Array 6. Factors


# Data frames are tabular data objects. 
# Unlike a matrix in data frame each column can contain different models of data.
# It is a list of vectors of equal length.
# Data frames are created using the data.frame() function.

# Create the data frame.

BMI <- 	data.frame(
  gender = c("Male", "Male","Female"),
  height = c(152, 171.5, 165),
  weight = c(81,93, 78), 
  Age = c(42,38,26)
)
print(BMI)


# Create a vector.
apple_colors <- c('green','green','yellow','red','red','red','green')
# Create a factor object.
factor_apple <- factor(apple_colors)
# Print the factor.
print(factor_apple)
print(nlevels(factor_apple))
factor_apple
str(factor_apple)


# Problem 27 
# Use expand.grid() to create a data frame d with 2 factors: factor a with levels a,b and factor b with levels a,b,c.

?expand.grid()
d <- expand.grid(a = letters[1:2], b=letters[1:3])
print(d)
str(d)


# does not work
d.1 <- data.frame(
  a = letters[1:3],
  b = letters[1:3]
)

d.1
str(d.1)

# not as factor
d.2 <- data.frame(
  a = c("a", "b", "c", "a", "b", "c"),
  b = c("a", "a", "b", "b", "c", "c")
)

d.2
str(d.2)

?data.frame


# string as factors
d.3 <- data.frame(
  a = c("a", "b", "c", "a", "b", "c"),
  b = c("a", "a", "b", "b", "c", "c"),
  stringsAsFactors = TRUE
  
)
d.3
str(d.3)



# string as factor
d.3 <- data.frame(
  a = factor(c("a", "b", "c", "a", "b", "c")),
  b = c("a", "a", "b", "b", "c", "c")
)
d.3
str(d.3)



#Problem 28
#Use $ to access variables in d.

print(d$a)
print(d$b)


d.3$a
d.3$b


# Problem 29
# Add a response variable y to d filled with random numbers. Check function nrow()!
# Check result with str(). Interpretation?

d <- expand.grid(a = letters[1:3], b=letters[1:6], y=rnorm(3))
# Or
d <- expand.grid(a = letters[1:3], b=letters[1:6])
d$y <- rnorm(nrow(d))
d

d
nrow(d)
str(d)

d
d$a
d[,2]
d[,]
d[1,]
d[1,3]
d[1:3,]
d[1:3,3]
d[1:3, "y"]



# Problem 30
# Use data frame d: Index all b’s in variable a where y ≥ 0. Use operator >= for
# greater or equal than and == for equal. How many b’s do you find?

j <- d$a =="b" & d$y >= 0
sum(j)
d[j,]
d$y[j]


i <- d$a == "b" & d$y <=0
sum(i)

d[i, ]
d$a[i]
d$b[i]
d$y[i]


# Problem 31
# Try function summary(d). Explain result.
summary(d)


# Problem 32
# Use function write.table(), read.csv(), read.csv2(). What are the differences?
# Try the functions with data frame d.

write.table(d, file="elnaz0.txt", row.names = FALSE, sep="\t")
write.table(d, file="elnaz00.txt", row.names = FALSE, sep=" ")

write.table(d, file="elnaz.csv",row.names = FALSE, sep=",")
write.csv(d, file="elnaz2.csv", row.names = FALSE) # just do not need to specify the sep=","
write.csv2(d, file="elnaz3.csv", row.names= FALSE) # this use sep=";" & , for decimal points

e00 <- read.table(file="elnaz00.txt")
e0 <- read.table(file="elnaz0.txt")
e2 <- read.csv(file = "elnaz2.csv")
e3 <- read.csv2(file = "elnaz3.csv") # very good for reading the files with ";" as seperators and , as dec

read.table(dec=",") 
read.delim() #dec= . 
read.delim2() #dec ,

#Problem 33
#R has a compact symbolic form to describe association between variables. See
#formula and help pages of lm() (linear model) and aov (analysis of variance). Try them!

lm()
aov()

# Problem 34
#Create two random number vectors x, y each with 20 values. Make a scatter-plot of
#x and y, and use different colors for y below and y above zero. Use the following R
#functions:
#  plot()
# ifelse()
# At least two color names.
# Function abline() to draw a horizontal line at 0.

set.seed(123)
y <- round(runif(20, min=-3, max=6), digits = 2)
x <- rpois(20, lambda = 5)

plot(x,y , col="orange", lwd=3 , xlab = "X Lab", ylab="Y lab", main="Scatter Plot")

i <- y <= 0
sum(i)
i
y[i]
y[!i]

plot(x,y , col= ifelse(i, "red", "green"), lwd=3 , xlab = "X Lab", ylab="Y lab", main="Scatter Plot")
plot(x,y , col= ifelse(i, "red", "green"), cex=ifelse(i, 1.5, 3), lwd=3 , xlab = "X Lab", ylab="Y lab", main="Scatter Plot") #cex --> shape size
plot(x,y , col= ifelse(i, "red", "green"), cex=ifelse(i, 1.5, 3), pch=ifelse(i, 20, 15), lwd=3 , xlab = "X Lab", ylab="Y lab", main="Scatter Plot") #pch --> shape type
abline(h=0, col="blue", lwd=3, lty=2) # H=0 mean horizetal line for 0, linewidth, line type
?legend
legend("bottomleft", #positin
       legend = c("below 0", "above 0"), # legend labels
       col=c("darkred", "darkgreen"), # color of the shapes in legends
       pch=c(20,15), # shapes for the legends or lwd
       bg="wheat", # bg color
       box.col = "wheat" # border color
        , inset = 0.02 # margin
       )



# Problem 35
# Add a legend to the plot: legend()


# Problem 36
# What are boxplots? Use data set iris to explore boxplots.

dataset(iris)

boxplot(Sepal.Length ~ Species, data=iris) # Notice to the ~ 
boxplot(iris$Sepal.Length)

op <- par(mfrow=c(1,2))
boxplot(iris$Sepal.Length)
boxplot(Sepal.Length ~ Species, data=iris, col=c(1:3)) # Notice to the ~

par(op)

# Problem 37
# Use package lattice to create more sophisticated plots.
# require() and library() both load the already installed packages but the require mostly used in the function to give the warnomng message instead of the error message
?require
require(lattice)
xyplot(Sepal.Length ~ Sepal.Width | Species, data=iris)

xyplot(Sepal.Length ~ Sepal.Width | Species, data=iris, type=c("p", "r"))

xyplot(Sepal.Length ~ Sepal.Width | Species, data=iris, type=c("p", "r"), panel = function(x,y,...) {
  panel.grid()
  panel.xyplot(x,y,...)
})


# Problem 38
# Additional: Install package ggplot2, use install.packages() or the menu. Create some graphics.

#install.packages("ggplot2")
library(ggplot2)

ggplot(data=iris, aes(x = Sepal.Length, y = Sepal.Width, col=Species)) +
  geom_point()+
  xlab("Sepal Length") + 
  ylab("Sepal Width") +
  ggtitle("Sepal Length-Width")


# Problem 39
# Use function aggregate() to compute the mean of y in data frame d for all levels of a and b.

d <- expand.grid(a=letters[1:2], b=letters[1:3])
d$y <- rnorm(nrow(d))
d

# In the aggregate function numeric like y comes first then seperate by ~ and group by categorical valuess, if we have some more add with +
aggregate(y ~ a+b , data=d, FUN=mean)


?ChickWeight
c <- ChickWeight
head(c)
str(c)
summary(c)
mean(c$weight)
aggregate(data = c, weight ~ Diet, mean)
aggregate(data= c, weight ~ Diet + Time, mean)


# Problem 40
# Do the same with function tapply(). Differences?

# results are same, just in the aggregate ---> data frame, tapply ---> array with dimention of the list
# aggrgate also have formula interface

tapply(d$y, list(d$a, d$b) , mean)
tapply(c$weight, list(c$Diet ,c$Time), mean)

# Problem 41
# Try programming new functions in R: function(). Program a function which takes
# a numeric vector as an argument and returns the mean and standard deviation of the vector.

summarize = function(x) {
  list(mean = mean(x), sd = sd(x))
}

summarize(1:10)


#Or

myfunc <- function(v){
  m = mean(v)
  s = sd(v)
  return(c("m"=m, "s"=s))
}

myfunc(1:10)


# Or

myfunc.1 <- function(v){
  return(c("m"=mean(v), "s"=sd(v)))
}

myfunc(1:10)

# clear the Global Enviroment right hand side
?rm
rm(list=ls())




# Problem 42
# R has several control structures, see ?Control. Try them.


for(i in 1:5)
print(1:i)


# Problem 43
# Use table(), xtabs() and ftable() to tabulate a and b in d. Differences?

d <- data.frame(
  gender = c(rep("F", times=5), rep("M", times=5)),
  weight= c(runif(10, min=45, max=101)),
  education = c(rep("bachelor", times=5), rep("master", times=5))
)
d

table(d$gender)
table(d$gender, d$education)


xtabs() #later check
ftable()  #later check


# Problem 44
# We use the builtin data set freeny for our first multiple regression. Model variable
# market.potential as a response of variable price.index and income.level. Build
# two models, one with main effects only, and one with the interaction of market.potential
# and price.index. Use:
# • data() to load builtin data sets.
# • lm() to compute linear models. Note: save the fitted objects in variables, e.g.
# m1 and m2.
# • Save your models in a varaible, so you can access the fits for later computations.
# • summary() to carry out summary statistics.
# • Use anova() to compare the twi regression models.
# • Interpretation?
?freeny
data(freeny)
head(freeny)
str(freeny)
summary(freeny)


# Main Effect
m1 <- lm (market.potential ~ price.index + income.level, data=freeny)
summary(m1)

# since the estimator for price is negative then it has a negative correlation by potentional
# one unit increase in price will 0.309 decrease the potentional

# for the income we have a positive correlation 
# one unit increase in income will 0.19 increase in potetional


# both are significant since the t-value is far from the 0 and the p value is less than 0.005
# we should reject the null-hypothesis and conclude there is dependency between y and x

# y is dependent variable , response
# x is independet variable , peredictor

# both R square and adjust- R are high and could explain the proportion of the variance , the model is good fitted
# std Error coeeficent is 0 so they do good under different samples
# standar error -> SDE, SDR, RMSE is also near 0 is good
# F-statistic check how the model is good for the population and atleast one pridictor is significant

# Interctation Effect
# the firat two line is main again
# the last line is interactiion
# it shows that also intercation is significant and we should consider it
# how the indivudual variables are associated with y
m2 <- lm (market.potential ~ price.index * income.level, data=freeny)
summary(m2)


anova(m1,m2)
aov(m1, m2) # does not work 
# model two is significant so we should use model 2




# Problem 45
# Function update() can be used to modify fitted models. Remove Variable price.index
# from your model with only main effects.

update(m1, . ~ . - price.index)





#===============================================Second Problem Sheet==========================================#
#=========>>>>>>     Problem One       <<<<<<==========#
#to Run ----> CTRL + Enter
# to clear ----> CRTL + L
getwd() 
setwd("~/Desktop/SRH_Classes_Second/Analytics_2/data") # Found through the Right hand side Files -> More: Set as Working Directory


# Loading Data & Checking the Structure of the data:
clinicdata <- read.table(file="ClinicalStudy.txt", header = TRUE, sep="\t") # Load data
nrow(clinicdata)
head(clinicdata)
str(clinicdata) # structure of the data

# Data Cleaning:
clinicdata$group <- as.factor(clinicdata$group)
clinicdata$sex <- as.factor(clinicdata$sex)
clinicdata$score <- gsub(",", ".", clinicdata$score)
clinicdata$score <- as.double(clinicdata$score) 

str(clinicdata)


# Descriptive Analysis:
summary(clinicdata)
mean(clinicdata$score)
median(clinicdata$score)

var(clinicdata$score)
sd(clinicdata$score)



# Boxplot
# Simple Boxplot on score only
boxplot(clinicdata$score)
boxplot(clinicdata$score, horizontal = TRUE, col = "orange", main="Score of the thropy", xlab="Range of the scores", notch = TRUE, border="brown")

# Complex Boxplot therapy effect along group and sex.
# install.packages("ggplot2")
library(ggplot2) # Turn on it

ggplot(data = clinicdata, 
       aes(x=group, y=score, col=group)) +
  geom_boxplot()+
  ggtitle("Score per Group")


ggplot(data = clinicdata,
       aes(x=sex, y=score, col=sex)) +
  geom_boxplot()+
  ggtitle("Scores per Sex")


# Inferential statistic 
# in linear regression we can do two things: Inferential or Prediction
# This is a Supervised learning since we have lables
# Xs are categorical/ Numeric --- Y is Numeric
# Null Hypothesis: There is not any dependency between x and y but here we can see both group1 and sex1 are significant
# Since they have low p-value and t-value is far from 0 but the sex group is more significant
# Intercept is mean of the y=score where all the values od Xs are equal to 0
# we can see just by adding one unit to group1 or sex1 as our Xs the y value will change for 6.9 or -17.78

# Linear Model
model1 <- lm(formula= score ~ . , data = clinicdata)
summary(model1)

model1.1 <- lm(formula = score ~ group + sex, data=clinicdata)
summary(model1.1)

#aov(model1.1)
summary(aov(model1.1))

model1.2 <- lm(formula = score ~ group * sex, data=clinicdata)
summary(model1.2)
#aov(model1.2)
summary(aov(model1.2))
# Intercept here is significant which tells, effect for the control group is significantly different from o


# ANOVA
model2 <- aov(formula= score ~ ., data = clinicdata)
model2

model3 <- aov(formula = score ~ group + sex , data=clinicdata)
summary(model3)

model4 <- aov(formula = score ~  group * sex, data=clinicdata)
summary(model4)

# There is not any difference between Analysis of Variance and Linear Model 
# Historically analysis of Variance is alittle bit older
# Anova is special kind of liner model
# Linear model gives information about each variable base on the intercept, Anova test one variable as a global factore

# you can use aov() directly on the linear function to get same results


#=========>>>>>>     Problem Two       <<<<<<==========#

gempl <- read.csv(file="germany_income.csv", header = TRUE)
head(gempl)
str(gempl)

# Cleaning Data: (Or in the importing just write stringasfactor=TRUE)
gempl$sex <- as.factor(gempl$sex)
gempl$race <- as.factor(gempl$race)
gempl$income <- as.factor(gempl$income)

str(gempl)


# Descriptive analysis

summary(gempl)
boxplot(gempl$age)
boxplot(gempl$fnlwgt)
boxplot(gempl$capital.gain)
boxplot(gempl$capital.loss)

# Age is nomerical and income is categorical --> Boxplot
library(ggplot2)
ggplot(data=gempl, mapping = aes(y=age, x=income, col=income))+
  geom_boxplot()+
  ggtitle("")

# Or simply do:
boxplot(age ~ income, data=gempl)

# one categorical
library(ggplot2)
ggplot(data=gempl, 
       aes(x=income, col=income, fill=income))+
  geom_bar()

# two categorical
ggplot(data=gempl,
       aes(x=income, fill=sex))+
  geom_bar(position = "dodge")

ggplot(data=gempl,
       aes(x=income, fill=race))+
  geom_bar(position = "dodge")


# Statistical Model
# Xs are categorical and numeric ---> Y is Categorical (Logistic Regresion and LDA)
# Use LDA: for smaller sample and normal distribution on classes and more than two response
# Both Logistic and LDA produce linear boundries

# Fitting the model
library(MASS)
ldamodel <- lda(data = gempl, income ~ .)
ldamodel
# because we have two level of factor of response here we have one LDA1 "Linear Discriminant Function"

# We have three response here:
# (1) Prior probabilities: reflects the probability of an observation to be in one group.
# (2) Group means: are the means of attributes in each group.
# (3) Coefficients: weights of the discriminant function, without intercept.

# Ploting the model
plot(ldamodel, type="both")
# If check the plot we can see in the middle there are some overlap this exactly that error about 20% which they are not correctly classified

# Prediction
p <- predict(ldamodel)
names(p)

#class gives the predicted classification of each observation
head(p$class)

# Add this prediction to the original data frame
gempl$pred_class <- p$class
head(gempl)

#posterior is a matrix with class-probabilities:
head(p$posterior)

#x is a matrix with discriminant values (here one discriminant function):= coefficent
head(p$x)
#If we had three group A, B, C then we have LD1 and LD2


################################# DO NOT NEED ###################################
# (1) Remove pred_class
names(gempl)
gempl <- gempl[, -8]

# Or from begining subset the data frame to do not make a new dataframe
# nd <- data.frame(age=c(), fnlwgt=c(), sex=c(), race=c(), capital.gain=c(), capital.loss=c=(), income=c())
gempl.train <- gempl[1:120, ]
gempl.test <- gempl[121:137,]
predict(ldamodel, newdata=nd)
################################# DO NOT NEED ###################################


table(p$class)
table(gempl$income)
table(observed= p$class, predicted= gempl$income)
library(caret)
confusionMatrix(p$class, gempl$income) #Underestimate the highr income level


#Accuracy
# Underestimate the higher income level
f <- table(observed= p$class, predicted= gempl$income)
round(sum(diag(f))/sum(f) *100, 2)


#=========>>>>>>     Problem Three       <<<<<<==========#

fuel <- read.csv(file = "automobile.csv", header = TRUE)
#?read.csv

head(fuel)
str(fuel)

# Data Cleaning
fuel$horsepower <- as.numeric(fuel$horsepower)
fuel$weight <- as.numeric(fuel$weight)
sum(is.na(fuel))
fuel[is.na(fuel)] <- 0 # replace na values by 0

# Descriptive Analysis

summary(fuel)
str(fuel)
cor(fuel[, 1:8])

par(mfrow=c(4,2))
?boxplot()
boxplot(fuel$mpg, xlab="mpg")
boxplot(fuel$cylinders, xlab="cylinders")
boxplot(fuel$displacement, xlab="displacement")
boxplot(fuel$horsepower, xlab="horsepower")
boxplot(fuel$weight, xlab="weight")
boxplot(fuel$acceleration, xlab="acceleration")
boxplot(fuel$model.year, xlab="model.year")
boxplot(fuel$origin, xlab="origin")




library(ggplot2)

ggplot(data=fuel,
       aes(y=cylinders))+
  geom_boxplot()

ggplot(data=fuel,
       aes(y=mpg))+
  geom_boxplot()


# Inference
# X(metric) ---> Y(metric)
nrow(fuel)
398*80/100

traindata <- fuel[1:318, ]
testdata <- fuel[319:398 ,]

# training the model
fuelmodel.1 <- lm(formula= mpg ~  cylinders + displacement + horsepower + weight + acceleration + model.year + origin , data=traindata)
summary(fuelmodel.1)

fuelmodel.2 <- lm(formula= mpg ~  displacement + weight +  model.year + origin , data=traindata)
summary(fuelmodel.2)

#Prediction
predict(object = fuelmodel.2, newdata = testdata)

#=========>>>>>>     Problem Four       <<<<<<==========#

oly <- read.csv("heptathlon.csv", header=TRUE)
head(oly)
str(oly)
oly$hurdles <- max(oly$hurdles) - oly$hurdles
oly$run200m <- max(oly$run200m) - oly$run200m
oly$run800m <- max(oly$run800m) - oly$run800m
head(oly)


olymodel.1 <- lm(formula = score ~ ., data = oly)
summary(olymodel.1)
colnames(oly)
cor(oly[, 1:7])

olymodel.2 <- lm(formula = score ~ hurdles + shot + javelin, data = oly)
summary(olymodel.2)

# Dimension Reduction by Principle Component
olymodel.3 <- prcomp(oly, 
                     center = TRUE, # Center means to zero
                     scale = TRUE   #Sets unit variance
                     )
summary(olymodel.3)
plot(olymodel.3)
olymodel.3 # See the correlation
predict(olymodel.3)
biplot(olymodel.3)




#===============================================Second Problem Sheet (Professor Solutions) ==========================================#
#=========>>>>>>     Problem One       <<<<<<==========#
getwd()
d <- read.table("ClinicalStudy.txt", head=TRUE, dec=",") #score decimal point is , but should be converted to . dec="," do this
## d.1 <- read.delim2("ClinicalStudy.txt", head=TRUE) Or use this
head(d)
str(d)

## Data Cleaning
d$group <- factor(d$group, labels=c("Control", "Intervention"))
# str(d$group)
# d$group
# table(d$group)
d$sex <- factor(d$sex, labels=c("Male", "Female"))

## descrivie statistics
summary(d) # Since mean < median Left Skewed

# first numeric ~ then categorical or others + each other
aggregate(score ~ group, data=d, FUN="mean")
aggregate(score ~ sex, data=d, FUN="mean")
aggregate(score ~ sex + group, data=d, FUN="mean")

aggregate(score ~ group, data=d, FUN="median")
aggregate(score ~ sex, data=d, FUN="median")
aggregate(score ~ sex + group, data=d, FUN="median")

aggregate(score ~ group, data=d, FUN="sd")
aggregate(score ~ sex, data=d, FUN="sd")
aggregate(score ~ sex + group, data=d, FUN="sd")

# Fitting the model
fit <- aov(score ~ group * sex, data=d)
summary(fit)

# visualization by boxplot
par(mfrow=c(1,2))
boxplot(score ~ group, data=d)
boxplot(score ~ sex, data=d)

# visualization by lattice
require(lattice)
p <- bwplot(score ~ group, data=d)
p
p <- bwplot(score ~ sex, data=d)
p
p <- bwplot(score ~ group | sex, data=d)
p
p <- bwplot(score ~ sex | group, data=d)
p

m <- xtabs(~group + sex, data=d)
m

# Or

table(d$group, d$sex)
# Confusion matrix is for prediction
# library(caret)
# confusionMatrix()

mosaicplot(m,shade=TRUE)

#=========>>>>>>     Problem Two       <<<<<<==========#
#getwd()
#setwd("..")
d2 <- read.csv("germany_income.csv", stringsAsFactors=TRUE)
head(d2)
str(d2)

summary(d2)

# fitting the model
fit <- glm(income ~ ., data=d2, family="binomial")
summary(fit)
# there are two significant variables age and sex


# get odds
exp(coef(fit))

# Confusion Matrix --> Only for classification

yh <- ifelse(predict(fit, type="response")<=.5, "<=50K", ">50K")
cm <- table(predicted=yh, observed=d2$income)
cm
## Correct classified (Accuracy)
?diag #قطر
sum(diag(cm))/sum(cm)

#library(caret)
#confusionMatrix(d2$income, yh) ???

## Effect of sex
m <- xtabs( ~ income+sex, data=d2)
m
mosaicplot(m, shade=TRUE)

## Effect of age
boxplot(age ~ income, data=d2, ylab="age")


### LDA
require(MASS)
fit.lda <- lda(income ~ ., data=d2)
fit.lda
plot(fit.lda)
levels(d2$race)
unique(as.numeric(d2$race))
fit.pred <- predict(fit.lda)
yh <- fit.pred$class
yh
cm <- table(predicted=yh, observed=d2$income)
cm
## Correct classified
sum(diag(cm))/sum(cm)




#=============================================== <<<<< Analytics Two >>>> ==========================================#

##### <<<<<<<<<<<<<<< Count Data/ Chiˆ2/ Loglm/ Mosaic Plot/ Decision Trees  >>>>>>>>>>>>>>> #####
#### Slide Examples Page 14:

# Define Products/ Fo:
products <- c(160, 66, 50)

# First Solution: Equally distributed H0: means of all are equal(Like Anova):
chisq.test(products)
# X-squared = 76.783, df = 2, p-value < 2.2e-16 >>> Significant different 
# Reject H0


# Second Solution: Distribution assumption: A: 60%, B:20%, C:20%
ct <- chisq.test(products, p=c(.6, .2, .2))
ct
# X-squared = 2.7923, df = 2, p-value = 0.2476 >>> Not significantly different
# Accept H0 

str(ct)


# Third Solution: Contingency table:
new.products <- matrix(data=c(70, 80, 50, 50, 10, 40), nrow = 2, ncol = 3, byrow = TRUE, dimnames = list(c("red", "green"), LETTERS[1:3]))
new.products

# Or better to do:
# Because in the loglm we need the dimensions names as well
new.products.ex <- matrix(data=c(70, 80, 50, 50, 10, 40), nrow = 2, ncol = 3, byrow = TRUE, dimnames = list(color = c("red", "green"), product= LETTERS[1:3]))
new.products.ex


ct.1 <- chisq.test(new.products)
ct.1
str(ct.1)
ct.1$expected
ct.1$p.value

# Result:
# data:  new.products
# X-squared = 28.75, df = 2, p-value = 5.715e-07


# Third.a: Alternative way to calculate the Chi^2

class(new.products) <- c("xtabs", "table")
summary(new.products)

# Result:
# Number of factors: 2 
# Test for independence of all factors:
# Chisq = 28.75, df = 2, p-value = 5.715e-07

# Third.b: loglm
dimnames(new.products) <- list(color = rownames(new.products), product = colnames(new.products))
rownames(new.products)
colnames(new.products)
dimnames(new.products)

require(MASS)

loglm(~ color + product, data=new.products)


# loglm(formula = ~color + product, data = new.products)

# Statistics:
#  X^2 df     P(> X^2)
# Likelihood Ratio 32.45926  2 8.944624e-08
# Pearson          28.75000  2 5.715008e-07




# Plotting:
# For the observed ones:
mosaicplot(new.products, shade = TRUE)

# Advanced Mosaei Plot:
#install.packages("vcd")
require(vcd, quietly = TRUE )
mosaic(new.products, shade=TRUE)



##### <<<<<<<<<<<<<<< Data Mining  >>>>>>>>>>>>>>> #####
#### Data Mining Slides (Page 42) for shaping the Normal Distribution
mean <- 0
sd <- 1
lb<- -2
ub <- 2

# length: number of dots
x <- seq(-4,4, length=1000)*sd + mean
# https://seankross.com/notes/dpqr/
#?dnorm()
hx <- dnorm(x, mean, sd)
plot(x, hx, xlab="SDS (z-values)", ylab="Density", main="Normal distribution", axes=TRUE)

i <- x >= lb & x <= ub
lines(x, hx)


polygon( c(lb, x[i], ub), c(0, hx[i], 0), col="lightblue")
area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
result <- paste("P(",lb,"< z <",ub,") =", signif(area, digits=3))
mtext(result,3)


#### Data Mining Slides (Page 44) Z-Transformation/ SDS: Standard Deviation scores/ if do not devide by sd: Mean Centering
z <- c(1.0, 2.0, 3.0, 4.0, 1.0, 2.0, 3.0)
scale(z)
# We normalazed all our variables
# attr(,"scaled:center") ---> Mean of our variables
# attr(,"scaled:scale") ---> Standard deviation of our variables


#### Data Mining Slides (Page 46) Z-Transformation/ SDS: Standard Deviation scores/ if do not devide by sd: Mean Centering

########### Transformed + mean Transformed + z-transformed (SDS) ###############
# Easy Solution:
mtcars
car <- mtcars
head(car)
str(car)

m <- lm(formula= mpg ~ disp + wt ,data = car)
summary(m)

m.wt <- scale(car$wt, center = TRUE, scale = FALSE)
m.disp <- scale(car$disp, center = TRUE, scale = FALSE)
m.m <- lm(formula= mpg ~ m.disp + m.wt ,data = car)
summary(m.m)


mz.wt <- scale(car$wt)
mz.disp <- scale(car$disp)
mz.m <- lm(formula= mpg ~ mz.disp + mz.wt ,data = car)
summary(mz.m)

################################################################################


# >>> (1) unTransformed Model:
mtcars
names(mtcars)
model.1 <- lm(formula = mpg ~ disp + wt, data= mtcars )
summary(model.1)

# With catching the required variables -> No Differences
d <- mtcars[, c("mpg", "disp", "wt")]
model.2 <- lm(formula = mpg ~ . , data= d)
summary(model.2)

# Interpret:
# Only weight here is significant, there is a negative correlation between weight and mpg, One unit increase in wight will decrease 3.35 unit in mpg
# Intercept is the mean if all the predictors are 0
# R-squared: Explain 80% of the variance of the response



# >>> (2) Mean Centering Model:
# using the d 
# we want to work only on predictors to make them only mean centering
head(d)
?scale
# scale(x, center = TRUE, scale = TRUE)
# if we put - before index of the column we exclude it
d.mc <- data.frame(mpg=d[,1], scale(d[,-1], scale = FALSE))
model.3 <- lm(mpg ~ ., data=as.data.frame(d.mc))
# model.3 <- lm(formula = mpg ~ . , data= d.mc)
summary(model.3)
# Interprete:
# the only changes here is Intercept




# >>> (3) Z-Transformed:
d.z <- data.frame(mpg=d[,1], scale(d[,-1]))
model.4 <- lm(formula = mpg ~ ., data= d.z)
summary(model.4)
# Interprete:
# Both Intercept & scale of the variables is changed here
# Now we can directly compare our predictor variables



#### Data Mining Slides (Page 53) Softmax

softmax <- function(x) {
  res <- exp(x) / sum(exp(x))
  return(res)
}

z <- c(1.0, 2.0, 3.0, 4.0, 1.0, 2.0, 3.0)
round(softmax(z), 5)



#### Data Mining Slides (Page 57) Shape 

number_of_cycles = 2
max_y = 40
x = 1:500
a = number_of_cycles * 2*pi/length(x)
y = max_y * sin(x*a)
noise1 = max_y * 1/10 * sin(x*a*10)
y <- y + noise1
plot(x, y, type="l", lwd = 2, col = "darkblue")
## Filter
library(signal)
bf <- butter(2, 1/50, type="low")
b1 <- filtfilt(bf, y)
lines(x, b1, col="red", pch=20, lwd=1)



#### Data Mining Slides (Page 60) Shape 
plot(dist ~ speed, cars)
## see also function loess()!
cars.lo <- lowess( cars$speed, cars$dist)
lines(cars.lo, col="dodgerblue4")


#### Data Mining Slides (Page 65) Shape 
str(mpg)
require(ggplot2) ## load 'mpg' data set
boxplot(hwy ~ class, data=mpg)
# :( boxplot( mpg$class, mpg$hwy) Only one variable was possible

# Same result
# mpg$class <- factor(mpg$class)
# str(mpg)
# require(ggplot2)
# boxplot(hwy ~ class, data=mpg)


#### Data Mining Slides (Page 68) Shape 
require(lattice)
p <- bwplot(hwy ~ class, data=mpg)
p

#### Data Mining Slides (Page 69) Shape 
require(ggplot2)
p <- ggplot(mpg, aes(class, hwy))
p + geom_boxplot()
head(mpg)

#### Data Mining Slides (Page 72) Shape
# install.packages(latticeExtra)
require(latticeExtra)
p <- xyplot(cty ~ displ | drv, data=mpg,
            panel=function(x,y, ...) {
              panel.grid(h=-1, v=-1)
              panel.xyplot(x,y,...)
              panel.lmline(x,y,col="red", ...)
              panel.smoother(x,y, col="darkblue", ...)
            })
p


#### Data Mining Slides (Page 74) Shape
require(ggplot2)
p <- ggplot(mpg, aes(displ, cty)) + geom_point()
p + facet_grid(drv ~ .) + geom_smooth()




###<<<<< PART (3) - Introduction to Decision Trees >>>> ###

# Page 103

d <- data.frame(price=c(10:15, 17.5, 18, 18.5, 19, 21:25, 28:31,31),
                score=c(10,10,10,10,13,20,35,44,52,55,80,83,80,83,85,100,100,100,100,100)
                )

plot(score ~ price, data=d, pch=19, col="blue")

################As an example for only the first index ####################
d
# in the colomn score
d$score # H
d$score[1]
# in the data farame 
d[2] # V
d[,2] #same with d$score # H

d$score[-1] # all other except the first one
d$score[1:5]

# From Here:
R1 <- mean(d$score[1])
R2 <- mean(d$score[-1])
R1
R2

RSS <- sum(c((d$score[1] - R1)^2, (d$score[-1] - R2)^2))
RSS
################# We have to do this for all 20 observation #################
# >>>>>>>>>>>>>>>> RSS Model:
?pmin

RSS <- c()
for(i in 1:nrow(d)) {
  R1 <- mean(d$score[1:i])
  i2 <- pmin((i+1),nrow(d))
  R2 <- mean(d$score[i2:nrow(d)])
  RSS <- c(RSS, sum(c((d$score[1:i] - R1)^2, (d$score[i2:nrow(d)] - R2)^2)))
}
RSS
# the lowest RSS is : 3961.800

plot(RSS, type="b", col="darkred", lwd=2) # b is for both:lines + points

# Get the index for the price
c("min RSS"=min(RSS), "index"=which.min(RSS), "price at index"=d$price[which.min(RSS)])


# Plotting with additional information
plot(score ~ price, data=d, pch=19, col="blue")
i <- which.min(RSS)
abline(h=d$score[i], v=d$price[i], lty=2)
text(x=c(15,20), y=c(50,60), labels=paste("Part", 1:2), pos=4, col="red")


#>>>>>>>>>>>>>>>>>>> CART MODEL:
# First example with rpart:
library(rpart)
cart <- rpart(score ~ price, data=d)
cart


plot(cart)
text(cart, cex=1.2)

# Second example with rpart:
cart <- rpart(Ozone ~ ., data=airquality)
plot(cart)
text(cart)

# See the Complexity Parameter
printcp(cart)
plotcp(cart)

# Pruning:
cart.p <- prune(cart, cp=.065)
plot(cart.p)
text(cart.p)

# Different plots ( Get more information with lowest number of codes)
#install.packages("rpart.plot")
require(rpart.plot)
rpart.plot(cart.p)

# if you want to put lables above the nodes
rpart.plot(cart.p,type=1)

# See the Decision Rules:
rpart.rules(cart.p)

# A Modern Visualization
# install.packages("partykit")
require(partykit)
plot(as.party(cart.p))


#>>>>>>>>>> Random Farest:

require(partykit)
airq <- subset(airquality, !is.na(Ozone))
set.seed(5)
i <- sample(1:nrow(airq), 100)
train <- airq[i,]
test <- airq[-i, ]

?predict
## Random Forest with training set
fit.rf <- cforest(Ozone ~ ., data=train)
pred <- cbind(##
  ## Random Forest
  RF=predict(fit.rf, newdata=test, type="response"),
  ## pruned CART model
  CART=predict(cart.p, newdata=test))

pred

# Simple Statostic:
dstat <- function(x) {
  return(c(mean=mean(x),
           sd=sd(x),
           med=median(x)))
}
apply(pred, 2, FUN="dstat")

# Histogram:
par(mfrow=c(1,2))

hist(pred[,1], main="Random Forest", col="darkgreen",
     xlab="Predic ted Ozone", ylim=c(0,10))

hist(pred[,2], main="CART", col="brown",
     xlab="Predicted Ozone")


varimp(fit.rf)


# Unbiased recursive partitioning
require(partykit)
airq <- subset(airquality, !is.na(Ozone))
airct <- ctree(Ozone ~ ., data = airq)
plot(airct)





# Model based recursive partitioning
data("PimaIndiansDiabetes", package = "mlbench") # Datensatz
require(partykit)
fit <- glmtree(diabetes ~ glucose | pregnant + pressure +
                 triceps + insulin + mass + pedigree + age,
               data = PimaIndiansDiabetes, family = binomial)

plot(fit)
print(fit)
print(fit, node=1)





#>>>>>>>>>>Extra Information about logistic Regression
# Read Directly from Internet and save it
d <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
write.table(d, file="binary.csv", sep=",", row.names=FALSE)

getwd()
d <- read.csv("binary.csv")
head(d)
str(d)

d$admitf <- factor(d$admit)
d$rank <- factor(d$rank)
str(d)

# Wrong solution with linear regression
fit.lm <- lm(admit ~ gre, data=d)
summary(fit.lm)

# Plot the linear regression
plot(admit ~ gre, data=d, pch=16, col="blue")
abline(fit.lm, col="gray", lwd=2)
points(d$gre, fitted(fit.lm), col="red")

# Correct Solution with Logistic Regression but this is not factorized ! Not recommended
fit.lr <- glm(admit ~ gre, data=d, family="binomial")
summary(fit.lr)



# Do not need for practical exam
# lf <- function(x) 1 / (1 + exp(-x))
# curve(lf, from=-5, to=5, xlab="Logits (z)", ylab="Probability")
# abline(h=c(0,.5,1), col="gray", lty=2)
# text(-3,.6, "prob > .5: response = 1 or true")
# text(-3,.4, expression(paste("prob", phantom()<=phantom(), ". 5: response = 0 or false")))



# Do not need for practical exam
# logf <- function(b0=0, b1=1, r=c(-10,10)) {
# r <- seq(r[1],r[2] ,length=100)
#  z <- b0 + b1*r
#  lf <- 1 / (1 + exp(-z))
#  m <- paste("b[0] == ", b0, ", b[1] == ", b1)
#  plot(r,lf, type="l",
#       xlab="logit (z)",
#       ylab="Probability",
#       main=substitute(list(list(beta[0] == b0), list(beta[1] == b1)),
#                       list(b0=b0, b1=b1)),
#       ylim=c(0,1), col="orange")
#  abline(h=.5,col="gray", lty=2)
# abline(v=0,col="gray", lty=2)
# }



###logf(lf)

# Correct Solution (Factorized)
fit.lr <- glm(admitf ~ gre, data=d, family=binomial)
fit.lr
summary(fit.lr)

# Compute OR (Odds Ratio)
exp(coef(fit.lr))

# Confident limits with OR
exp(confint(fit.lr))

# Fitted probabilities from model:
# with head() we can see only first six values
?fitted
head(fitted(fit.lr))

# Make new predictions:
# New data:
nd <- data.frame(gre=c(200,566,700, 880))

# Prediction (Fisrt Way)
# Predict z-score (link-scale)
z <- predict(fit.lr, newdata=nd)
z
# Transform z to probability
lf(z)


# Prediction (Second & Better Way)
predict(fit.lr, newdata=nd, type="response")


# Confusion Matrix:
## convert probability to '0' and '1' -> because in the response we also have only 0 & 1
yh <- ifelse(fitted(fit.lr) <= .5, "0", "1")
f <- table(Observed=d$admitf, Predicted=yh)
f

# Correct Classified:
f[1]/sum(f)


# Function update for our linear model Ozone data (Not related to Logistic)
fit <- lm(Ozone ~ ., data=airquality)
update(fit, . ~ . -Day)
update(fit, . ~ 1)


# Rˆ2 Paolo
head(d)
str(d)
# cannot use . because admit is there
fit.lr.e <- glm(admitf ~ gre + gpa + rank, data=d, family=binomial)
summary(fit.lr.e)

# Odds / extract the coefficents
cbind("Estimates"=exp(coef(fit.lr.e)), exp(confint(fit.lr.e)))
# increasing the gre and gpa increase the chance of getting the admission
# but for the rank which is below the 0 decrease the getting the admission


# Confusion Matrix:
yh <- factor(ifelse(fitted(fit.lr.e) <= .5, "0", "1"))
f <- table(Observed=d$admitf, Predicted=yh)
f

sum(diag(f))/sum(f)


# install.packages("DescTools")
library(DescTools)
PseudoR2(fit.lr.e, which="McFadden")
PseudoR2(fit.lr.e, which="Nagelkerke")
PseudoR2(fit.lr.e, which="CoxSnell")

# Solution
getpRs <- function(x) {
  stopifnot(inherits(x, "glm"))
  LLv <- logLik(x)
  nullmod <- update(x, . ~ 1)
  LL0 <- logLik(nullmod)
  ## Mac Fadden
  MF <- 1 - (LLv/LL0)
  ## Cox & Snell
  CS <- 1 - (exp(LL0)/exp(LLv))^(2/nrow(x$data))
  ## Nagelkerke
  Rmax <- 1 - exp(LL0)^(2/nrow(x$data))
  return(c("MacFadden"=MF,
           "CoxSnell"=CS,
           "Nagelkerke"=CS/Rmax))
}
getpRs(fit.lr.e)


## get fitted values
yh <- fitted(fit.lr.e)
## get logits z, then plot
z <- predict(fit.lr.e, type="link")
i <- order(yh)
plot(z[i], yh[i], ylim=c(0,1),
     xlab="logit", ylab="Predicted probability")
abline(h=c(0,1), lty=2)



yh <- factor(ifelse(fitted(fit.lr.e) <= .5, "0", "1"))
f <- table(Observed=d$admitf, Predicted=yh)
f


sum(diag(f))/sum(f)


## computes measures for a confusion matrix
## obs ca be also a matrix
cmm <- function(obs, pred=NULL) {
  f <- NULL
  if(is.matrix(obs)) {
    f <- obs
  }
  if(is.factor(obs) & is.factor(pred)) {
    f <- table(observed=obs, predicted=pred)
  }
  stopifnot(!is.null(f))
  acc <- sum(diag(f))/sum(f)
  prec <- f[1,1]/sum(f[1,])
  recall <- f[1,1]/sum(f[,1])
  fscore <- 2/( (1/recall) + (1/prec))
  list("matrix"=f,
       "measures"=c("accuracy"=acc,
                    "precision"=prec,
                    "recall"=recall,
                    "F-score"=fscore)
  )
}

cmm(obs=d$admitf, pred=yh)
cmm(f)


library(caret)
confusionMatrix(d$admitf, yh) #Underestimate the highr income level
# Practical
## Linear & Regression From Analytics 1 -> No LDA
## Chiˆ2 & Binary Trees From Analytics2 

#Theory
## Slides - Chi˜2 & Data Mining & tree Methods -> No Formula, No Analytics 1

##### <<<<<<<<<<<<<<< Work Sheet Analytics 2  >>>>>>>>>>>>>>> #####

#>>>>>>>>>>>>>>>>>>>>>>>>> Problem One:

require(mlbench)
?housing
# sat: Satisfaction (High, Medium or Low, ordered factor)
# Perceived degree of influence householders have on the management of the property (High, Medium, Low)
# Type of rental accommodation, (Tower, Atrium, Apartment, Terrace).
# Contact residents are afforded with other residents, (Low, High).

getwd()
# ~ means: /Users/dehkharghanielnaz/
# setwd("~/Desktop/SRH_Classes_Second/Analytics_2/data")

d <- read.csv("housing2.csv")
head(d)
str(d)

# All of them have lables --> they are mot 0, 1 to change labels, Here we change the levels to make ot organized

# Data cleaning:
table(d$Sat)
d$Sat <- factor(d$Sat, levels = c("Low", "Medium", "High")) # This is better since make it in order
table(d$Sat)
str(d)

f <- xtabs(~ Sat + Type + Cont, data=d)
f
# Or
# table(d$Sat, d$Type, d$Cont)

## chi^2 analysis
summary(f)
# chisq.test(f) not possible in the summary we saw Chisq

require(vcd)
## Note: vcd uses p-value from likelihood ratio test
mosaic(f, shade=TRUE)
# mosaicplot(f, shade=TRUE)

################ There is not any difference here: Results are same ! convert character to string without losing any information
# d.1$Sat <- as.factor(d.1$Sat)
# d.1$Type <- as.factor(d.1$Type)
# d.1$Cont <- as.factor(d.1$Cont)

# str(d.1)  
# f.1 <- xtabs(~ Sat + Type + Cont, data=d.1)
# f.1
################





#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Problem Two:
?paste
?grep 
?gsub
?substr
?strsplit
?as.Date

getwd()
d <- read.csv("Data_to_clean.csv", header = TRUE)
head(d)
str(d)
table(d$sex)

# data cleaning
# Sex:
d$sex <- tolower(d$sex)
help.search("white space")
d$sex <- trimws(d$sex)
d$sex <- replace(d$sex, d$sex=="f", "female")
# df$sex[df$sex == "f"] <- "female"
d$sex <- factor(d$sex)
str(d)
table(d$sex)

# Date: (Now it is correct)
# d$date <- as.Date(d$date) # Produce na values
## date
## already ISO-Dates
date <- as.Date(d$date) # Create a new variable date with na values
## conversion failed
i <- is.na(date) # Since we change the date format some of them now are in na format, we put all these na values in a i
head(d$date[i]) # with i we found the index of the all date values which will convert to na values, we get head to see their formats
date[i] <- as.Date(d$date[i], format="%d.%m.%Y") # now we change all these date to as.date by their real format
d$date2 <- date
str(d)
summary(d)

# Paolo solved in correct way:

#tail(d$date)
#d$date <- as.character(d$date)
# yyyy-mm-dd & dd.mm.yyyy
#d$date2 <- ifelse(grepl("-", d$date) == TRUE, d$date, as.character(format(strptime(d$date, "%d.%m.%Y"), "%Y-%m-%d"))) 
#d$date2 <- as.Date(d$date2, format="%Y-%m-%d")
#tail(d$date2)

# extrem value = mean +/- 1.5*SD
## Feature 2

boxplot(d$feature1)
boxplot(d$feature2)
boxplot(d$feature3)
boxplot(d$feature4)

boxplot(feature1 ~ sex, data = d) # eli
aggregate(feature1 ~ sex, data=d ,FUN="mean") # eli
str(d)

# Filter 1: extreme value = mean +/- 1.5 standard deviation.
i1 <- (d$feature2 <= (mean(d$feature2) - 1.5 * sd(d$feature2))) |+ (d$feature2 >= (mean(d$feature2) + 1.5 * sd(d$feature2)))
table(i1)

## Feature2
# Filter 2: extreme value: value is above 98th percentile.
?quantile
i2 <- d$feature2 > quantile(d$feature2, q=.98)
table(i2) # surpirse!

hist(d$feature2)


## shapiro.test were not discussed
## shapiro.test(d$feature1)
## hist(d$feature1)
## shapiro.test(d$feature2)
## ## alternative
## sapply(d, function(x) {
## if(is.numeric(x))
## shapiro.test(x)
## })


#### Problem Three -> See the professor solutions:

credit <- read.csv("credit.csv", header = TRUE)
head(credit)
str(credit)

# Data Cleaning
credit$income <- as.double(credit$income)
credit$car <- as.factor(credit$car)

table(credit$creditworthy)

credit$creditworthy <- ifelse(credit$creditworthy =="yes",1,0)
credit$creditworthy <- as.factor(credit$creditworthy)
str(credit)


# The problem is classification
# Y is categorized in two levels so logistic regression
set.seed(1)
model <- glm( formula = creditworthy ~ . , data = credit,family="binomial") 
summary(model)


# get odds
exp(coef(fit))

colnames(credit)

# Prediction
new.data <- data.frame(
  age=as.integer(c(41, 43)) ,
  income = c(2500, 5000),
  children = as.integer(c(1,3)),
  car = as.factor(c(1,1))
  )

str(new.data)

fitLog1 <- ifelse(predict(model, type="response")<=.5, 1, 0)
fitLog1


#####>>>> Professor Solution For problem three:

# Make dataframe with new observations:

nd <- data.frame(age=c(41, 43), income=c(2500, 5000), children=c(1, 3), car=c(1, 1))

# Load data
d <- read.csv("credit.csv")
# cast
d$creditworthy <- factor(d$creditworthy)

## (1) logistic regression
fit.lr <- glm(creditworthy ~ ., data=d, family="binomial")
summary(fit.lr)
# boxplot(fit.lr$residuals)
print("Prediction with new cases")
predict(fit.lr, newdata=nd, type="response")

## (2) CART
require(rpart)
fit.cart <- rpart(creditworthy ~ ., data=d)
fit.cart

# Old Design
plot(fit.cart)
text(fit.cart)

# Modern Design
require(partykit)
plot(as.party(fit.cart))


## (3-4) LDA + variable selection
library(klaR)
library(MASS)
fit.gw <- greedy.wilks(creditworthy ~ . , data=d)
fit.gw

fit.lda <- lda(fit.gw$formula, data=d)


## (5) you can also try a CART
# Tree with party

library(partykit)
fit.t <- ctree(creditworthy ~ ., data=d)
plot(fit.t)
fit.t


p.lr <- predict(fit.lr, newdata=nd, type="response")
print("logistic regression")
p.lr

print("CART")
p.cart <- predict(fit.cart, newdata=nd)
p.cart

print("LDA with greedy")
p.gw <- predict(fit.lda, newdata=nd)$class
p.gw

print("unbiased recursive partitioning")
p.t <- predict(fit.t, newdata=nd, type="response")
p.t



#####
x <- LETTERS[1:4]
x
class(x)
str(x)


xf <- factor(x)
xf # Alpha numerecally order when you do not specify anything

?factor
# labels = levels

xf2 <- factor(x, levels = c("B", "A", "C", "D"))
xf2


xf2 <- factor(x, levels = c("B", "A", "C", "D"), labels=paste("L", 1:4))
xf2
