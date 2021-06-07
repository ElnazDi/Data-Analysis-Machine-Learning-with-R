#Exploring and visualizing time series in R
#PLotting different time series models
#Benchmark methods and forecast accuracy
#smoothing : should time series be in 95% confidence interval
#Forecasting with ARIMA models


# three important things: 1. Stationarity 2. Normalization 3. Correlation 4. auto.arima 5. final model 6. checking the white noise (qchisq, qchisq)
# Correlation ---> decompose(), tsdisplay
# Normalization ---> Box Cox
# Stationality ---> First check the stationarity  adf.test() or  kpss.test()  , Second make stationarity diff() , acf(), pacf()


#install.packages("forecast")
#install.packages("fpp")
#install.packages("tseries")
library(tseries)
library(forecast)
library(fpp)

head(EuStockMarkets)
str(EuStockMarkets)
tsData <- EuStockMarkets[, 1] # ts data, we need only one curve choose one column

str(tsData)  # values are around 1600
head(tsData)



# different type of components in time series

decomposedRes <- decompose(tsData, type="mult") # use type = "additive" for additive components
plot (decomposedRes) # see plot below

#Strandard Error plot
#stlRes <- stl(tsData, s.window = "periodic")
#plot(stlRes)
#plot(tsData)

#Direct and Indirect Effect
tsdisplay(tsData) #acf pacf
# data is not repeating, there is no seasonality. (Negative Correlation) --> this data is not good for prediction

# Plot time series data with condmilk
# Stationality, Seasonality, Correlation ACF
# in the PACF also is seasonality
condmilk<-condmilk
tsdisplay(condmilk)

# Different Plots for time series 
#library forecast
#seasonplot(condmilk)
#monthplot(condmilk)

# Second: Convert data to normal distribution
# Box Cox Transformation
#Transformation of a non-normal dependent variables into a normal shape
lambda = BoxCox.lambda(condmilk)
tsdata2 = BoxCox(condmilk, lambda=lambda)
tsdisplay(tsdata2)


#Third -- check if data is satitinarity then make it stationarity
#Checking if plots are stationary
#ADF test has null of unit root
adf = adf.test(tsdata2) 

#KPSS test has null of stationarity
kpss = kpss.test(tsdata2) 

adf # this time series is stationary (Dickey-Fuller always negative and should be far from the 0 to be stationarity) null Hypothesis = 0
kpss # it should be close to 0 to be stationary

#Making plots stationary
ndiffs(tsdata2)  # because it is stationarity do not show anything but we continue
tsdata3 = diff(tsdata2, differences = 1) # just one lag
plot.ts(tsdata3)
acf(tsdata3, lag.max = 20) # making the acf and pacf stationarity
pacf(tsdata3, lag.max = 20)
tsdisplay(tsdata3) # if check with before data, there was one non seasonality that is removed now.

#Automatic Selection Algorithm - Fast
# to find best auto compoentn and best seasonal component
auto.arima(tsdata2, trace= TRUE, ic ="aicc", approximation = FALSE) # without stepwise
# Orser(P,d,Q), Seasonality, Period, when to run the model will give these best Order, seasonality, period

#Auto Algorithm - Slow but more accurate
auto.arima(tsdata2, trace= TRUE, ic ="aicc", approximation = FALSE, stepwise = FALSE)

finalmodel = arima(tsdata2, order = c(1, 0, 0), seasonal = list(order = c(2,0,0), period = 12))
summary(finalmodel)
# MAE should be really low and other value as well, because there are error term


# last step: (Checking the white noise)
#1. Residuals are Uncorrelated (White Noise)
#2. Residuals are normally distributed with mean zero
#3. Residuals have constant Variance

# R Code :  
 
 # Check whether the residuals look like white noise (Independent)
  # p > 0.05 then the residuals are independent (white noise)
tsdisplay(residuals(finalmodel))
Box.test(finalmodel$residuals, lag = 20, type = "Ljung-Box")

# p-values shown for the Ljung-Box statistic plot are incorrect so calculate critical chi squared value

# Chi-squared 20 d.f. and critical value at the 0.05
qchisq(0.05, 20, lower.tail = F)
# Observed Chi-squared 13.584(28.904) < 31.41 so we don't reject null hypothesis
# It means residuals are independent or uncorrelated (white noise) at lags 1-20.  

# whether the forecast errors are normally distributed
qqnorm(finalmodel$residuals) 
qqline(finalmodel$residuals) # Normality Plot

# predict the next 5 periods
Forecastmodel = forecast(finalmodel, h = 5) 
summary(Forecastmodel)
# Note : If lambda specified, forecasts back-transformed via an inverse Box-Cox transformation.


# If you have a fitted arima model, you can use it to forecast other time series.
inpt = arima(tsdata2, model=Forecastmodel)

#######################################################
################## RANDOM WALK ########################
#Assumptions WN ~ Normal distribution(0,1)
# x[1] = 0 

x= NULL
x[1] = 0
for (i in 2:1000){
 x[i] = x[i-1] + rnorm(1)}

# make a time series of random walk
random_walk = ts(x)
plot(random_walk, main="A Random Walk" , ylab="", xlab="Days", col="blue", lwd=2)
acf(random_walk) # Strong Dependency on time

diff(random_walk)
plot(diff(random_walk)) 
acf(diff(random_walk))  # No correlayion

######################################################
################## Book Exercises ####################

library(forecast)
Amtrak.data <- Amtrak

head(Amtrak)
str(Amtrak)
#
#Make time series on Ridership Coloumn
ridership.ts <- ts(Amtrak$Ridership , start=c(1994,1), end=c(2004,3), freq=12) # January 1994,May 2004, per year
plot(ridership.ts, xlab= "time", ylab="Ridership in (000s)", ylim=c(1300, 2300))
#Mean is around 1800

ridership.ts.3yrs <- window(ridership.ts, start = c(1997, 1), end = c(1999, 12))
# fit a linear regression model to the time series
ridership.lm <- tslm(ridership.ts ~ trend + I(trend^2))

# shorter and longer time series
par(mfrow = c(2, 1))
plot(ridership.ts.3yrs, xlab = "Time", ylab = "Ridership (in 000s)",
     ylim = c(1300, 2300))
plot(ridership.ts, xlab = "Time", ylab = "Ridership (in 000s)", ylim = c(1300, 2300))
# overlay the fitted values of the linear model
lines(ridership.lm$fitted, lwd = 2)

################################## EXAM   ######################################

library(tseries)
library(forecast)
library(fpp)

head(EuStockMarkets)
str(EuStockMarkets)
tsData <- EuStockMarkets[, 1] # ts data, we need only one curve choose one column

str(tsData)  # values are around 1600
head(tsData)


decomposedRes <- decompose(tsData, type="mult") # components are dependent to each other
plot (decomposedRes) # see plot below

tsdisplay(tsData) # random walk # not good for prediction, there is no seasonality

########### Conmilk ################

# First (SEASONALITY): there is seasonality in ACF (Good for prediction)
condmilk<-condmilk
tsdisplay(condmilk)



# Second (NORMALIZATION): Convert data to normal distribution
#Transformation of a non-normal dependent variables into a normal shape
lambda = BoxCox.lambda(condmilk)
tsdata2 = BoxCox(condmilk, lambda=lambda)
tsdisplay(tsdata2)


#Third (STATIONARY): check if data is satitinarity then make it stationarity
adf = adf.test(tsdata2) 
kpss = kpss.test(tsdata2) 

adf # should be far from the 0 to be stationary - this time series is stationary (Dickey-Fuller always negative and should be far from the 0 to be stationarity) null Hypothesis = 0
kpss # it should be close to 0 to be stationary

#Making plots stationary
ndiffs(tsdata2)  # because it is stationarity do not show anything but we continue
tsdata3 = diff(tsdata2, differences = 1) # just one lag
plot.ts(tsdata3)
acf(tsdata3, lag.max = 20) # making the acf and pacf stationarity
pacf(tsdata3, lag.max = 20)
tsdisplay(tsdata3) # if check with before data, there was one non seasonality that is removed now.


# Four (Find the best Orders (P, I, Q), seasonality, priod )
#Automatic Selection Algorithm - Fast
auto.arima(tsdata2, trace= TRUE, ic ="aicc", approximation = FALSE) # without stepwise

#Auto Algorithm - Slow but more accurate
auto.arima(tsdata2, trace= TRUE, ic ="aicc", approximation = FALSE, stepwise = FALSE)

finalmodel = arima(tsdata2, order = c(1, 0, 0), seasonal = list(order = c(2,0,0), period = 12))
summary(finalmodel)
# MAD, MAPE should be really low and other value as well, because there are error term


# last step: (Checking the white noise)
# Residuals are Uncorrelated (White Noise)
# p > 0.05 then the residuals are independent (white noise)
tsdisplay(residuals(finalmodel))
Box.test(finalmodel$residuals, lag = 20, type = "Ljung-Box")
qchisq(0.05, 20, lower.tail = F)
# Observed Chi-squared 28.904 < 31.41 so we don't reject null hypothesis
# It means residuals are independent or uncorrelated (white noise) at lags 1-20.  

# predict the next 5 periods
Forecastmodel = forecast(finalmodel, h = 5) 
summary(Forecastmodel)



