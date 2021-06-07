#LDA in R
d <- read.csv2("/Users/dehkharghanielnaz/Desktop/SRH Classes/Analytics 1/Slides/R Files/lda_ex.csv")
d <- lda_ex 
head(d)

#Group is dependent, others are independent

## for this eaxample we use only two groups! 
d <- subset(d, group != "C")
d <- droplevels(d) #alaki homework
table(d$group)


#The function droplevels is used to drop unused levels from a factor or, more commonly, from factors in a data frame.

str(d)

## Fitting the model
# chaeck the MASS function
fit <- lda(group ~ ., data=d) 
fit

# if there was 3 groups probabiloty will be 0.35 for each one

# Prior probabilities reflects the probability of an observation to be in one group.
# Group means are the means of attributes in each group.
# Coefficients ... weights of the discriminant function, without intercept.

plot(fit, type="both")

## Use of predict function
p <- predict(fit) 
names(p)

#class gives the predicted classification of each observation
head(p$class)

#d$pred_class <- p$class
#head(d)

#posterior is a matrix with class-probabilities:
head(p$posterior)

#x is a matrix with discriminant values (here one discriminant function):
head(p$x)
#If we had three group A, B, C then we have LD1 and LD2

# New datga prediction

## create a dataframe with new cases
nd <- data.frame(security=c(6, 5, 10), ecology=c(8, 5, 10), innovation=c(7, 6, 10), prestige=c(8, 5, 10))
#6,8,7,8 belongs to class A
#5,5,6,5 belongs to class B
#10,10,10,10 belongs to class A

## use argument 'newdata' to transfer new data
predict(fit, newdata=nd)

#confusion matrix
p <- predict(fit)
f <- table(Observed=d$group, Predicted=p$class) 
f

#Accuracy
round(sum(diag(f))/sum(f) *100, 2)
#Extract or replace the diagonal of a matrix, or construct a diagonal matrix.



### Importance of variables
#greedy algorithm which performs step-wise forward variable selection. (in Analytics 2 )
#install.packages("klaR")
library(klaR)

fit.gw <- greedy.wilks(group ~ ., data=d, niveau = .10) # this says which variables are important
fit.gw

#it should countain 
#Formula containing included variables: 
#group ~ prestige + security + ecology + innovation
#consider for that new column that you created now it is in #

#niveau is the significance level for Wilk’s Λ. Default = 0.2.

# Fitting lda
fit2 <- lda(fit.gw$formula, data=d) 
fit2








################################## EXAM  #######################################
# Why LDA: 1. Smaller sample 2. Multiple response classes (Multivarieate Normal density) 3. Well seperated classes
# LDA : name? Linear and seperated classes
# Wight of the p variable
# model with Gausion (Mean, Standard deviation, Pi (proportion of training observation that belong to class))

# LDA , Logostic both have linear boundary --- when good normal distribution LDA better
# QDA: a little not linner boundary -- when variance classes are not same
# KNN: complicated boundary -- do not give information about coefficents (Non-parametric)

# Assumption: 1. samples are random 2. class are normal distributed by common variance
# goal: maximize the distance from mean of the each class
d <- lda_ex 
head(d)

#Group is dependent, others are independent
table(d$group)

# for this eaxample we use only two groups! 
d <- subset(d, group != "C")
table(d$group)
str(d)

# Fitting the model
# check the MASS function
fit <- lda(group ~ ., data=d) 
fit
summary(fit)

# Prior probabilities: reflects the probability of an observation to be in one group.
# 2 groups probability to classifcate in them each one is 0.5
# 3 groups probability will be 0.35 for each one

# Group means: are the means of attributes in each group.
# Coefficients: weights of the discriminant function, without intercept.

plot(fit, type="both")

## Use of predict function
p <- predict(fit) 
names(p)

#class gives the predicted classification of each observation
head(p$class)

#d$pred_class <- p$class
#head(d)

#posterior is a matrix with class-probabilities:
head(p$posterior)

#x is a matrix with discriminant values (here one discriminant function):= coefficent
head(p$x)
#If we had three group A, B, C then we have LD1 and LD2

# New datga prediction

## create a dataframe with new cases
# ***without new data also work ***
nd <- data.frame(security=c(6, 5, 10), ecology=c(8, 5, 10), innovation=c(7, 6, 10), prestige=c(8, 5, 10))
#6,8,7,8 belongs to class A
#5,5,6,5 belongs to class B
#10,10,10,10 belongs to class A

## use argument 'newdata' to transfer new data
predict(fit, newdata=nd)
p <- predict(fit) # add this then make confusion matrix

#confusion matrix
f <- table(Observed=d$group, Predicted=p$class) 
f

#Accuracy
round(sum(diag(f))/sum(f) *100, 2)
#Extract or replace the diagonal of a matrix, or construct a diagonal matrix.







