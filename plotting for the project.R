library(dplyr)
if(!file.exists("./getdata"){dir.create("./getdata")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest <- "./getdata/dataset.zip"
downoad.file(fileurl,dest,method="curl")
if(!file.exists("dataset.zip)){unzip(destfile),exdir="getdata")}

# read test data
x_test<-read.table("./UCI HAR Dataset/test/x_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")

# read training data
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#reding features table 
features <- read.table("./UCI HAR Dataset/features.txt")

#reading activity table 
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")


## 1

# merge x , y to get new dataset
# x=value ,y=activity
x_dataset <- rbind(x_test,x_train)
y_dataset <- rbind(y_test,y_train)
subject_dataset <- rbind(subject_test, subject_train)

## 2

#searching for mean , std 
mean_std <- grepl("mean()",features[,2]) | grepl("std()",features[,2])
#putting them as a new col in x_dataset
x_dataset <- x_dataset[,mean_std]

## 3

#update values with correct name
y_dataset[, 1] <- activities[y_dataset[, 1], 2]
names(y_dataset) <- "activity"

## 4

names(subject_dataset) <- "subject"
#in a single dataset
singledata <- cbind(x_dataset, y_dataset, subject_dataset)
colnames(singledata) <- c("subject",features[,2],"activity")

## 5

Data2<-aggregate(. ~subject + activity, ingledata, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)

