# Load libraries
library(tidyverse)
library(corrplot)
library(gridExtra)
library(GGally)
library(knitr)

# Read the stats
getwd()
wines <- read.csv("/Users/dehkharghanielnaz/Desktop/SRH Classes/Analytics 1/Slides/R Files/Wine.csv")

# Remove the Type column
wines <- wines[, -14]

#Exploring and visualizing data

# Histogram for each Attribute
wines %>%
  gather(Attributes, value, 1:13) %>%
  ggplot(aes(x=value, fill=Attributes)) +
  geom_histogram(colour="black", show.legend=FALSE) +
  facet_wrap(~Attributes, scales="free_x") +
  labs(x="Values", y="Frequency",
       title="Wines Attributes - Histograms") +
  theme_bw()


# Density plot for each Attribute
wines %>%
  gather(Attributes, value, 1:13) %>%
  ggplot(aes(x=value, fill=Attributes)) +
  geom_density(colour="black", alpha=0.5, show.legend=FALSE) +
  facet_wrap(~Attributes, scales="free_x") +
  labs(x="Values", y="Density",
       title="Wines Attributes - Density plots") +
  theme_bw()


# Boxplot for each Attribute  
wines %>%
  gather(Attributes, values, c(1:4, 6:12)) %>%
  ggplot(aes(x=reorder(Attributes, values, FUN=median), y=values, fill=Attributes)) +
  geom_boxplot(show.legend=FALSE) +
  labs(title="Wines Attributes - Boxplots") +
  theme_bw() +
  theme(axis.title.y=element_blank(),
        axis.title.x=element_blank()) +
  ylim(0, 35) +
  coord_flip()


# Relation between variables

# Correlation matrix 
corrplot(cor(wines), type="upper", method="ellipse", tl.cex=0.9)

# Relationship between Phenols and Flavanoids
ggplot(wines, aes(x=Total_Phenols, y=Flavanoids)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE) +
  labs(title="Wines Attributes",
       subtitle="Relationship between Phenols and Flavanoids") +
  theme_bw()

# Normalization
winesNorm <- as.data.frame(scale(wines))

# Original data
p1 <- ggplot(wines, aes(x=Alcohol, y=Malic_Acid)) +
  geom_point() +
  labs(title="Original data") +
  theme_bw()

# Normalized data 
p2 <- ggplot(winesNorm, aes(x=Alcohol, y=Malic_Acid)) +
  geom_point() +
  labs(title="Normalized data") +
  theme_bw()

# Subplot
grid.arrange(p1, p2, ncol=2)

# Execution of k-means with k=3
set.seed(1234)

wines_k3 <- kmeans(winesNorm, centers=3)
  
# Mean values of each cluster
aggregate(wines, by=list(wines_k3$cluster), mean)

# Visualizing Clustering
ggpairs(cbind(wines, Cluster=as.factor(wines_k3$cluster)),
        columns=1:6, aes(colour=Cluster, alpha=0.5),
        lower=list(continuous="points"),
        upper=list(continuous="blank"),
        axisLabels="none", switch="both") +
  theme_bw()

