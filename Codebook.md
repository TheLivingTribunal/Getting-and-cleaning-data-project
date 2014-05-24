CodeBook
========================================================

The code and the data are related to an experiment performed on 30 people (“Subjects” labeled 1 to 30) while performing 6 different activities (“Activities” such as Walking,Sitting etc). The experiment was concerned with the measurement and storage of the accelerometer and gyroscope readings taken from a Samsung galaxy S2 smartphone, worn by each subject. The data was collected and transformed through various methods to obtain 561 readings (“Features”).

However, this project is concerned with only those features which are means or standard deviations. The criteria for selecting the columns was based on the presence of the strings “mean” or “std” in the Feature name. In this way, 79 variables were chosen from the pool of 561. Along with these features, two factor variables were added ( “Activity” and “Subject”).

The Subject number was combined with the corresponding test and train data. The Activity Name was obtained by using the activity_labels.txt file and then merging the test+train dataset with the Activity dataset on the Activity Number column.

The naming format of the original dataset was changed to make it more readable. The Naming Convention used for the 79 Features is as follows - 
* The first 4 letters denote whether the measurement is of type Time or Frequency. It is written as Time/Freq
* The next 4 letters denote whether the measurement is of type Body or Gravity, depicted as Body/Grav
* The next 3 letters show whether the measurement is taken from the Accelerometer or the Gyroscope, shown as Acc/Gyr
* The next 4 optional letters are “Jerk” which, when present, indicate that the measurement is for a Jerk type.
* The next string is a categorical variable of 3 levels. Level “Mean” denotes that the measurement is an average quantity, whereas level “WtMean” represents a Weighted average quantity. The final level “STD” signifies that the recording is a standard deviation.
* The Final String represents the measurements taken along theX, Y or Z coordinate and can also take the value “Mag” which represents Magnitude( a resultant of X, Y and Z measurements).

The attached code creates two Datasets -
* Raw Dataset
* Final Tidy Dataset

Both the mentioned sets contain 81 unique variables. 

The first set contains the entire subset of mean and std values for all subjects and all activities.

The second tidy data set contains only the mean of all variables for every unique combination of Activity and Subject. (total = 180 rows)

The full list of variables is given below - 
Activity
Subject
TimeBodyAccMeanX
TimeBodyAccMeanY
TimeBodyAccMeanZ
TimeBodyAccSTDX
TimeBodyAccSTDY
TimeBodyAccSTDZ
TimeGravAccMeanX
TimeGravAccMeanY
TimeGravAccMeanZ
TimeGravAccSTDX
TimeGravAccSTDY
TimeGravAccSTDZ
TimeBodyAccJerkMeanX
TimeBodyAccJerkMeanY
TimeBodyAccJerkMeanZ
TimeBodyAccJerkSTDX
TimeBodyAccJerkSTDY
TimeBodyAccJerkSTDZ
TimeBodyGyrMeanX
TimeBodyGyrMeanY
TimeBodyGyrMeanZ
TimeBodyGyrSTDX
TimeBodyGyrSTDY
TimeBodyGyrSTDZ
TimeBodyGyrJerkMeanX
TimeBodyGyrJerkMeanY
TimeBodyGyrJerkMeanZ
TimeBodyGyrJerkSTDX
TimeBodyGyrJerkSTDY
TimeBodyGyrJerkSTDZ
TimeBodyAccMeanMag
TimeBodyAccSTDMag
TimeGravAccMeanMag
TimeGravAccSTDMag
TimeBodyAccJerkMeanMag
TimeBodyAccJerkSTDMag
TimeBodyGyrMeanMag
TimeBodyGyrSTDMag
TimeBodyGyrJerkMeanMag
TimeBodyGyrJerkSTDMag
FreqBodyAccMeanX
FreqBodyAccMeanY
FreqBodyAccMeanZ
FreqBodyAccSTDX
FreqBodyAccSTDY
FreqBodyAccSTDZ
FreqBodyAccWtMeanX
FreqBodyAccWtMeanY
FreqBodyAccWtMeanZ
FreqBodyAccJerkMeanX
FreqBodyAccJerkMeanY
FreqBodyAccJerkMeanZ
FreqBodyAccJerkSTDX
FreqBodyAccJerkSTDY
FreqBodyAccJerkSTDZ
FreqBodyAccJerkWtMeanX
FreqBodyAccJerkWtMeanY
FreqBodyAccJerkWtMeanZ
FreqBodyGyrMeanX
FreqBodyGyrMeanY
FreqBodyGyrMeanZ
FreqBodyGyrSTDX
FreqBodyGyrSTDY
FreqBodyGyrSTDZ
FreqBodyGyrWtMeanX
FreqBodyGyrWtMeanY
FreqBodyGyrWtMeanZ
FreqBodyAccMeanMag
FreqBodyAccSTDMag
FreqBodyAccWtMeanMag
FreqBodyAccJerkMeanMag
FreqBodyAccJerkSTDMag
FreqBodyAccJerkWtMeanMag
FreqBodyGyrMeanMag
FreqBodyGyrSTDMag
FreqBodyGyrWtMeanMag
FreqBodyGyrJerkMeanMag
FreqBodyGyrJerkSTDMag
FreqBodyGyrJerkWtMeanMag
