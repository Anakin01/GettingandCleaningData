##########################################################################
## Getting and cleaning Data - Coursera
## run_analysis.R
##########################################################################
library(plyr)
setwd("C:/work")

## Download file
temp <- tempfile()
fileUrl<-"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists(fileUrl)) {
     download.file(fileUrl,temp)
}
unzip(temp,list=F,overwrite=T)
unlink(temp)

setwd("C:/work/UCI HAR Dataset/")

# Read variables and activities from files
features     <- read.table('./features.txt',header=FALSE)
activities   <- read.table('./activity_labels.txt',header=FALSE)

# Read train data
subjectTrain <- read.table('./train/subject_train.txt',header=FALSE)
xTrain       <- read.table('./train/x_train.txt',header=FALSE)
yTrain       <- read.table('./train/y_train.txt',header=FALSE)

# Read test data
subjectTest <- read.table('./test/subject_test.txt',header=FALSE)
xTest       <- read.table('./test/x_test.txt',header=FALSE)
yTest       <- read.table('./test/y_test.txt',header=FALSE)

# Assign column names to the test and train data 
colnames(subjectTest) <- "subjectId"
colnames(xTest)       <- features[,2] 
colnames(yTest)       <- "activityId"

colnames(subjectTrain)<- "subjectId"
colnames(xTrain)      <- features[,2] 
colnames(yTrain)      <- "activityId"

colnames(activities)  <- c('activityId','activityName')

# 1. Merge the training and the test sets to create one data set.

# Create the training set 
trainingData <- cbind(yTrain,subjectTrain,xTrain)

# Create the test set 
testData <- cbind(yTest,subjectTest,xTest)

# Combine training and test data to create a final data set
allData <- rbind(trainingData,testData)

# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
colsSelected<-grepl("-(mean|std)\\(\\)", names(allData))|grepl("activity",names(allData))|grepl("subject",names(allData))

allData <- allData[colsSelected]

# 3. Use descriptive activity names to name the activities in the data set

# Merge with the acitivities table to include descriptive activity names
resultData <- merge(activities,allData,by='activityId',all=TRUE)
result<-resultData[c(2:69)] ## we exclude activityId column

# 4. Appropriately label the data set with descriptive activity names. 
colresultname<-names(result)
colresultname<- gsub("\\()","",colresultname)
colresultname<-gsub("-std","StdDev",colresultname)
colresultname<-gsub("-mean","Mean",colresultname)
colresultname<-gsub("[()-]", "", colresultname)
colresultname<-gsub("BodyBody", "Body", colresultname)
colnames(result)<-colresultname

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

tidyData<-ddply(result,.(activityName,subjectId),numcolwise(mean))

write.table(tidyData,'./tidyData.txt',row.names=FALSE,sep="\t");

##########################################################################
## run_analysis.R  (end)  
##########################################################################
