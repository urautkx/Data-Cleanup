
##Script for Week4 Project in Coursera Course on Data Clean up. 

##This script converts raw data into tidy data as per the steps outlined in CodeBook.md

library(stringr)
library(dplyr)
library(tidyr)

##Train data in under "train" directory and test data under "test" directory

pathtrain<-"UCI HAR Dataset/train/"
pathtest<-"UCI HAR Dataset/test/"

##Read the activity labels from y_train.txt for the training data
##Read the activity labels from y_test.txt for the test data
y_trainFilePath = paste0(pathtrain,"y_train.txt")
trainLabels<-read.table(y_trainFilePath)

y_testFilePath=paste0(pathtest,"y_test.txt")
testLabels<-read.table(y_testFilePath)

##Combine the training lables and test labels into one data frame
combinedActivityLabels<-rbind(trainLabels,testLabels)


##Read the subject data from subject_train.txt for the training data
##Read the subject data from subject_text.txt for the test data
subjectTrainFilePath = paste0(pathtrain,"subject_train.txt")
subjectTrainLabels<-read.table(subjectTrainFilePath)

subjectTestFilePath = paste0(pathtest,"subject_test.txt")
subjectTestLabels<-read.table(subjectTestFilePath)

##Combine the subject ids for training and test data into one data frame
combinedSubjectIds<-rbind(subjectTrainLabels,subjectTestLabels)

##Read the train data from X_train.txt
##Read the test data from X_test.txt
x_trainFilePath = paste0(pathtrain,"X_train.txt")
trainData<-read.table(x_trainFilePath)

x_testFilePath = paste0(pathtest,"X_test.txt")
testData<-read.table(x_testFilePath)

##Read the features file to read the column names
featuresFilePath = "UCI HAR Dataset/features.txt"
columnNames<-read.table(featuresFilePath)

##Label the fields as ColNum and COlumnName for the data read from features.txt
columnNames<-rename(columnNames, colNum=V1)
columnNames<-rename(columnNames, columnName=V2)


##Extract the features that contain either "mean" or "std" int a new data frame
columnsOfInterest<-filter(columnNames,grepl("mean", columnName, ignore.case = FALSE))
columnsOfInterest<-rbind(columnsOfInterest,filter(columnNames,
                                           grepl("std", columnName, ignore.case = FALSE)))

##Prefix "V" in front of the column number 
columnsOfInterest$colNum<-paste0("V",columnsOfInterest$colNum)

##Now use the filtered set of features to filter the columsn of interest
##from training data and test data 
##Rename the column names to match the feature names from features.txt file
trainData1<-select(trainData,one_of(columnsOfInterest$colNum))
trainData1<-setNames(trainData1,columnsOfInterest$columnName)

testData1<-select(testData,one_of(columnsOfInterest$colNum))
testData1<-setNames(testData1,columnsOfInterest$columnName)

##Merge the rows in training and test data, which have same set of columns 
##to create a combined data set
combinedData<-rbind(trainData1,testData1)

##Bind subject Ids and activity labels to each of the rows of combined data set
combinedData<-mutate(combinedData,subjectId=combinedSubjectIds$V1, 
                                  activityLabel=combinedActivityLabels$V1)


##Read the activity labels (1:6) and activity names ("WALKING","LAYING"etc) 
##from activity_labels.txt
activityLabelsFile = "UCI HAR Dataset/activity_labels.txt"
activityLabels<-read.table(activityLabelsFile)

##Add activity name to each row based on the activity code in that row
##in the combinedData dataframe
##The function fn below looks up the corresponding activity name for 
##the actvity label 
fn<- function(x){activityLabels[x,2]}
combinedData1<-transform(combinedData,activityName=fn(activityLabel))

##Group the combined data by activity names
combinedData1<-group_by(combinedData1,activityName,subjectId)

##Find the mean of the all the columns grouped by activity name and subject id
meanOfCombinedData<-combinedData1%>%summarise_if(is.numeric,mean)

##Write the results of the above step (the "tidy data") into a file
write.table(meanOfCombinedData,file="Tidy.txt",col.names=TRUE,row.names=FALSE)

##Write the variable names (headers) for the tidy data into a file 
write.table(names(meanOfCombinedData),file="Features_Tidy.txt",col.names=FALSE)
