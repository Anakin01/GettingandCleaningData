GettingandCleaningData
======================

Coursera Getting and Cleaning Data course

Introduction


The data for this project is in 
http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The  script run_analysis.R, first downloads the files and then perform the following steps :

 1. Merge the training and the test sets to create one data set.
    Using cbind and rbind
 
 2. Extract only the measurements on the mean and standard deviation for each measurement. 
    With grepl we build a logical vector to select the columns 
 
 3. Use descriptive activity names to name the activities in the data set
    With Merge we can include activity names
 
 4. Appropriately label the data set with descriptive activity names.
    With gsub function ew transform the names of some variables.
  
 5. Creates a second, independent tidy data set with the average of each variable for each activity 
    and each subject. 
    To obtain the independent tidy set we use ddply function
