# Import as factor??? NO
library(caret)
library(pROC)
library(MASS)
# Logistic Regression
# import as.factor() automatically convert to two levels
data1 <- `RidingMowers.(1)`

head(data1)
summary(data1)
str(data1)
table(data1$Ownership)
nlevels(as.factor(data1$Ownership))

data1$ownership_N <- ifelse(data1$Ownership == "Owner", 1,0) 

head(data1)
table(data1$ownership_N)

#data1$ownership_N <- as.factor(data$ownership_N)

model <- glm(ownership_N ~ Lot_Size + Income, data=data1, family = "binomial")
summary(model)

prob <- predict(model,type="response",data1) 
data1$prob <- prob

head(data1)

table((data1$prob> 0.5), data1$Ownership)
confusionMatrix(table(data = as.numeric(prob>0.5), reference = data1$ownership_N))

x <- data.frame(Income=93 ,Lot_Size = 20)
p<- predict(model,x)
p


# ROC curve
head(data)
library(pROC)
library(MASS)
g1 <- roc(as.numeric(as.character(data1$ownership_N)), data1$prob)

print(plot(g1))

# Scatter Plot
library(ggplot2)
ggplot(
  data = data,
  aes(  x= Income,
        y= Lot_Size)) +
  geom_point()+
  ggtitle("Mowing Riders") +
  xlab("Income") +
  ylab("Lot size")


plot(data$Income, data$Lot_Size, col=(ifelse(data$prob > 0.5, "red", "darkgreen")))

