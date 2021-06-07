# Creating Statistical Models using R

# ----------------------------------------------------------------------------------------- #
# Overview of demo

# Statistical modelling and how to use statistical models to create interfaces and make predictions
# Simple Linear Regression using R
# ----------------------------------------------------------------------------------------- #

# What is statistical model? 
#(because the size of the population is big we use a sample that best describe and represent the the population)
# Statistical model is a set of one or more mathematical equation used to repsent the sample of data i.e. A mathematical model based on probabilities that attemps to describe the processes which created the data.
# A model is a simplification or an approximation of reality i.e. it is a mathematical abstraction that captures the essence of reality but does not perfectly describes it.
# A model includes any abstract representation of data, which includes probability density function and even a data visualization.

# Q: whenever you ask to do statisical model thse are the things you need to do:
# 1. how you can represent your sample of data
# 2. some visualization, some mathematical on the data
# 3.visual represtendation


# Statistical model is a relationship between two or more variables. 
# Following are the purposes of Statistical models:

# Description: To describe the basic characteristics of a sample of data that we are observing.
# Inference: To estimate the parameters of larger population. (make visualization, corrolation)
# Comparison: Compare sets of data to determine if they are different in a way that is statistically significant.
# Prediction: To make predictions of unknown observations.

# ----------------------------------------------------------------------------------------- #
# Types of Statistical model:

y = mx + c
y = b0+b1x+e

# Parametric model : A fixed number of parameters and model is completely defined by setting the parameter.(b0, b1)
# Example: Gaussian distribution which is the bell-shaped curve on the right is described by 2 parameters i.e. mean and standard deviation.
#          And unknown values can be predicted if meand and standard deviation are known.

# Non-parametric model: Number and nature of parameters are not fixed in advance, but grows with the amount of data available to create the model. (neural networks, svm)

# Parametric models:
# Single variable probability density function : Represent various statistical distribution of values. we talk about the below functions.

#different statical distribution
mean()
median()
mode()
quantile()
boxplot()
min()
max()


# Analysis of variance : Model having relatinship between two or more variables, ANOVA helps compare the differen of the means among 3 or more groups of data.
# Simple linear regression: Model the relationship between two variables as a linear function. 
# Non-linear regression: Model the relationship between two varibales when their relationship does not exist and does not form a straight line.
# Bayesian networks: Model the relatipnship between many variables as network of conditional probability based on bayesian statistics.
# ----------------------------------------------------------------------------------------- #

# A simple linear regression model will be focussed in this demo:
# Model used for relationship between two variables: Change in one variable influence the change in second variable
# Linear model: Model the relationship using a mathematical equation of a straight line.


y=mx + c
y =b0 +b1x
# (me) x is independent, y is dependent, m is slop, with this line we can predict for new unknown data

# Variables in simple linear regression:
# Explanatory variable/ Independent variable/ Predictor variable (Plot on x axis of the chart) - Continuous numeric variable
# Single scalar outcome variable/ Dependent variable/ Response variable (Plot on y axis of chart) - Continuous numeric variable
# Linear predictor function: Function of the straight line
# y = m * x + b
# Weather = rain + temp + humity + shirt size
# y is the outcome variable and x is the explanatory variable
# m is the slope of the line : Increase in x how much the y increase => unknown
# b is the y intercept => unknown
# Method of least square to provide estimates for these parameters based on the data i.e. based on data predict the values of m and b
# Best fit line minimises the vertical distance between each point and the regression line. (we see thses in summary of model, reduale)

# ----------------------------------------------------------------------------------------- #
# Assumptions in Linear regression:
# 1. Linearity: Source that generated the data follows a straight line
# 2. Homoscedasticity: Ability of the data stays roughly the same over the length of the line.

#help to find Homoscedasticity
variance
boxplot()

# Is assumptions are incorrect then linear regression cannot be applied.



# ----------------------------------------------------------------------------------------- #
# Load the data => Iris data is pre installed in R 
data(iris)
mtcars #other dataset in R
iris
head(iris)

# Contains 150 observations of 4 measurements for 3 species of Iris flower.
table(iris$Species)

# 3 species are :
# Iris Setosa
# Iris Versicolor 
# Iris Virginica


# 4 Measurements are :
# Petal length: Average length of the petals of the flower in centimeters
# Petal width: Average width of the petals of the flower in centimeters
# Sepal length: Averange length of the sepal (Leaf like structure in the flower)
# Sepal width: Average width of the sepal

# Peak at data
head(iris)

# Sepal.Length Sepal.Width Petal.Length Petal.Width   Species
#     5.1         3.5          1.4         0.2        setosa
#     4.9         3.0          1.4         0.2        setosa
#     4.7         3.2          1.3         0.2        setosa
#     4.6         3.1          1.5         0.2        setosa
#     5.0         3.6          1.4         0.2        setosa
#     5.4         3.9          1.7         0.4        setosa

# ----------------------------------------------------------------------------------------- #
# Create a Simple Linear Regression model using petal lengths and widths in the dataset
# Answer the following question from the Iris dataset:
# Question 1. How are the petal lengths and petal width related to one another? Patel length
# Question 2. Can we predict new petal width = (dependent variable) values based on known petal length values (independent variable)?
# ----------------------------------------------------------------------------------------- #
iris <- iris
str(iris)
summary(iris)


# Create a Basic plot - Scatter Plot
plot(
    x = iris$Petal.Length,
    y = iris$Petal.Width,
    main = "Iris Petal Length vs. Width",
    xlab = "Petal Length (cm)",
    ylab = "Petal Width (cm)"
)

#two assumption: 1. Liniarity 2. Homoscedasticity
#Overall corrolation
head(iris)
cor(iris[, 1:4])

# Create a Linear Regression Model

#Exam question
# what is the null hypothesis H0: any formula that you are going to run, H0 is the dependent and independent
#that they are not related together, independent and dependent variable

# for linear regression we use lm()

#First: we saw model, 
#second: reseduel with summary() how different is each data point from my linear regression line, resdual are base on the differences not actual values
#third :coefficents Intercept is b0, petal.length is b1
#standars error: if new data come how much they are different, the lower it is better
#t value : check these coefficent that are generated how are different from value 0, 
#back to H0 that says the petal lenghth and petal width are not related to each other, so if they are not dependent to each other t value should be low !
#so now it is high and we have to reject the null hypothesis
#so this t value speak about null hypothesis (1:04:03) normal disturbution curve
#H0: petal width and patal height are not dependent to each other, we create the linear model, we have redual

model <- lm(formula = Petal.Width ~ Petal.Length, data = iris)
abline(model, col="blue")
#Exam:  patel.lenghth is most signifact or  sepal.lenght to petal width? (for below model) answer: petal length
# by looking at the t value we can see more dependency, the lower is the t value we reject the null hypothesis
#the higher better to estimate new values
model <- lm(formula = Petal.Width ~ Petal.Length + Sepal.Length,data = iris) 


model <- lm(formula = Petal.Width ~ Petal.Length + Sepal.Width,data = iris) 

# we can think to keep which variables
#Exam questin: 
#y=b1x (petal.lenghth) just considering the line:
#Petal.Length  0.42627    0.01045  40.804  < 2e-16 ***
# every one unit that increase in my patel lenghth will increase my y value

# lm function for linear model: formula => Petal width = f(Petal Length) 
# Outcome variable as a function of independent variable => ~ to represent a function notation

# Summarize the model
summary(model)


#we have to be careful about overfitting

#               Estimate 
# (Intercept)  -0.363076  => y-intercept of the line (b)
# Petal.Length  0.415755  => Slope of the line (m)

# Draw a regression line on plot
lines(
    x = iris$Petal.Length,
    y = model$fitted,
    col ="red",
    lwd = 3
)

# ----------------------------------------------------------------------------------------- #
# Answer 1st Question:
# The petal lengths and petal width correlation can be found out by using corr() function

# Get correlation coefficient
cor(
    x = iris$Petal.Length,
    y = iris$Petal.Width
)

# ----------------------------------------------------------------------------------------- #
# Answer 2nd Question:
# Predict new petal width using the petal length

# Predict new values from the model
predict(object = model, newdata = data.frame(Petal.Length = c(2,5,7)))


####################################  EXAM ####################################
#two assumption: 1. Liniarity 2. Homoscedasticity 3. error mean is 0
# in the regression dependent variable and independent variable are metric

iris <- iris
head(iris)
str(iris)
summary(iris)

# Create a Basic plot - Scatter Plot
plot(x = iris$Petal.Length, y = iris$Petal.Width, col=iris$Species)

#Overall corrolation
cor(iris[, 1:4])
# Get correlation coefficient
cor(x = iris$Petal.Length,y = iris$Petal.Width)

model <- lm(formula = Petal.Width ~ Petal.Length, data = iris)
abline(model, col="blue")

# Summarize the model
summary(model)

# Coefficents:
# B0 = Mean of the Y
# B1 = Slope (one unit change in X will B1 increase Y)
# B is weight of the relationship --> if normal= prognosis/ if standard= compare (-1,1)

# st. error(B0 and B1) ---> how deviate with repeating sampling 

# t-value standard B/ standard error B ---> should be far from 0 to reject H0

# p-value is low so reject the null Hypothesis , there is dependency between x and y

# Model:
# Rˆ2 --- propertion of explaind variation by model = how model fits 
# Rˆ2 explained deviation/ unexplained deviation

# adjust Rˆ2 ---> number of sample and number of variable is considered (Unbias)
# residual standard error ---> RMSE/df

# Population : F- statisc (consider N sample - number of variables and both explained and unexplaend deviation)

# More can be underestood by MSE, MAE, MAPE, MPE



# Predict new values from the model
predict(object = model, newdata = data.frame(Petal.Length = c(2,5,7)))




iris <- iris
summary(iris)
head(iris)
