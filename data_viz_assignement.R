df <- read.csv("data.csv", header = FALSE)

head(df)
summary(df)

table(df$V4)

length(unique(df$V4))
length(unique(df$V3))
length(unique(df$V7))

str(df)

df$V5 <- as.integer(df$V5)  

