library(ggplot2)
library(dplyr)
####### Step 1: Importing Data  #######
#--> Notice to comma/ period

beer <- Beer.Consumption

####### Step 2: Data Cleaning ########

# Change Column Names
names(beer)
names(beer) <- c("Date", "Ave.temp", "Min.temp", "Max.temp", "rain", "weekdays", "beer.consumption")

# Omit NA values
sum(is.na(beer))
beer <- na.omit(beer)
dim(beer)


# Or Replace the NA values with 0 (Since the NA values are too much I prefered to change with 0)

#beer[is.na(beer)] <- 0
#which(is.na(beer))


# Change Column Data Types
str(beer)
beer$Date <- as.Date(beer$Date)
beer$beer.consumption <- as.numeric(beer$beer.consumption)



#######Step 3: Descriptive Statistics#####
#Q1:
# What is the overall statistical evaluation of the data set?
# Mean, Median Mode of the data (Introduction to statistical concepts)
# Covariance and Correlation (Definitions)
# Missing value treatment

names(beer)
str(beer)
summary(beer)

boxplot(beer$beer.consumption)

#beer$beer.consumption[is.na(beer$beer.consumption)] <- 0

cor(beer[,2:7])
cov(beer[,2:7])

#R does not have a built-in Mode() so we have to create a function for it: 

v<-beer$beer.consumption
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(v)

#Q2
# What is the variability in the three temperatures across different
# Data range analysis (On three temperature fields)
# Outliers (Box Plot & IQR)
# Scatter Plots, Histograms and Percentiles
par(mfrow=c(1,3))

boxplot(beer$Ave.temp)
boxplot(beer$Min.temp)
boxplot(beer$Max.temp)

quantile(beer$Ave.temp)
quantile(beer$Min.temp)
quantile(beer$Max.temp)


ggplot(
  data = beer,
  aes(Ave.temp)
)+
  geom_histogram(bins = 10)

ggplot(
  data = beer,
  aes(Ave.temp)
)+
  geom_density()

ggplot(
  data = beer,
  aes(x=Date, y=Ave.temp)
)+
  geom_point(col="darkgreen")


#Q3:
# What is the Consumption of beer for different months/days?
# Grouping and sorting data (On Consumption & Date)
# Filtering Data

par(mfrow=c(1,1))
plot(beer$Date, beer$beer.consumption)

#Sorting Data
temp <- arrange(
  .data = beer,
  desc(beer.consumption)
)
print(temp)

#filtering Data
temp <- filter(
  .data =beer,
  Date == "2015-01-05"
)
print(temp)

#Q4:
# How is the relation between dependent and independent variable? (linear?)
# Choosing the independent and dependent variable (Analysis the correlation)
# Predicting dependent variable
# Checking model summary
# Evaluation of model with stats & R

head(beer)
cor(beer[,2:7])
model.1 <- lm(formula= beer$beer.consumption ~ beer$Max.temp + beer$Ave.temp + beer$Min.temp + beer$rain)
summary(model.1)

model.2 <- lm(formula= beer$beer.consumption ~ beer$Max.temp + beer$rain)
summary(model.2)

plot(x=beer$beer.consumption, y=beer$Max.temp)
model.3 <- lm(formula= beer$beer.consumption ~ beer$Max.temp)
abline(model.2, col="blue")
summary(model.3)

# train date:
dim(beer)
train_beer <- beer[1:300, 1:7]
dim(train_beer)

model.4 <- lm(formula = train_beer$beer.consumption ~ train_beer$Max.temp + train_beer$rain)
summary(model.4)

#test data:
test_beer <- beer[301:365 , c(4,5)]
dim(test_beer)
head(test_beer)
predict(object=model.4, newdata = test_beer, interval = "prediction")

