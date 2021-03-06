Code Book
========================================================

This Code Book contains a description of tidy data set **tidy_data.txt**.

The aggregated data from Human Activity Recognition Using Smartphones Data Set published in 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The dataset contains a record for each individual-activity combination.  
There is 30 individuals numbered from 1 to 30.  
There is 6 activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.  

For each combination individual-activity, the dataset includes the mean of several features releved by embedded accelerometer and gyroscope.


Variables description
=======================================================================

***indiv:*** Individual ID  
***activity:*** activity   
***tBodyAcc-mean()-X:*** Average of feature   tBodyAcc-mean()-X   
***tBodyAcc-mean()-Y:*** Average of feature   tBodyAcc-mean()-Y   
***tBodyAcc-mean()-Z:*** Average of feature   tBodyAcc-mean()-Z   
***tGravityAcc-mean()-X:*** Average of feature   tGravityAcc-mean()-X   
***tGravityAcc-mean()-Y:*** Average of feature   tGravityAcc-mean()-Y   
***tGravityAcc-mean()-Z:*** Average of feature   tGravityAcc-mean()-Z   
***tBodyAccJerk-mean()-X:*** Average of feature   tBodyAccJerk-mean()-X   
***tBodyAccJerk-mean()-Y:*** Average of feature   tBodyAccJerk-mean()-Y   
***tBodyAccJerk-mean()-Z:*** Average of feature   tBodyAccJerk-mean()-Z   
***tBodyGyro-mean()-X:*** Average of feature   tBodyGyro-mean()-X   
***tBodyGyro-mean()-Y:*** Average of feature   tBodyGyro-mean()-Y   
***tBodyGyro-mean()-Z:*** Average of feature   tBodyGyro-mean()-Z   
***tBodyGyroJerk-mean()-X:*** Average of feature   tBodyGyroJerk-mean()-X   
***tBodyGyroJerk-mean()-Y:*** Average of feature   tBodyGyroJerk-mean()-Y   
***tBodyGyroJerk-mean()-Z:*** Average of feature   tBodyGyroJerk-mean()-Z   
***tBodyAccMag-mean():*** Average of feature   tBodyAccMag-mean()   
***tGravityAccMag-mean():*** Average of feature   tGravityAccMag-mean()   
***tBodyAccJerkMag-mean():*** Average of feature   tBodyAccJerkMag-mean()   
***tBodyGyroMag-mean():*** Average of feature   tBodyGyroMag-mean()   
***tBodyGyroJerkMag-mean():*** Average of feature   tBodyGyroJerkMag-mean()   
***fBodyAcc-mean()-X:*** Average of feature   fBodyAcc-mean()-X   
***fBodyAcc-mean()-Y:*** Average of feature   fBodyAcc-mean()-Y   
***fBodyAcc-mean()-Z:*** Average of feature   fBodyAcc-mean()-Z   
***fBodyAccJerk-mean()-X:*** Average of feature   fBodyAccJerk-mean()-X   
***fBodyAccJerk-mean()-Y:*** Average of feature   fBodyAccJerk-mean()-Y   
***fBodyAccJerk-mean()-Z:*** Average of feature   fBodyAccJerk-mean()-Z   
***fBodyGyro-mean()-X:*** Average of feature   fBodyGyro-mean()-X   
***fBodyGyro-mean()-Y:*** Average of feature   fBodyGyro-mean()-Y   
***fBodyGyro-mean()-Z:*** Average of feature   fBodyGyro-mean()-Z   
***fBodyAccMag-mean():*** Average of feature   fBodyAccMag-mean()   
***fBodyBodyAccJerkMag-mean():*** Average of feature   fBodyBodyAccJerkMag-mean()   
***fBodyBodyGyroMag-mean():*** Average of feature   fBodyBodyGyroMag-mean()   
***fBodyBodyGyroJerkMag-mean():*** Average of feature   fBodyBodyGyroJerkMag-mean()   
***tBodyAcc-std()-X:*** Average of feature   tBodyAcc-std()-X   
***tBodyAcc-std()-Y:*** Average of feature   tBodyAcc-std()-Y   
***tBodyAcc-std()-Z:*** Average of feature   tBodyAcc-std()-Z   
***tGravityAcc-std()-X:*** Average of feature   tGravityAcc-std()-X   
***tGravityAcc-std()-Y:*** Average of feature   tGravityAcc-std()-Y   
***tGravityAcc-std()-Z:*** Average of feature   tGravityAcc-std()-Z   
***tBodyAccJerk-std()-X:*** Average of feature   tBodyAccJerk-std()-X   
***tBodyAccJerk-std()-Y:*** Average of feature   tBodyAccJerk-std()-Y   
***tBodyAccJerk-std()-Z:*** Average of feature   tBodyAccJerk-std()-Z   
***tBodyGyro-std()-X:*** Average of feature   tBodyGyro-std()-X   
***tBodyGyro-std()-Y:*** Average of feature   tBodyGyro-std()-Y   
***tBodyGyro-std()-Z:*** Average of feature   tBodyGyro-std()-Z   
***tBodyGyroJerk-std()-X:*** Average of feature   tBodyGyroJerk-std()-X   
***tBodyGyroJerk-std()-Y:*** Average of feature   tBodyGyroJerk-std()-Y   
***tBodyGyroJerk-std()-Z:*** Average of feature   tBodyGyroJerk-std()-Z   
***tBodyAccMag-std():*** Average of feature   tBodyAccMag-std()   
***tGravityAccMag-std():*** Average of feature   tGravityAccMag-std()   
***tBodyAccJerkMag-std():*** Average of feature   tBodyAccJerkMag-std()   
***tBodyGyroMag-std():*** Average of feature   tBodyGyroMag-std()   
***tBodyGyroJerkMag-std():*** Average of feature   tBodyGyroJerkMag-std()   
***fBodyAcc-std()-X:*** Average of feature   fBodyAcc-std()-X   
***fBodyAcc-std()-Y:*** Average of feature   fBodyAcc-std()-Y   
***fBodyAcc-std()-Z:*** Average of feature   fBodyAcc-std()-Z   
***fBodyAccJerk-std()-X:*** Average of feature   fBodyAccJerk-std()-X   
***fBodyAccJerk-std()-Y:*** Average of feature   fBodyAccJerk-std()-Y   
***fBodyAccJerk-std()-Z:*** Average of feature   fBodyAccJerk-std()-Z   
***fBodyGyro-std()-X:*** Average of feature   fBodyGyro-std()-X   
***fBodyGyro-std()-Y:*** Average of feature   fBodyGyro-std()-Y   
***fBodyGyro-std()-Z:*** Average of feature   fBodyGyro-std()-Z   
***fBodyAccMag-std():*** Average of feature   fBodyAccMag-std()   
***fBodyBodyAccJerkMag-std():*** Average of feature   fBodyBodyAccJerkMag-std()   
***fBodyBodyGyroMag-std():*** Average of feature   fBodyBodyGyroMag-std()   
***fBodyBodyGyroJerkMag-std():*** Average of feature   fBodyBodyGyroJerkMag-std()   


Features details
==================================================================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
