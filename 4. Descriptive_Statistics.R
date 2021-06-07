# Creating Descriptive Statistics using R

# ----------------------------------------------------------------------------------------- #
# Overview

# Descriptive Statistics and describe the data in numerical manner
# Standard Statistical Methods for Single Categorical Variable and Single Numeric Variable

# Demo:
# Create frequency tables
# Measure of central tendency
# Measure of spread
# Create correlation coefficients

# ----------------------------------------------------------------------------------------- #
# What is descriptive statistics?
#when you import data you need to do three things:

summary(Cars)
str(Cars)
head(Cars)
tail(Cars)

plot(Cars) #eli
plot(Cars$Cylinders, Cars$Fuel.Economy) #eli
plot(as.factor(Cars$Cylinders), Cars$Fuel.Economy) #eli


# Describe the data in numerical way. Numerical Analysis of Data.
# With descriptive statistics, summarization to shape and feel data in numerical ways. Therefore also known as Summary Statistics

#Abinav Question: do you think these data is normal disturbuted? lot os question will come with summary
#Right skewd: Most of the dataset is in the right
#Left Skewed: Most of the data is in the left
#this is right skewed because mean in bigger than median, there is not any outliers, standard deviation is small 20-10+10 =30
#it is normal disturbuted
summary(Cars$Fuel.Economy) #eli
# Fuel Economy:
# Statistic             Value(mpg)
# Minimum               10.40
# 1st Quartile          15.42
# Median                19.20
# Mean                  20.09
# 3rd Quartile          22.80
# Maximum               33.90
head(Cars)
# Statistical Terms:
#                       Cars
# Name            Transmission        Cylinders         Fuel Economy
# Mazda RX4       Manual              6                 21.0
# Mazda RX4 Wag   Manual              6                 21.0
# Datsun 710      Manual              4                 22.8
# Hornet 4 Drive  Automatic           6                 21.4
table(Cars$Name) #eli
table(Cars$Transmission) #eli
# Observations  : Rows in the table       => Statistics interest is more on observations of some phenomenon, like Average temperature each day
# Variables     : Columns in the table    => Values vary across each observation or row in the dataset
#     - Categorical Variables : Represent qualitative values like cars name and transmission type
#     - Numeric Variables     : Represent quantitative values like number of cylinders and fuel economy

# ----------------------------------------------------------------------------------------- #
# Categorical Variables contain qualitative values i.e. named values like type of transmission

# Descriptive Statistics of categorical variables: 
# Frequency of observations/categories 

table(Cars$Transmission) #eli

# Frequency table: (first and easiest way to deal with categorical values is finding the frequency table)
#     Frequency of Transmission Type
# Transmission        Frequency
# Automatic           19
# Manual              13

#with categorical data you can do mean, median, standard deviation, 1st Q, 3rd Q
#how do you deal with categoricl data? you deal with them like frequency table

# ----------------------------------------------------------------------------------------- #
# Numeric Variables contain quantitative values like fuel economy of cars in U.S. miles per gallon
# Descriptive statistics of numeric variables: 
# Measures of center or Center distribution of values is located or Measure of center tendency : Mean
# Measures of spread of data or Dispersion in statistics : Standard deviation
summary(Cars$Fuel.Economy) #eli

# Fuel Economy:
# Statistic             Value(mpg)
# Minimum               10.40
# 1st Quartile          15.42
# Median                19.20
# Mean                  20.09
# 3rd Quartile          22.80
# Maximum               33.90
# Std. Dev,             6.02

# ----------------------------------------------------------------------------------------- #
# Correlation:
# Strength of relationship between 2 or more numeric variables => Degree to which two variables vary with one another
# Correlation coefficient provides us with the measure of the strength of this relationship on a standardised scale
# Scale is between -1 to +1 where -1 implies negative correlation, +1 implies positive correlation and 0 implies no correlation
cor(Cars$Cylinders, Cars$Fuel.Economy)
#     Correlation
#              Fuel Economy
# Cylinders    -0.85

cor(Cars$Fuel.Economy, Cars$Fuel.Economy) #eli
cor(Cars[,c(3,4)]) #eli
cor(Cars[,3:4]) #eli
head(Cars) #eli

#     Correlation
#              Fuel Economy
# Fuel Economy      +1 ???

#we should understand what type of variables are important and not
# 
# Fuel Economy decreases when number of cylinder increases (sumerizing, grouping and mutate())  in working with data
#when you see the corolation you can make new column to see them exactly

#   Cylinders   Avg.Consumption
#     4         10.030000
#     6         8.128125
#     8         6.396250
mutate()
#corrolation is only possible for numerical variable, if you get error there are some categorical variable in your dat
cor()
# ----------------------------------------------------------------------------------------- #
# Demo:
# ----------------------------------------------------------------------------------------- #
# Answer the following questions from the Cars Dataset:
# Question 1: How many cars of each type of transmission? 
#this is describing the transmission column
head(Cars)
table(Cars$Transmission)
# Question 2: What does fuel economy look like? 
#describing the fuel economy coumn
head(Cars)
summary(Cars$Fuel.Economy)

# Question 3: How are cylinders and fuel economy related?
#Relation between cylander and fuel economy

cor(Cars$Cylinders, Cars$Fuel.Economy) # Negative Correlated
# ----------------------------------------------------------------------------------------- #

# Set the working Directory
getwd()
setwd("/Users/ashish/Desktop/TA-Work/R-Programming")

# Read a tab-delimited data file
# read.csv to read a csv file
cars <- read.table(
  file = "Cars.txt",
  header = TRUE,
  sep = "\t",
  quote = "\""
)

# Peek at the data
head(cars)

# ----------------------------------------------------------------------------------------- #
# Answer 1st Question:
# Transmission is a categorical variable, therefore create frequency table to answer the question

#with table() we can get the frequency of categorical data
# Create a Frequency Table
table(cars$Transmission) 
table(cars$Name) #this help in misspelling data
#table(cars) ???


# ----------------------------------------------------------------------------------------- #
# Answer 2nd Question:
# Fuel Economy (miles per gallon) is numeric variable, therefore numerical descriptive statistics will be created to answer the question

# Get the minimum value
min(cars$Fuel.Economy)

# Get the maximum value
max(cars$Fuel.Economy)

# Get the average value
mean(cars$Fuel.Economy)

# Get the median value
median(cars$Fuel.Economy)

# Get the quartiles (what do you underastand? dividing the data set into different quartiles)
quantile(Cars$Fuel.Economy)
boxplot(Cars$Fuel.Economy) # Yes ! it is right skewd 10-19.200 (left) 19.200-33.900 (Right)

# Get the standard deviation
var(Cars$Fuel.Economy)
sd(Cars$Fuel.Economy)
sqrt(var(Cars$Fuel.Economy))

# Get the total values
sum(Cars$Fuel.Economy)

#or just write these in the whole dataset:
summary(Cars) 
str(Cars)

# ----------------------------------------------------------------------------------------- #
# Answer 3rd Question:
# Both cylinders and fuel economy is numeric variables, therefore correaltion coefficient to find out how they are related

# Get the correlations coefficient
#you can do it without x and y also
cor(
    x = Cars$Cylinders,
    y = Cars$Fuel.Economy
)

cor(Cars) #cor(cars) for the whole dataset, not possible because there are some categorical data
cor(Cars[, 3:4]) # now remove those char

# Summarize the entire table by passing the dataframe as argument
summary(Cars)

# ----------------------------------------------------------------------------------------- #
# Answer 1:
#     Frequency of Transmission Type
# Transmission        Frequency
# Automatic           19
# Manual              13

# ----------------------------------------------------------------------------------------- #
# Answer 2:
# Fuel Economy:
# Statistic             Value(mpg)
# Minimum               10.40
# 1st Quartile          15.42
# Median                19.20
# Mean                  20.09
# 3rd Quartile          22.80
# Maximum               33.90

# ----------------------------------------------------------------------------------------- #
# Answer 3:
#     Correlation
#              Fuel Economy
# Cylinders    -0.85
