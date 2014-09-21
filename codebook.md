General Information

A description of this project can be found at The UCI Machine Learning Repository


http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly
partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components,
therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 



Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.



subject  - The participant ID  is contained in the files subject_test.txt and subject_train.txt

activity - The label of the activity performed when the corresponding measurements were taken
           Values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
           They are contained en the file  activity_labels.txt
           
features - the names of all the other variables  (file features.txt)

ytrain   - values of the training data (file ytrain.txt)

ytest    - values of the test data     (file ytest.txt)

xtrain   - activities of the traianing data  (file xtrain.txt)      
xtest    - activities of the test data (file xtest.txt)


After downloading the files, we proceed with the transformations


We use a grepl function to extract only the measurements on the mean and standard deviation for each measurement.


To appropriately label the data set with descriptive activity names, we use the gsub function replacing
std by StdDev, mean by Mean, () by "" or typos like BodyBody by Body. 

Variables names after transformations  :
 
tBodyAccMeanX
tBodyAccMeanY
tBodyAccMeanZ
tBodyAccStdDevX
tBodyAccStdDevY
tBodyAccStdDevZ
tGravityAccMeanX
......


All values are floating point numbers, normalized to have values ranging from -1 to 1

