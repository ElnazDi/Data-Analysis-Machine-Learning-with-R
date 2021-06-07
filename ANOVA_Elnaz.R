# IMPORT AS FACTOR
#TASK 1
# ANOVA (Analysis of variance)
#1. Formulate the hypothesis for the ANOVA test.

# Answer: The mean for all three groups are same. (Groups are similar)
# Here Predictors are categorical and the respose is metric --> can not use t-test -> F-test is possible


foils.data <- data.frame( 
  g1 = c(128, 137, 137, 142), 
  g2 = c(117, 137, 139, 140), 
  g3 = c(133, 140, 141, 142)
)

head(foils.data)
summary(foils.data) 

Stacked_Groups <- stack(foils.data)
head(Stacked_Groups)

# predictors are ind (categorical)
# responce is metric
# we need anova 

Anova_Results <- aov(values ~ ind ,data = Stacked_Groups)
summary(Anova_Results)
Anova_Results

# eta-tes ---> SSB / SST Do not consider number of sample and variables- should be high (to explain more variance)
# f-statistic ---> MSB / MSW ---> should be high to reject H0

# here accept the H0 , results are not significant 
#because p-value is big, F static is low it should be bigger than 1, or f-table

# f-table can find by df(between k-1) and df(within N-k)

#F high ---> Reject (Results are highly significant)
#P high ---> Accept







# TASK 2
#load data:
#getwd()
#path <- "/Users/dehkharghanielnaz/Desktop/SRH Classes/Analytics 1/Slides/R Files/dosis_study.csv"
#medicine.data <- read.csv(file=path, header = TRUE, stringsAsFactors = TRUE, sep = ";" )

medicine.data <- dosis_study

#Descriptive statistics:
head(medicine.data)
tail(medicine.data)

str(medicine.data)
summary(medicine.data)
# Independ variables are categorical (Dose + Gender)
# Dependent variable is metric

plot1 <- boxplot(as.numeric(medicine.data$Score))

table(medicine.data$Dose)
table(medicine.data$Gender)

model <- aov(medicine.data$Score ~ medicine.data$Dose + medicine.data$Gender)
summary(model)
model
#                      Df Sum Sq Mean Sq F value   Pr(>F)    
#medicine.data$Dose    2  253.4  126.70  34.676 4.61e-08 *** MSB / MSW = F- Statistic
#medicine.data$Gender  1    0.3    0.30   0.082    0.777     MSB   

#Residuals            26   95.0    3.65                      MSW  <----            

# to create an synergistic effect, replace the plus symbol (+) by an asterisk (*) - two factor
model.2 <- aov(medicine.data$Score ~ medicine.data$Dose * medicine.data$Gender)
summary(model.2)
model.2

