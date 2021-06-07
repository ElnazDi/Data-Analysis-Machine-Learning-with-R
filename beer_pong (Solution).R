
# Define sample data
beer.pong <- data.frame(
              throw = c(1:20),
              success = c(1,1,0,0,1,0,0,1,1,0,0,1,0,0,1,1,0,0,0,0),
              consum = c(6,12,12,12,18,18,18,24,30,30,30,36,36,36,42,48,48,48,48,48)
)

# Summary of data frame
summary(beer.pong)
# Correlation of variables
cor(beer.pong)

# Scatter plot 
plot(x = beer.pong$throw, y = beer.pong$consum)
boxplot(consum ~ success, data = beer.pong)

# Total score of results
sum(beer.pong$success)

# Percentage of success
mean(beer.pong$success)

# Model
fit_lr <- glm(success ~ throw + consum, data=beer.pong,
           family="binomial")
summary(fit_lr)

# Probabilities as part of the data frame
prob <- predict(fit_lr,type="response",beer.pong) 
beer.pong$prob=prob

# Confusion Matrix
library(caret)
confusionMatrix(table(data = as.numeric(prob>0.5), reference = beer.pong$success))

# Area under the curve (AUC)
library(pROC)
plot_lg <- roc(beer.pong$success, beer.pong$prob)
print(plot(plot_lg))

# Predict new values
t <- predict(fit_lr, newdata = data.frame(throw = 25, consum = 30), type = "response")
t

######################BEER PONG GAME IN R###########################

beer_consumption <- data.frame(
  throw = c(1:10),
  success = c(1,1,0,0,0,0,1,1,0,1),
  consumption = c(6, 12, 12, 12, 12, 12, 18, 24, 24, 30)
)


cor(beer_consumption)

#Linear Regression Model
model <- glm(
  formula = success ~ throw + consumption,
  data = beer_consumption)

summary(model)


predict(
  object = model,
  newdata = data.frame(
    throw = c(6),
    consumption = c(12)
  )
)
