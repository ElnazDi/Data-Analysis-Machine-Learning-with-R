require(graphics)
require(utils)
library(ggplot2)

iris <-  iris
head(iris)
str(iris)
summary(iris)
table(iris$Species)

# when we do clustering should check the results by the first data (setosa 50, versicolor 50, virginica 50 )

# input is numerical, output is categorical
ggplot(iris, aes(Petal.Length, Petal.Width, color = Species)) + geom_point()
pairs(iris,col=iris$Species ) # alaki


#############################################################

## Exercise1: Code for k-means clustering

set.seed(20)
iriscluster <- kmeans(iris[,3:4],3,nstart=20) #kmeans(data, nummber of centroid clusters k, number of itteration)
iriscluster

#Cluster means:
#        Petal.Length Petal.Width
#1     4.269231    1.342308 ---> High value
#2     5.595833    2.037500 ---> High value
#3     1.462000    0.246000 ---> Low value

# Clustering vector:show clusters
# Within cluster sum of squares by cluster ---> Euclidian distance
#  (between_SS / total_SS =  94.3 %) how good is clustering ... greater is better
# total sum of squares = between + within
#  (between_SS / total_SS =  94.3 %) ---> show the within_SS is low





# K can be decided by box plot, elbow curve
# difference with supervised learning is here that we do not have Y, in the end we have to compare clusters and speices

iriscluster$cluster <- as.factor(iriscluster$cluster) # alaki
table(iriscluster$cluster, iris$Species) # Compare New with old

#     setosa versicolor virginica
#1      0         48         4
#2      0          2        46 ---> cluster two mostly virginica
#3     50          0         0 ---> cluster 3 only contain setosa


iriscluster <- kmeans(iris[,3:4],3,nstart=20)
iriscluster$betweenss
iriscluster$withinss
iriscluster$tot.withinss
iriscluster$totss  #between_ss + tot.withinss
# between / totss ---> give accuracy

## show all data colored based on species
plot(iris[c("Petal.Length","Petal.Width")],col=iriscluster$cluster)
plot(x=iris$Petal.Length, y=iris$Petal.Width, col=iriscluster$cluster)



## How many clusters do we require?
res1 <- kmeans(iris[,3:4],1,nstart=20)
res2 <- kmeans(iris[,3:4],2,nstart=20)
res3 <- kmeans(iris[,3:4],3,nstart=20)
res4 <- kmeans(iris[,3:4],4,nstart=20)
res5 <- kmeans(iris[,3:4],5,nstart=20)
res6 <- kmeans(iris[,3:4],6,nstart=20)

#wss <- c(sum(res1$withinss),sum(res2$withinss), sum(res3$withinss), sum(res4$withinss),
#         +      sum(res5$withinss), sum(res6$withinss))

wss <- c(res1$tot.withinss, res2$tot.withinss, res3$tot.withinss, res4$tot.withinss, res5$tot.withinss, res6$tot.withinss)
wss

names(wss) <- 1:6
barplot(wss)

## According to the barplot we need to choose at least 3 clusters

# Clustering on all variables - iris dataset
head(iris)
data <- iris[,-5]
class <- iris[,5] #origibal data

# How do we decide on the number of clusters? (az inja hame chi alaki vase kmeans just look at the principle component for your future)
wss <- 0
for (i in 1:15) wss[i] <- kmeans(data,centers=i)$tot.withinss
plot(1:15, wss, type="b",
     xlab="Number of Clusters",
     ylab="Within groups sum of squares",
     col="blue",
     pch=16,
     lwd=3)
# inflection point or "elbow of the graph"

#lower within, high  # clusters - Overfitting
#Higher within, low # clusters - Underfitting

# Running K-means using three clusters 
# (try other values)
results <- kmeans(data,3)
results
class(results)
results$size
results$cluster

# Interpret clusters formed
table(class,results$cluster)

Result=table(class,results$cluster)
write.table(Result, file="C:<\\Users\\379184\\Desktop\\Comcast\\R Code\\Cluster_Result.csv>")

# an alternative crosstabulation function
# that gives more detail
install.packages('gmodels')
library(gmodels)
CrossTable(class,results$cluster)

plot(data$Petal.Length,data$Petal.Width,
     col=results$cluster,pch=19)
plot(data$Petal.Length,data$Petal.Width,
     col=class,pch=19)
plot(data$Sepal.Length, data$Sepal.Width,
     col=results$cluster,pch=19)
plot(data$Sepal.Length, data$Sepal.Width,
     col=class,pch=19)

# visualize clusters

p <- princomp(data)
summary(p)
library(cluster) 
par(mar=c(4.2,5,2,2),oma=c(2,2,2,2))
clusplot(data,results$cluster,color=TRUE,shade=F,labels=0,
         main="Results for k = 3 clusters",xlab="Principal Component 1",
         ylab="Principal Component 2",cex.lab=1.5,cex.main=1.5)

results <- kmeans(data,4)
class(results)
results$size
results$cluster
table(class,results$cluster)


#######################################################
# Predicting k-means cluster memberships for new data #
#######################################################
head(iris)
data <- iris[,-5]
class <- iris[,5]
sub <- sample(nrow(iris),100)
tr_data <- data[sub,]
tr_class <- class[sub]

# How do we decide on the number of clusters?
# wss <- (nrow(data)-1)*sum(apply(data,2,var))
wss <- 0
for (i in 1:15) wss[i] <- kmeans(tr_data,centers=i)$tot.withinss
plot(1:15, wss, type="b",
     xlab="Number of Clusters",
     ylab="Within groups sum of squares")
# inflection point or "elbow of the graph"

# Running K-means using three clusters 
# (try other values)
results <- kmeans(tr_data,3)
results$size
results$cluster
table(tr_class,results$cluster)

##########################################################
## Exercise2: Hierarchical clustering
# Disadvantages : alot of ram memory needs, compare each  data points together to go on top
iris <-  iris


iris_dat <- iris[, -5]

# perform hierarchical clustering
hc <- hclust(dist(iris_dat),"ave") # averaging-linkage
hc
summary(hc)



# show the dendogram as string output
(dend1 <- as.dendrogram(hc))
str(dend1)          # "str()" method
str(dend1, max = 2, last.str =  "'") # only the first two sub-levels

# plot the dendrogram
plot(hc,hang=-2)

# how many does it get wrong ?
clusGroup <- cutree(hc, k=3)
sum(clusGroup != as.numeric(iris$Species))


# az inja alaki
install.packages("ape")
library("ape")
# Default plot
plot(as.phylo(hc), cex = 0.6, label.offset = 0.5)
hclust(dist(iris_dat),"ave")

# different types of plots
# fan
plot(as.phylo(hc), type = "fan")

# Unrooted
plot(as.phylo(hc), type = "unrooted", cex = 0.6,
     no.margin = TRUE)

# Cut the dendrogram into 3 clusters
colors = c("red", "blue", "green", "black")
clus3 = cutree(hc, 3)
plot(as.phylo(hc), type = "unrooted", tip.color = colors[clus3],
     label.offset = .5, cex = 0.7)
plot(as.phylo(hc), cex = 0.6, label.offset = 0.5, tip.color = colors[clus3])
summary(hc)

# how many does it get wrong ?
clusGroup <- cutree(hc, k=3)
sum(clusGroup != as.numeric(iris$Species))



#########################################################################
## Exercise3: Code for dbscan clustering
# you do not need to say number of clusters
# just need to give epsilon

install.packages("dbscan")
library(dbscan)


## first we need to find suitable epsilon parameter. We do this using a k-NN plot for k = dim +1 (setosa, virginica, ... =3)
data(iris)
iris_matrix <-  as.matrix(iris[,1:4])
kNNdistplot(iris_matrix, k=4)  # like elbow curve it show the epsilon number that is 0.5
abline(h=0.5, col="red", lty=2) # just to make line


# now run dbscan 
set.seed(1234)

res <-  dbscan(iris_matrix,eps=.4,minPts = 6) # we can do not write minPts it will choose the best value, if we encrease epsilon (KNN distance increase), number of the clusters will decrese and noise also decrese
res

#0  1  2  3  4 
#32 46 36 14 22 noise points are in class 0

pairs(iris_matrix,col=res$cluster +1L)

points(iris_matrix[res$cluster==0,], pch = 3, col = "grey") #alaki

# Display the hull plot
hullplot(iris_matrix, res$cluster)


###########################################

# Exercise4: EM clustering

install.packages("mclust")

library(MASS)
library(mclust)

mc <- Mclust(iris[,3:4], G=3) #3 Gaussians, i.e. 3 Clusters
mc

plot(mc, what=c("classification"), dimens=c(3,4)) # does not work
plot(mc)
2









#################################  EXAM #######################################


iris <- iris
head(iris)

# Unsupervised learning ---> we need only predictors
# k-means
library(ggplot2)
ggplot(
       iris,
       aes(Petal.Length, Petal.Width, color=Species) 
)+ 
        geom_point()


set.seed(20)
k.mean <- kmeans(iris[,3:4],3, nstart=20)
k.mean
k.mean$totss # one of the components
table(k.mean$cluster, iris$Species)

plot(iris$Petal.Length, iris$Petal.Width , col=k.mean$cluster)


res.1 <- kmeans(iris[,3:4], 1, nstart=20)
res.2 <- kmeans(iris[,3:4], 2, nstart=20)
res.3 <- kmeans(iris[,3:4], 3, nstart=20)
res.4 <- kmeans(iris[,3:4], 4, nstart=20)
res.5 <- kmeans(iris[,3:4], 5, nstart=20)
res.6 <- kmeans(iris[,3:4], 6, nstart=20)

wss <- c(res.1$tot.withinss, res.2$tot.withinss, res.3$tot.withinss, res.4$tot.withinss, res.4$tot.withinss, res.5$tot.withinss, res.6$tot.withinss)
wss
names(wss) <- 1:6
barplot(wss)


# DBSCAN
# we need epsilon(radius) + minpoint 
library(dbscan)
iris.matrix <- as.matrix(iris[,-5])
kNNdistplot(iris.matrix, k=4)
abline(h=0.4, col="red")

dbscan.model <- dbscan(iris.matrix, 0.4, minPts = 4)
dbscan.model
hullplot(iris.matrix, dbscan.model$cluster)

# EM
# randomly choose the distribution of cluter G(mean, standard deviation)
# E: estimate the distribution
# M: Maximom the log-likelihood
library(MASS)
library(mclust)
em.model <- Mclust(iris[,3:4], G=3)
plot(em.model)
# insert two

# Hierarical Clustering

iris_data <- iris[, -5]
hc <- hclust(dist(iris_data),"ave") # averaging-linkage
hc
summary(hc)

# show the dendogram as string output
(dend1 <- as.dendrogram(hc))
str(dend1)          # "str()" method
str(dend1, max = 2, last.str =  "'") # only the first two sub-levels

# plot the dendrogram
plot(hc,hang=-2)

# how many does it get wrong ?
clusGroup <- cutree(hc, k=3)
sum(clusGroup != as.numeric(iris$Species))



