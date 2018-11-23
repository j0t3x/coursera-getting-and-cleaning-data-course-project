# Coursera *Getting and Cleaning Data* codebook

The features selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals time Accelerometer for the 3 axis XYZ and time Gyroscope for the axis XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time Body Accelerometer for the axis XYZ and time Gravity Accelerometer for the axis XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time Body Accelerometer Jerk for the axis XYZ and time Body Gyroscope Jerk for the axis XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm: 

- `timeBodyAccelerometerMagnitude` 
- `timeGravityAccelerometerMagnitude`
- `timeBodyAccelerometerJerkMagnitude`
- `timeBodyGyroscopeMagnitude`
- `tBodyGyroscopeJerkMagnitude`

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing:

- `frequencyBodyAccelerometerXYZ`
- `frequencyBodyAccelerometerJerkXYZ`
- `frequencyBodyGyroscopeXYZ`
- `frequencyBodyAccelerometerJerkMagnitude`
- `frequencyBodyGyroscopeMagnitude`
- `frequencyBodyGyroscopeJerkMagnitude`

These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- `timeBodyAccelerometerXYZ`
- `timeGravityAccelerometerXYZ`
- `timeBodyAccelerometerJerkXYZ`
- `timeBodyGyroscopeXYZ`
- `timeBodyGyroscopeJerkXYZ`
- `timeBodyAccelerometerMagnitude`
- `timeGravityAccelerometerMagnitude`
- `timeBodyAccelerometerJerkMagnitude`
- `timeBodyGyroscopeMagnitude`
- `timeBodyGyroscopeJerkMagnitude`
- `frequencyBodyAccelerometerXYZ`
- `frequencyBodyAccelerometerJerkXYZ`
- `frequencyBodyGyroscopeXYZ`
- `frequencyBodyAccelerometerMagnitude`
- `frequencyBodyAccelerometerJerkMagnitude`
- `frequencyBodyGyroscopeMagnitude`
- `frequencyBodyGyroscopeJerkMagnitude`

We also estimated the mean and standard deviation from these signals.

Two more variables are added to the data set which are:

- `subjectId`
- `activityLabel`

This variables are used to identify the observations related to which of the `30` subjects made them and 
what activity was he performing (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`).


#Have in mind...
In both datasets `final_dataset.txt` and `summary_table.txt`, the same variables described in this codebook are used, with the only difference that on the summary table the variables are referring to the average of the variables already mentioned, computed grouped by subject and activity.

