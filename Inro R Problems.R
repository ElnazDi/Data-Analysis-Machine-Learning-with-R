
#1. Build two sequences a and b with numbers 1 to 5 and 6 to 10. Use functions seq() and :

a <- seq(1,5) #this
b <- seq(6,10) #this
c <- seq(from=10, to=14, by=2)
rep(seq(from=5, to=10, by=0.07), times=2)
print(a)
print(b)
print(c)

#2. Learn to use more arguments within seq() and build some vectors.

c <-seq(from=10, to=20, by=0.5)
print(c)

d <-seq(5,10, by=0.3)
print(d)

#3. Use rep() to build vectors.

rep(1:4)
rep(1:4, 2)
rep(1:4, each=2)
rep(1:4, c(2,2,2,2))
rep(1:4, each=2, len=4)
rep(1:4, each=2, len=8)
rep(1:4, each=2, times=3)

rep(2,3) #this

#4. R comes with a many functions to generate random numbers with different distributions. 
#Check function rnorm() and its arguments.

rnorm(10)
rnorm(10, m = 0, s = 1)


#5. Generate a matrix m of dimension 4 rows and 5 columns with random numbers. Use function matrix().

M = matrix(c(3,3,5,7,2,1,3,3,5,7,2,13,3,5,7,2,13,33,3,5) ,nrow = 4, ncol=5, byrow = TRUE)
print(M)


M = matrix(c(rnorm(20)) ,nrow = 4, ncol=5, byrow = TRUE)
print(M)


#6. Create a list l with a vector v and matrix m. Name the elements of the list "v" and "m"

l <- list(v<- c(1,2,3), m<- matrix(1:9, nrow = 3, ncol = 3 ,byrow = TRUE))
print(l) 

l <- list(c(1,2,3), matrix(1:9, nrow = 3, ncol = 3 ,byrow = TRUE))
names(l) <- c("v","m")
print(l)
print(l$v)
print(l$m)

#7. Create a vector x with values from 1 to 10. Check for values <= 5

x <- c(1:10)
for (val in x) {
  if(val <= 5){
    print(val)
  }
}

x<- c(1:10) #this
print(x<= 5) #this
print(as.numeric(x<=5))

#8. Index a)the 3.row in matrix m, 2)the 4 row in matrix m and 3)value in 1row,1 column.
l$m[1:3,]
l$m[1,1]

l$m[1,3]
l$m[2,1]
l$m[1,1]

l[4] <- "New Element"
print(l)

print(m[3,]) #this
print(m[4,]) #this
print(m[1,1]) #this


#9. How to you get the values of the second row in your matrix m from list l?

l$m[2,] #this
l[["m"]][2,] #diffrent way

#10. Create a data frame of your friends with 10 different heights and weights

myFreinds <- data.frame( 
  friend_id = c (1:10), 
  friend_name = c("Atena","Negar","Elham","Gina","Sanaz","Farnaz","Hassan","Fariba","Hamid","Setia"), 
  height = c(166, 155, 167, 163, 163, 167, 185, 159, 175, 100), 
  weight = c(86, 59, 65, 61, 64, 95, 103, 70, 95, 20), 
  stringsAsFactors = FALSE ) 
print(myFreinds) 



----------------------------------------------------------------------------------------


