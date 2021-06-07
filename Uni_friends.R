#My Code:
friends <- data.frame( 
  friend_id = c (1:5), 
  friend_name = c("Elnaz","Ashta","Hawenalker","Kiriti","Kalyani"), 
  height = c(166, 170, 167.64, 160, 161.544), 
  weight = c(67,43, 55, 66, 48), 
  age = c(33,24, 23,25,25),
  shoesize = c(38,38,38, 36,36),
  stringsAsFactors = FALSE ) 

#friends <- data.frame( 
#  height = c(183, 170, 165, 160, 166), 
#  weight = c(65, 66, 55, 48, 67), 
#  age = c(22, 25, 23, 25, 33),
#  shoesize = c(9, 7, 5, 5, 5)
#)

head(friends)
summary(friends)
str(friends)

boxplot(friends$height)

library(ggplot2)
ggplot(
  data = friends,
  aes(height)
) +
  geom_density()

# what do you want to predict? Y = weight, X = Height
#Basic plot for height and weight
plot(
  x = friends$height,
  y = friends$weight,
  main = "Height and Width",
  xlab = "Weight (kg)",
  ylab = "Height (cm)"
)

#Overall corrolation
cor(friends[,3:6])
#cor(friends[,])

#weight   -0.44280336  1.0000000  0.60958339 -0.1027331


# Create a Linear Regression Model
model <- lm(formula = weight ~ height, data = friends)

summary(model)


abline(model)


predict(object = model, newdata = data.frame(height = c(170)))


# Professor : 177 height, shoe size: 8
# Abinav : 182 height, shoe size: 9

################################################################################


