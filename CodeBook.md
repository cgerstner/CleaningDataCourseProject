CodeBook
========

* activity - factor: the activity performed for the measurement, one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* subject - int: unique identifier per subject

Measurement Data
----------------
The measurement data in this set is all normalized and therefore has no units. Prior to being normalized, collected accelerometer data was in g, and gyroscope data was in rad/s.

The data is named according to the following standard:

\<domain>\<Type>\<Measurement>.\<function>[.axis]

* Domain is one of "frequency" or "time" depending on whether the measurement is of time or frequency domain.
* Type is either Body or Gravity. Gravity is the baseline device reading, which was, in the original data set, subtracted from the actual reading to obtain the Body measurements.
* Measurement is Acc for accelerometer or Gyro for gyroscope readings. This is further broken down by whether the measurement is Jerk for jerkiness, and or Magnitude.
* Function is either "mean" or "std" for the mean or standard deviation, respectively.
* Axis identifies whether the individual measurement is in one dimension: X, Y, or Z.

All data is averaged from multiple measurements grouped by subject and activity.

The complete list of columns is:
```
frequencyBodyAccJerkMagnitude.mean
frequencyBodyAccJerkMagnitude.std
frequencyBodyAccJerk.mean.X
frequencyBodyAccJerk.mean.Y
frequencyBodyAccJerk.mean.Z
frequencyBodyAccJerk.std.X
frequencyBodyAccJerk.std.Y
frequencyBodyAccJerk.std.Z
frequencyBodyAccMagnitude.mean
frequencyBodyAccMagnitude.std
frequencyBodyAcc.mean.X
frequencyBodyAcc.mean.Y
frequencyBodyAcc.mean.Z
frequencyBodyAcc.std.X
frequencyBodyAcc.std.Y
frequencyBodyAcc.std.Z
frequencyBodyGyroJerkMagnitude.mean
frequencyBodyGyroJerkMagnitude.std
frequencyBodyGyroMagnitude.mean
frequencyBodyGyroMagnitude.std
frequencyBodyGyro.mean.X
frequencyBodyGyro.mean.Y
frequencyBodyGyro.mean.Z
frequencyBodyGyro.std.X
frequencyBodyGyro.std.Y
frequencyBodyGyro.std.Z
timeBodyAccJerkMagnitude.mean
timeBodyAccJerkMagnitude.std
timeBodyAccJerk.mean.X
timeBodyAccJerk.mean.Y
timeBodyAccJerk.mean.Z
timeBodyAccJerk.std.X
timeBodyAccJerk.std.Y
timeBodyAccJerk.std.Z
timeBodyAccMagnitude.mean
timeBodyAccMagnitude.std
timeBodyAcc.mean.X
timeBodyAcc.mean.Y
timeBodyAcc.mean.Z
timeBodyAcc.std.X
timeBodyAcc.std.Y
timeBodyAcc.std.Z
timeBodyGyroJerkMagnitude.mean
timeBodyGyroJerkMagnitude.std
timeBodyGyroJerk.mean.X
timeBodyGyroJerk.mean.Y
timeBodyGyroJerk.mean.Z
timeBodyGyroJerk.std.X
timeBodyGyroJerk.std.Y
timeBodyGyroJerk.std.Z
timeBodyGyroMagnitude.mean
timeBodyGyroMagnitude.std
timeBodyGyro.mean.X
timeBodyGyro.mean.Y
timeBodyGyro.mean.Z
timeBodyGyro.std.X
timeBodyGyro.std.Y
timeBodyGyro.std.Z
timeGravityAccMagnitude.mean
timeGravityAccMagnitude.std
timeGravityAcc.mean.X
timeGravityAcc.mean.Y
timeGravityAcc.mean.Z
timeGravityAcc.std.X
timeGravityAcc.std.Y
timeGravityAcc.std.Z
```

Processing and Transformation
-----------------------------
* The original data set includes "trial" and "test" data separately. In this set, they are merged and summarized together.
* The activity column is a numerical identifier in the original data set. This data set converts that to a named factor for greater clarity. These names are taken programmatically from the file in the data set identifying them.
* No pre-processing of the data is required for the script, it handles all tidying.

