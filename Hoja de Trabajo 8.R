library(rpart)
library(rpart.plot)

iris = read.csv('iris.csv')

iris$Species = as.factor(iris$Species)

###### Boxplots para cada variable #######
plot(x=iris$Species,y=iris$Sepal.Length)
plot(x=iris$Species,y=iris$Sepal.Width)
plot(x=iris$Species,y=iris$Petal.Length)
plot(x=iris$Species,y=iris$Petal.Width)

######## Modelos #########

#Modelos individuales
t1 = rpart(Species ~ Sepal.Length,data=iris,method='class')
prp(t1)

t2 = rpart(Species ~ Sepal.Width,data=iris,method='class')
prp(t2)

t3 = rpart(Species ~ Petal.Length,data=iris,method='class')
prp(t3)

t4 = rpart(Species ~ Petal.Width,data=iris,method='class')
prp(t4)

#Modelo con todas las variables
tree = rpart(Species ~ Sepal.Length+Sepal.Width+Petal.Length+Petal.Width,data=iris,method='class')
prp(tree)

predict(tree,data=iris,type='class')
