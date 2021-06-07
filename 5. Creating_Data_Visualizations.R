# Creating Data Visualization with R

# ----------------------------------------------------------------------------------------- #
# Overview
# ----------------------------------------------------------------------------------------- #
# Data Visualisation using 3 main plotting system
# Standard data visualisation and explore advance data visualisation 
# ----------------------------------------------------------------------------------------- #

# What is data visualization?
# Data visualization is the representation of data by visual means => Human is good at visual pattern recognition
# Data Visualization is to map the properties of the data to visual characteristics

# Main Plotting System in R: (till graduation we work we only these 1st and 3rd)
# 1. Base Graphic System
# 2. Lattice
# 3. ggplot2

# Base Graphic System:
# Provides basic data visualisation capabilities.
# Flexible system that allows to build plots through series of high level plotting functions mixed with low level plotting functions
# Example: Create chart using high level plot function and perform modifications by specying values to the default parameters

plot(Cars) #these does not give me too much information
hist(Cars$Fuel.Economy)
#http://vdash.ir/docs/36/%D8%A2%D8%B4%D9%86%D8%A7%DB%8C%DB%8C-%D8%A8%D8%A7-%D9%86%D9%85%D9%88%D8%AF%D8%A7%D8%B1-%D9%87%DB%8C%D8%B3%D8%AA%D9%88%DA%AF%D8%B1%D8%A7%D9%85

# Lattice
# Based on trellis graphics based on S and S+ statistical programming languages (It use HTML)
# Helpful for creating multi-varied data visualizations: Data Visualization using many variables.

# ggplot2
# Grammer of Graphics - A thesis on statistical graphics written by Leland Wilkinson in 1999
# Use high level language to specify various aspects of data visualization
# ggplot2 provides acess to layers, geoms, aesthetic, scales and more.
# Also data visualization can be acheived with composing or chaining various functions together.

# ----------------------------------------------------------------------------------------- #
# Demo will be focussed on ggplot2
# Frequency Bar Chart - To visualize a single categorical variable
# Histograms and Density Plots - To visualize a single numeric variable
# Scatter Plots - To visualize two numeric variables
# 3D density plots - Advanced visualization for 2 variables (maybe)

# Faceted data visualization - To visualize three or more variables at the same time
# Scatter plot matrix - To view relationship between many variables all at the same time
# Spatial data - To view data located on surface of earth
# Hierarchial data - To view data organisaed in tree like structure
# Network data - To view the relationship between entities and data set 
# Textual data - To view data present in body of text

# Animated data visualisation and interactive data visualization can also be created.
# ----------------------------------------------------------------------------------------- #
# Demo
# ----------------------------------------------------------------------------------------- #
# Answer the following questions from the Cars Dataset:
# Question 1: How many cars of each type of transmission? 
head(Cars)
str(Cars)
table(Cars$Transmission)

plot(as.factor(Cars$Transmission))

ggplot(
  data = Cars,
  aes(x=Transmission)) +
  geom_bar()


# Question 2: What does fuel economy look like? 
# Mode < Mean ---> Right Skewd (from the plot it is obvious that mode is in the 17 and the mean is 20)
# Mode > Mean ---> Left skewd
# Mode = Mean ---> Normal Ditribution


# Measure of central tendency:
# 1. Mean 2. Mode 3. Median

# Measure of dispersion:
# 1. Variance 2. Standard Deviation 3. Range (Max - Min) 4. Interquartile Range 5. Boxplot
# Interquartile: {Q3 - Q1}= 50% of data
# Outliers: Below < Q1 - 1.5*(Q3-Q1) ---- Above > Q3 + 1.5(Q3-Q1)


library(ggplot2)
ggplot(
  data = Cars,
  aes(Fuel.Economy)
) +
  geom_histogram(bins = 10)

ggplot(
  data=Cars,
  aes(Fuel.Economy)
)+
  geom_density()


summary(Cars)
summary(Cars$Fuel.Economy) #Right skewd: most of the data are in the right side of the median
boxplot(Cars$Fuel.Economy) #there is no outliers
min(Cars$Fuel.Economy)
max(Cars$Fuel.Economy)
median(Cars$Fuel.Economy)
mean(Cars$Fuel.Economy)
quantile(Cars$Fuel.Economy)
var(Cars$Fuel.Economy)
sd(Cars$Fuel.Economy)
sqrt(var(Cars$Fuel.Economy))


# Question 3: How are cylinders and fuel economy related?
plot(x=Cars$Cylinders, y=Cars$Fuel.Economy)
plot(x=as.factor(Cars$Cylinders), y=Cars$Fuel.Economy)

ggplot(
  data = Cars,
  aes(x=Cylinders, y=Fuel.Economy)
) +
  geom_point()

cor(Cars[,3:4])
cor(Cars$Cylinders, Cars$Fuel.Economy) # Negative correlated


# Example page 11:

v <- c(5, 5.5, 6, 6, 6, 6.5, 6.5, 6.5, 7, 7, 8, 8, 9)
mean(v)
median(v)
boxplot(v) 
plot(v)

####################################### 
data_cor = data.frame(
  id <- c(1:6),
  age <- c(7, 6, 8, 5, 6, 9),
  weight <- c(12, 8, 12, 10, 11, 13)
)

cor(data_cor$age, data_cor$weight)

#[1] 0.759554  STRONG POSITIVE CORROLATION

########################################
# ----------------------------------------------------------------------------------------- #

# Set the working Directory
getwd()
setwd()
setwd("/Users/ashish/Desktop/TA-Work/R-Programming")

# Read a tab-delimited data file
cars <- read.table(
  file = "Cars.txt",
  header = TRUE,
  sep = "\t",
  quote = "\""
)

# Peek at the data
head(Cars)

# Load the ggplot2 library
library(ggplot2) # Hatman bad nega kon bbein tick dare ya na

# ----------------------------------------------------------------------------------------- #
# Answer 1st Question:
# Transmission is a categorical variable, therefore create frequency bar chart to answer the question.
# Frequency bar chart is the visual representation of frequency table.

table(Cars$Transmission) #we saw this in descriptive part (for categorical data we need table())


# Create a frequency bar chart

ggplot(
      data = Cars,
      aes(x = Transmission)) +
      geom_bar() +
      ggtitle("Count of Cars by Transmission Type") + 
      xlab("Transmission Type") +
      ylab("Count of Cars")

# aes(x = Transmission)) Only x is possible because this geom_bar() can only take one value if you give y value you give an error with a function name, if you want x,y you need scatter plot
#this plus is very important, ggplot and achive with other function so we add them with it


# aes() => The aesthetics helps to map the properties of the data to visual charactertistics like location, size , color.
# geom() => The geometry helps to find out what type of chart to create.
# geom_bar() => Create a bar chart
#geom_histogram() instead of geom_bar also

# ----------------------------------------------------------------------------------------- #
# Answer 2nd Question:
# Fuel Economy (miles per gallon) is numeric variable, therefore histogram or a density plot will be created to answer the question.

summary(Cars)
length(Cars$Fuel.Economy)
length(unique(Cars$Fuel.Economy)) #instead of 25 values we give histogram only 10 values

# Create a histogram
ggplot(
      data = Cars,
      aes(x = Fuel.Economy)) + 
      geom_histogram(bins = 10) +
      ggtitle("Distirbution of Fuel Economy") +
      xlab("Fuel Economy (mpg)") +
      ylab("Count of Cars")

# bins => create equidistant bins to group our data into.

# Create a density plot
ggplot(
    data = Cars,
    aes(x = Fuel.Economy)) +
    geom_density() +
    ggtitle("Distirbution of Fuel Economy") +
    xlab("Fuel Economy (mpg)") +
    ylab("Density")

# ----------------------------------------------------------------------------------------- #
# Answer 3rd Question:
# Both cylinders and fuel economy is numeric variables, therefore scatter plot to find out how they are related

# Create a Scatter Plot (now we can have x,y)

plot(x=Cars$Cylinders, y=Cars$Fuel.Economy)
plot(x=as.factor(Cars$Cylinders), y=Cars$Fuel.Economy)


ggplot(
    data = Cars,
    aes(
        x = Cylinders,
        y = Fuel.Economy)) +
    geom_point() +
    ggtitle("Fuel Economy by Cylinders") +
    xlab("Number of Cylinders") +
    ylab("Fuel Economy (mpg)")

# Negative correlation can be observed if we can draw a line of best fit through all the points is in downward slope
# As number of cylinders increased fuel economy goes down