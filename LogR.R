# Logistic Regression

# Installing packages and Libraries
#install.packages("fmsb")
#install.packages("pROC")
#install.packages("caret")
library(caret)
library(fmsb)
library(MASS)
library(plyr)
library(ggplot2)
library(data.table)
library(sqldf)
library(dplyr)
library(pROC)

# Loading the dataset
getwd()
data <- read.csv("/Users/dehkharghanielnaz/Desktop/SRH Classes/Analytics 1/Slides/R Files/Default.csv")
data <- Default

# Dataset summary
names(data)
head(data)
summary(data)
str(data)

table(data$default)
table(data$student)

# Data Imputation
data$default_N <- ifelse(data$default=="Yes",1,0)
data$student_N <- ifelse(data$student=="Yes",1,0)

str(data)

data$default_N<-as.factor(data$default_N)

str(data)
table(data$default_N)
#Important
#for deciding that which variables should be consider for fitting we should see the corrolation
cor(as.numeric(data$default_N), data$student_N)
cor(as.numeric(data$default_N), data$income)
cor(as.numeric(data$default_N), data$balance)

#corrolation:

#between (-1,1)
#+ and - show the direction of the corrolation
# 0 means there is no corrolation
# close to 1 or -1 is better corrolated
# 0-0.25, 0.25-0.5, 0.5-0.75, 0.75-1  ---> Negligable, week, intermediate , high
#positivly corrolated
#negativly corrolated
# Building a logistic regression model


#fit <- glm(default_N ~ balance+income, data=data,family="binomial")

#fit <- glm(default_N ~ ., data=data, family="binomial")

fit <- glm(default_N ~ student_N+balance+income, data=data,
           family="binomial")  


#you have to explain why you chosen the family="binomial" it use logit()
#linear was lm , for Anova was onv?
#if you put . it cosider all the column, I took an screenshot
summary(fit)

# Estimating probability

prob <- predict(fit,type="response",data) 
data$prob <- prob
#data$prob=predict(fit,type=c("response"),data) 
#there is not any difference between two lines
#Here we made a new column prob

head(data)

library(caret)
confusionMatrix(table(data = as.numeric(prob>0.5), reference = data$default_N))
#compare the output and the original data with confusion matrix

#TP TN
#FP FN

# Prediction / before was classification
#x <- data.frame(balance = 80, income = 10000) #it gave it error because we do not have student_N
x <- data.frame(student_N=1 ,balance = 80, income = 10000)
p<- predict(fit,x)
p

# ROC curve
head(data)
names(data)
str(data)

#data1 <- data

#head(data1)
library(pROC)
library(MASS)
g1 <- roc(as.numeric(as.character(data$default_N)), data$prob)

print(plot(g1))

print(coords(g1, "best"))
#data$prediction=ifelse(prob>=coords(g1, "best")[1],1,0)

#table(data$prediction,data$default_N)

nrow(data)
View(data)
write.csv(data,"completedata.csv")
getwd()

############################### DEFAULT LOGISTIC REGRESSION EXAM ####################
# Responce is categorical = dichocastic
# Function Logistic Regression S curve --> Goal Maximumlikelihood
# Evalustion: BenchMarch + Confusion Matrix (Need Cut-off 0.5) ROC Curve near 1 

library(caret)
library(MASS)
library(plyr)
library(ggplot2)
library(pROC)

# Loading the dataset
#getwd()
#data <- read.csv("/Users/dehkharghanielnaz/Desktop/SRH Classes/Analytics 1/Slides/R Files/Default.csv")
data <- Default

# Dataset summary
head(data)
table(data$default)
names(data)
summary(data)
str(data)

table(data$default)
table(data$student)

# Data Imputation
data$default_N <- ifelse(data$default=="Yes",1,0)
data$student_N <- ifelse(data$student=="Yes",1,0)

str(data)

data$default_N<-as.factor(data$default_N)

str(data)
table(data$default_N)
#Important
#for deciding that which variables should be consider for fitting we should see the corrolation
cor(as.numeric(data$default_N), data$student_N)
cor(as.numeric(data$default_N), data$income)
cor(as.numeric(data$default_N), data$balance)
# 0-0.25, 0.25-0.5, 0.5-0.75, 0.75-1  ---> Negligable, week, intermediate , high

# Building a logistic regression model

fit <- glm(default_N ~ student_N + balance, data=data,family="binomial") #  ---> logit() 
summary(fit)
boxplot(fit$residuals)

# Classification (Inference + Classification)
# Estimating probability

prob <- predict(fit,type="response",data) 
data$prob <- prob


library(caret)
confusionMatrix(table(as.numeric(prob>0.5), data$default_N)) # this is cut-off
#compare the output and the original data with confusion matrix

#TP TN
#FP FN

# Prediction
x <- data.frame(student_N=1 ,balance = 80, income = 10000)
p<- predict(fit,x)
p

# ROC curve

library(pROC)
library(MASS)
g1 <- roc(as.numeric(as.character(data$default_N)), data$prob)

print(plot(g1))




