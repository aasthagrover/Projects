# Read the training dataset
train.dataset=read.csv("C:/Users/aasth/Desktop/ADS/blogdata-Train.csv",header=TRUE,sep=",")
train.dataset

#attach the training dataset
attach(train.dataset)

# for saturday dataset 2012/3/31-saturday
install.packages("plyr")
library(plyr)

test.dataset=read.csv("C:/Users/aasth/Desktop/ADS/blogData_test-2012.03.31.01_00-saturday.csv",header=TRUE,sep=",")
test.dataset

testdatasaturday<-subset(test.dataset, var268==1 & var273==1)
testdatasaturday


data1<-subset(train.dataset, var273==1 & var268==1)
data1


# for friday dataset 2012/3/30-friday
test.dataset.friday=read.csv("C:/Users/aasth/Desktop/ADS/blogData_test-2012.03.30.01_00-Friday.csv",header=TRUE,sep=",")
test.dataset.friday

testdatafriday<-subset(test.dataset.friday, var267==1 & var272==1)
testdatafriday

data2<-subset(train.dataset, var272==1 & var267==1)
data2

# for thursday dataset 2012/3/29-thursday
test.dataset.thursday=read.csv("C:/Users/aasth/Desktop/ADS/blogData_test-2012.03.29.01_00-Thursday.csv",header=TRUE,sep=",")
test.dataset.thursday

testdatathursday<-subset(test.dataset, var266==1 & var271==1)
testdatathursday

data3<-subset(train.dataset, var273==1 & var268==1)
data3

# for wednesday dataset 2012/3/28-wednesday
test.dataset.wednesday1=read.csv("C:/Users/aasth/Desktop/ADS/blogData_test-2012.03.28.01_00-Wednesday.csv",header=TRUE,sep=",")
test.dataset.wednesday1

testdatawednesday1<-subset(test.dataset.wednesday1, var265==1 & var270==1)
testdatawednesday1

data4<-subset(train.dataset, var270==1 & var265==1)
data4

# for tuesday dataset 2012/3/27-tuesday
test.dataset.tuesday=read.csv("C:/Users/aasth/Desktop/ADS/blogData_test-2012.03.27.01_00-Tuesday",header=TRUE,sep=",")
test.dataset.tuesday

testdatatuesday<-subset(test.dataset, var264==1 & var276==1)
testdatatuesday

data5<-subset(train.dataset, var270==1 & var265==1)
data5

# for monday dataset 2012/3/26-monday
test.dataset.monday=read.csv("C:/Users/aasth/Desktop/ADS/blogData_test-2012.03.26.01_00-Monday",header=TRUE,sep=",")
test.dataset.monday

testdatamonday<-subset(test.dataset, var263==1 & var275==1)
testdatamonday

data6<-subset(train.dataset, var270==1 & var265==1)
data6

# for sunday dataset 2012/3/26-sunday
test.dataset.sunday=read.csv("C:/Users/aasth/Desktop/ADS/blogData_test-2012.03.25.01_00-Sunday",header=TRUE,sep=",")
test.dataset.sunday

testdatasunday<-subset(test.dataset, var269==1 & var274==1)
testdatasunday

data7<-subset(train.dataset, var270==1 & var265==1)
data7

# for wednesday dataset 2012/2/29-wednesday
test.dataset.wednesday2=read.csv("C:/Users/aasth/Desktop/ADS/blogData_test-2012.02.29.00_00-Wednesday.csv",header=TRUE,sep=",")
test.dataset.wednesday2

testdatawednesday2<-subset(test.dataset.wednesday2, var265==1 & var270==1)
testdatawednesday2

data8<-subset(train.dataset, var270==1 & var265==1)
data8


# result1 = lm(var281 ~ var52+var57+var53+var58+var54+var59+var277+var278+var279+var280, data=testdatasaturday) 
# result1
# 
# 
# summary(result1)


# regression with bagging 
install.packages("foreach")
library(foreach)
length_divisor<-2
iterations<-100
predictions<-foreach(m=1:iterations,.combine=cbind) %do% {
  training_positions <- sample(nrow(data2), size=floor((nrow(data2)/length_divisor)))
  train_pos<-1:nrow(data2) %in% training_positions
  lm_fit<-lm(var281 ~ var52+var57+var53+var58+var54+var59+var55+var60+var277+var278+var279+var280,data=data2[train_pos,])
  predict(lm_fit,newdata=testdatafriday)
}

summary(lm_fit)
predictions<-rowMeans(predictions)
error<-sqrt((sum((testdatafriday$var281-predictions)^2))/nrow(testdatafriday))
error

RMSE.rtree =sqrt(mean((predictions - testdatafriday$var281)^2))
RMSE.rtree

plot(predictions)



#CART
library(rpart)

trainset1<-subset(train.dataset, var267==1 & var272==1)
trainset1

frmla =var281 ~ var52+var57+var53+var58+var54+var59+var55+var60
fit = rpart(frmla, method="anova", data=trainset1)

printcp(fit) # display the results
plotcp(fit) # visualize cross-validation results
summary(fit) 

pred=predict(fit,testdatafriday)
pred

summary(pred)

RMSE.rtree =sqrt(mean((pred - testdatafriday$var281)^2))
RMSE.rtree

MAE.rtree <- mean(abs(pred-testdatafriday$var281))
MAE.rtree
 
 
 
 
#Randomforest 
install.packages("randomForest")
library(randomForest)
fitted <- randomForest(var281 ~ var52+var57+var53+var58+var54+var59+var55+var60, trainset1)
print(fitted)

summary(fitted)

predicted= predict(fit,testdatafriday)

summary(predicted)

RMSE.rtree =sqrt(mean((predicted - testdatafriday$var281)^2))
RMSE.rtree





