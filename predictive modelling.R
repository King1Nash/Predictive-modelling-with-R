library(tidyverse)
library(ggplot2)
library(caret)
tc<-trainControl(method = 'LOOCV')
m<-train(mpg~.,
         data = mtcars,
         method='glm',
         trControl=tc)
summary(m)
names(m)
m$results
#k-fold cross validation
tk<-trainControl(method = 'LOOCV',number = 10)
mk<-train(mpg~.,
         data = mtcars,
         method='lm',
         trControl=tk)
mk
names(mk)
nrow(mk$trainingData)
#repeats
tp <- trainControl(method = "repeatedcv",
                   number = 10, repeats = 100)
mp <- train(mpg ~ .,
           data = mtcars,
          
           method = "lm",
           trControl = tp)
mp
duplicated(mtcars)
sum(duplicated(mtcars))
#bootstraps
tc <- trainControl(method = "boot",
                   number = 999)
mb <- train(mpg ~ .,
           data = mtcars,
           
           method = "lm",
           trControl = tc)
mb
names(mb)
mb$bestTune
mb$modelType
mb$modelInfo
summary(mb)
view(mtcars)
varImp(mb)
dotPlot(varImp(mb))
data()

require(graphics)
pairs(mtcars, main = "mtcars data", gap = 1/4)
coplot(mpg ~ disp | as.factor(cyl), data = mtcars,
       panel = panel.smooth, rows = 1)




