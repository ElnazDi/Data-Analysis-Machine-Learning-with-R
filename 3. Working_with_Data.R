# Working with Data in R

# ----------------------------------------------------------------------------------------- #
# Overview
# ----------------------------------------------------------------------------------------- #
# Import data
# Clean data
# Transform data
# Export data

# ----------------------------------------------------------------------------------------- #
# Theory regarding working with data
# ----------------------------------------------------------------------------------------- #
# Steps to be performed in order to transform data in such a way that we can perform analysis on the data:

# Import data from one or more data sources
# Clean the data in order to produce the reliable results
# Transform the clean data into the form suitable for analysis we intend to perform
# Export the data into different format

# All above steps together are termed as: 
# Data Munging, Data Wrangling, Data Cleaning, Data Cleansing or Extract Transform Load (ETL)

# ----------------------------------------------------------------------------------------- #

# Importing data from wide variety of data sources:
# File-based data: Excel, CSV, and Tab-delimited values
# Web-based data: XML, HTML, and JSON
# Databases: SQL Server, Oracle, and MySQL
# Statistical data files: SAS, SPSS, and strata files

# ----------------------------------------------------------------------------------------- #


# Cleaning data in order to work with them effectively and provide reliable results: 
# Because data are not stored in suitable format for analysis and many data sources contains anomalies, error those need to be corrected inorder to produce reliable results
#e.x: Companies data always have date col that come in string type should it should be convetred to date, datetime
# Reshaping data: Table of data with each variable stored as column in one observation per row.
# Renaming columns: Accurate and human readable column names
# Converting data types: One data type to another
# Ensure proper encoding: Data types are properly encoded i.e. 'm' to Male, 'f' to Female
# Ensure internal consistency: Data is converted into same unit of measure, same numeric scale, and same format for integer, decimal, date.
# Handling error and outliers: Correcting values which were incorrectly present
# Handling missing values: Either by omitting the entire row or imputing a suitable replacement values

# Extension package for Cleaning data:
# tidyr: Focussed on tidying data, i.e. reshaping data from non-standard formats to standard tabular format
# reshape2
# stringr: Character string manipulations
# lubridate: Work with dates
# validate: Used to define set of reusable domain rules to check if data adhere to the expected rules
install.packages("tidyr")
library(tidyr)

install.packages("stringr")

install.packages("tidyverse")
install.packages("lubridate")




# ----------------------------------------------------------------------------------------- #

# Transforming data in a suitable form suitable for analysis:
# Selecting the columns 
# Filter rows
# Grouping rows based on one or more columns and aggregating result within each group
# Ordering rows based on one or more columns : Sorting or Arranging
# Merge tables

# Extension package for transforming data:
# plyr: splitting and combining data 
# dplyr: data manipulation using data frames, data tables, and databases 
# data.table
# sqldf: Execute queries using SQL on data contained in our dataframe
install.packages("dplyr")

# ----------------------------------------------------------------------------------------- #

# Exporting data:
# File-based data
# Web-based data
# Databases
# Statistical data

# ----------------------------------------------------------------------------------------- #

# Advice for working with Data
# Time Consuming - 80% on average for this process
# Record all steps so that process can be re-applied for new records

# ----------------------------------------------------------------------------------------- #
# Demo:

# dplyr package for data manipulation ---> Transforming 
# Select: Select subset of column from table
# Filter: Filter table base don criteria
# Mutate: Creates new columns by transforming present in existing data
# Summarize: Summarize or aggregate the set of rows based on common values
# Arrange: Reorder the rows based on one or more columns and the order in which to sort them.

# About dataset:
# Motor-Trend Cars Dataset : Collected from cars contained in Motor Trend magazine in 1974
# Dataset consist of series of measures of 32 cars released between 1973 and 1974

# Dataset :
# Name            Transmission        Cylinders         Fuel Economy
# Mazda RX4       Manual              6                 21.0
# Mazda RX4 Wag   Manual              6                 21.0
# Datsun 710      Manual              4                 22.8
# Hornet 4 Drive  Automatic           6                 21.4

# Name                : Model of the Car
# Transmission Type   : Categorical variable containing Manual and Automatic as 2 values
# Cylinders           : Integer representation of number of cylinders present in cars engine
# Fueld Economy       : Numeric Data type which represents the rate at which the car consumes fuel measured in U.S. miles per gallon of fuel

# ----------------------------------------------------------------------------------------- #
# Steps for the demo:
# Import data from Tab-delimited flat file
# Transform data using dplyr
# Export into a CSV file
# ----------------------------------------------------------------------------------------- #

# Getting working Directory
getwd()

# Set the working Directory
setwd("/Users/dehkharghanielnaz/Desktop/SRH Classes/Analytics 1/Slides/R Files")

# ----------------------------------------------------------------------------------------- #
# Important: "/" is only used for stating the working directory even if windows system is used
# ----------------------------------------------------------------------------------------- #

# Read a tab-delimited data file
cars <- read.table(
        file = "Cars.txt",  #getwd() useful for here
        header = TRUE,
        sep = "\t",
        quote = "\""
)

#from the console (by running the above code):
Carss <- read.delim("/Users/dehkharghanielnaz/Desktop/SRH Classes/Analytics 1/Slides/R Files/Cars.txt")


# Help for a function in R
?read.table

# Peek at the data
head(Cars)
tail(Cars)
str(Cars)
summary(Cars)
table(Cars$Transmission) #for categorical data
table(Cars$Name) #unique name ---> this will help in data cleaning if names are written with misspllening 


# Load the dplyr library (For transforming data)
#before we need to install it -> Packages -> install (From CRAN repository, what you want to install (dplyr))
library(dplyr) #then it should show check mark in the packages in the right hand

# ----------------------------------------------------------------------------------------- #
# Transformation of data step by step and inspecting them after each transformation step is performed
# ----------------------------------------------------------------------------------------- #

# Select a subset of columns

head(Cars)
temp <- select(
        .data = Cars,
        Transmission,
        Cylinders,
        Fuel.Economy
)

print(temp)

# In Base R
temp1 <- Cars[,2:4] #all rows, col from 2,3,4
print(temp1)

# .data = cars and not data = cars  => inorder to avoid name collision
# cars is the dataframe with the record which were loaded earlier

# Inspect the results
head(temp)

# ----------------------------------------------------------------------------------------- #
# Filter rows having automatic transmission i.e. a subset of rows
# Filter comes on the selection data
temp <- filter(
        .data = temp,
        Cylinders == 6,
        Transmission == "Automatic"
)

# Inspect the results
head(temp)

# ----------------------------------------------------------------------------------------- #
# Compute a new column: Convert the values of Fuel Economy values from Cylinders
# mutate function is used
temp <- mutate(
        .data = temp,
        cons = Cylinders * Fuel.Economy) #new col name is cons


# In Base R (different way of mutate)
temp$consb <- temp$Cylinders * temp$Fuel.Economy

# Consumption is the term used in US for Fuel Economy therefore a new column

# Inspect the results
head(temp)

# ----------------------------------------------------------------------------------------- #
# Group by a column: Group the cars by number of cylinders each car contains
temp <- group_by(
        .data = temp,
        Cylinders
)

# Inspect the results
head(temp)
print(temp)
# group_by returns a group dataframe rather than normal dataframe
# A tibble : 6 x 4  => Datasource is a data frame of 6 rows of data being displayed and 4 columns of data
# Cylinders[3]      => There are 3 groups of cylinders present in the data i.e. 4,6,8 cylinders engine
# fct               => factor for transmission
# int               => integer for Cylinders
# dbl               => Double for Fuel Economy and Consumption

# ----------------------------------------------------------------------------------------- #
# Aggregate based on groups: Data is grouped therefore we can now summarize the data contained in each group. 
temp <- summarize(
        .data = temp,
        Avg.Consumption = mean(cons)
)

temp <- summarize(
  .data = cars,
  Avg.Consumption = sum(Cylinders)
)

# Inspect the results
head(temp)

# A tibble is a data structure of 3 x 2 is obtained as result i.e. 3 rows and 2 columns
# A tibble is a dataframe that contains all of the best features of a dataframe but eliminates unnecessary features.

# ----------------------------------------------------------------------------------------- #
# Arrange the rows in descending order: Most efficient car on top and least efficient on bottom
temp <- arrange(
        .data = temp,
        desc(Avg.Consumption)
)

# Inspect the results
head(temp)

# ----------------------------------------------------------------------------------------- #
# Convert tibble to data frame
efficiency <- as.data.frame(temp)

# Inspect the results
print(efficiency)

# ----------------------------------------------------------------------------------------- #
# ----------------------------------------------------------------------------------------- #
# Chain methods together: Fluent Notation using Piping (Pipe operator in dplyr is %>%)
efficiency <- Cars %>%
              select(Fuel.Economy, Cylinders, Transmission) %>%
              filter(Transmission == "Automatic") %>%
              mutate(Consumption = Fuel.Economy * 0.425) %>%
              group_by(Cylinders) %>%
              summarize(Avg.Consumption = mean(Consumption)) %>%
              arrange(desc(Avg.Consumption)) %>%
              as.data.frame() #we can also do not write, but better to write

# Inspect the results
print(efficiency)
print(Cars)



# ----------------------------------------------------------------------------------------- #
# ----------------------------------------------------------------------------------------- #
# Save the results to a CSV File - Export the results
# Exported CSV file is having values seperated by Tabs and Records seperated by LineFeed Character sequence
write.csv(
  x = efficiency,
  file = "Fuel Efficiency.csv",
  row.names = FALSE
)

# row.names = FALSE => Exported CSV file should not have the row identifier of the dataframe