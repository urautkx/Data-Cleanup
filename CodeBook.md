---
title: "CodeBook.md"
author: "Kamal Rautela"
date: "November 14, 2016"
output: html_document
---

## R Markdown

## About the raw data
## ===================
From Feature_info.txt file, which accompanies the raw data. 
----

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."

----

## How to convert raw data into tidy data
## ===================================

## Steps for downloading the data
1. Right click on windows OS on the link below to download the data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the downloaded file by right clicking on the zipped file using windows "Extract All" function

3. Extract the files under the folder named - "UCI HAR Dataset"

4. Set working director for R to the folder that contains the folder "UCI HAR Dataset"

5. Source the script (Cleanup.R) to execute the following steps

## Steps for cleaning up the data as performed by the script

1. Script reads the following files into data frames tables:
    - Measurements (1:561) related to acceleration, angular velocity etc
    - Activity Labels (1-6) corresponding to each of the measurements
    - Subject Ids (1-30) corresponding to eahc of the measurements

2. It read the above data for "Training" set and "Test" set
   from two different set of files

3. It  reads the variable names (labels for each of the 561 measurements) 
   from features.txt file

4. It then filters and extracts the variables which are either mean or standard deviations

5. It uses the filtered set of variable to weed out the measurements that are not of interest
   and keeps only the measurement that are of interest

6. It also assign variable names to the columns that are of interest. 

7. It then merges Training and Test Data sets for the following:
   - Measurements 
   - Activity Labels
   - Subject Ids

8. It combines the Measurements, Activity Labels and Subject Ids into one table

9. It adds a column to add Activity Names to the table

10.It groups the measurement data by Activity Name (1-6) and Subject Ids(1-30)
   into 6 * 30 = 180 groups

11. It then summarizes (takes mean for) each of the measurements of interest 
    for each of the 180 groups

12. The script as a final step writes the data into an output file on the hard disk.

##About the tidy data
##======================

##Description of the variable names in tidy data set


"1"	"activityName"	Name of the activity for which measurements are captured
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

"2"	"subjectId"	Id of the subject providing the measurements
		
###		From 3 to 81 are mean (average) of measurements for the feature mentioned :
		
"3"	"tBodyAcc.mean...X"	Body linear acceleration in X dimension (units - g)

"4"	"tBodyAcc.mean...Y"	Body linear acceleration in Y dimension (units - g)

"5"	"tBodyAcc.mean...Z"	Body linear acceleration in Z dimension (units - g)

"6"	"tGravityAcc.mean...X"	Gravity linear acceleration in X dimension (units - g)

"7"	"tGravityAcc.mean...Y"	Gravity linear acceleration in Y dimension (units - g)

"8"	"tGravityAcc.mean...Z"	Gravity linear acceleration in Z dimension (units - g)

"9"	"tBodyAccJerk.mean...X"	Body jerk acceleration in X dimension (units - g)

"10"	"tBodyAccJerk.mean...Y"	Body jerk acceleration in Y dimension (units - g)

"11"	"tBodyAccJerk.mean...Z"	Body jerk acceleration in Z dimension (units - g)

"12"	"tBodyGyro.mean...X"	Body angular velocity in X dimension (units - radian/sec)

"13"	"tBodyGyro.mean...Y"	Body linear acceleration in Y dimension (units - radian/sec)

"14"	"tBodyGyro.mean...Z"	Body linear acceleration in Z dimension (units - radian/sec)

"15"	"tBodyGyroJerk.mean...X"	Body angular jerk velocity in X dimension (units - radian/sec)

"16"	"tBodyGyroJerk.mean...Y"	Body angular jerk velocity in Y dimension (units - radian/sec)

"17"	"tBodyGyroJerk.mean...Z"	Body angular jerk velocity in Z dimension (units - radian/sec)

"18"	"tBodyAccMag.mean.."	Magnitude (Euclidean norm) of Body linear acceleration signals 

"19"	"tGravityAccMag.mean.."	Magnitude (Euclidean norm) of Gravity linear acceleration signals

"20"	"tBodyAccJerkMag.mean.."	Magnitude (Euclidean norm) of Body linear jerk acceleration signals

"21"	"tBodyGyroMag.mean.."	Magnitude (Euclidean norm) of Body angular velocity signals

"22"	"tBodyGyroJerkMag.mean.."	Magnitude (Euclidean norm) of Body angular jerk velocity signals

"23"	"fBodyAcc.mean...X"	Fast Fourier Transform of Body linear acceleration in X dimension (units - g)

"24"	"fBodyAcc.mean...Y"	Fast Fourier Transform of Body linear acceleration in Y dimension (units - g)

"25"	"fBodyAcc.mean...Z"	Fast Fourier Transform of Body linear acceleration in Z dimension (units - g)

"26"	"fBodyAcc.meanFreq...X"	Mean Freq for Fast Fourier Transform of Body linear acceleration in X dimension (units - Hz)

"27"	"fBodyAcc.meanFreq...Y"	Mean Freq for Fast Fourier Transform of Body linear acceleration in Y dimension (units - Hz)

"28"	"fBodyAcc.meanFreq...Z"	Mean Freq for Fast Fourier Transform of Body linear acceleration in Z dimension (units - Hz)

"29"	"fBodyAccJerk.mean...X"	Fast Fourier Transform of Body linear jerk acceleration in X dimension (units - g)

"30"	"fBodyAccJerk.mean...Y"	Fast Fourier Transform of Body linear jerk acceleration in Y dimension (units - g)

"31"	"fBodyAccJerk.mean...Z"	Fast Fourier Transform of Body linear jerk acceleration in Z dimension (units - g)

"32"	"fBodyAccJerk.meanFreq...X"	Mean Freq for Fast Fourier Transform of Body jerk acceleration in X dimension (units - Hz)

"33"	"fBodyAccJerk.meanFreq...Y"	Mean Freq for Fast Fourier Transform of Body jerk acceleration in Y dimension (units - Hz)

"34"	"fBodyAccJerk.meanFreq...Z"	Mean Freq for Fast Fourier Transform of Body jerk acceleration in Z dimension (units - Hz)

"35"	"fBodyGyro.mean...X"	Fast Fourier Transform of Body angular jerk velocity in X dimension (units - radian/sec)

"36"	"fBodyGyro.mean...Y"	Fast Fourier Transform of Body angular jerk velocity in Y dimension (units - radian/sec)

"37"	"fBodyGyro.mean...Z"	Fast Fourier Transform of Body angular jerk velocity in Z dimension (units - radian/sec)

"38"	"fBodyGyro.meanFreq...X"	Mean Freq for Fast Fourier Transform of Body angular jerk velocity in X dimension (units-Hz)

"39"	"fBodyGyro.meanFreq...Y"	Mean Freq for Fast Fourier Transform of Body angular jerk velocity in Y dimension (units-Hz)

"40"	"fBodyGyro.meanFreq...Z"	Mean Freq for Fast Fourier Transform of Body angular jerk velocity in Z dimension (units-Hz)

"41"	"fBodyAccMag.mean.."	Fast Fourier Transform of Magnitude (Euclidean norm) of Body linear acceleration signals

"42"	"fBodyAccMag.meanFreq.."

"43"	"fBodyBodyAccJerkMag.mean.."	Fast Fourier Transform for Magnitude (Euclidean norm) of Body jerk acceleration signal

"44"	"fBodyBodyAccJerkMag.meanFreq.."	Mean Freq for Fast Fourier Transform for Magnitude (Euclidean norm) of Body jerk acceleration signal (units-Hz)

"45"	"fBodyBodyGyroMag.mean.."	Fast Fourier Transform for Magnitude (Euclidean norm) of Body angular velocity signal

"46"	"fBodyBodyGyroMag.meanFreq.."	Mean Freq for Fast Fourier Transform for Magnitude (Euclidean norm) of Body angular velocity signal

"47"	"fBodyBodyGyroJerkMag.mean.."	Fast Fourier Transform for Magnitude (Euclidean norm) of Body angular jerk velocity signal

"48"	"fBodyBodyGyroJerkMag.meanFreq.."	Mean Freq for Fast Fourier Transform for Magnitude (Euclidean norm) of Body angular jerk velocity signal

"49"	"tBodyAcc.std...X"	Standard deviation in Body linear acceleration in X dimension (units - g)

"50"	"tBodyAcc.std...Y"	Standard deviation in Body linear acceleration in Y dimension (units - g)

"51"	"tBodyAcc.std...Z"	Standard deviation in Body linear acceleration in Z dimension (units - g)

"52"	"tGravityAcc.std...X"	Standard deviation in Gravity linear acceleration in X dimension (units - g)

"53"	"tGravityAcc.std...Y"	Standard deviation in Gravity linear acceleration in Y dimension (units - g)

"54"	"tGravityAcc.std...Z"	Standard deviation in Gravity linear acceleration in Z dimension (units - g)

"55"	"tBodyAccJerk.std...X"	Standard deviation in Body jerk acceleration in X dimension (units - g)

"56"	"tBodyAccJerk.std...Y"	Standard deviation in Body jerk acceleration in Y dimension (units - g)

"57"	"tBodyAccJerk.std...Z"	Standard deviation in Body jerk acceleration in Z dimension (units - g)

"58"	"tBodyGyro.std...X"	Standard deviation in Body angular velocity in X dimension (units - radian/sec)

"59"	"tBodyGyro.std...Y"	Standard deviation in Body linear acceleration in Y dimension (units - radian/sec)

"60"	"tBodyGyro.std...Z"	Standard deviation in Body linear acceleration in Z dimension (units - radian/sec)

"61"	"tBodyGyroJerk.std...X"	Standard deviation in Body angular jerk velocity in X dimension (units - radian/sec)

"62"	"tBodyGyroJerk.std...Y"	Standard deviation in Body angular jerk velocity in Y dimension (units - radian/sec)

"63"	"tBodyGyroJerk.std...Z"	Standard deviation in Body angular jerk velocity in Z dimension (units - radian/sec)

"64"	"tBodyAccMag.std.."	Standard deviation in Magnitude (Euclidean norm) of Body linear acceleration signals 

"65"	"tGravityAccMag.std.."	Standard deviation in Magnitude (Euclidean norm) of Gravity linear acceleration signals 
"66"	"tBodyAccJerkMag.std.."	Standard deviation in Magnitude (Euclidean norm) of Body linear jerk acceleration signals

"67"	"tBodyGyroMag.std.."	Standard deviation in Magnitude (Euclidean norm) of Body angular velocity signals

"68"	"tBodyGyroJerkMag.std.."	Standard deviation in Magnitude (Euclidean norm) of Body angular jerk velocity signals

"69"	"fBodyAcc.std...X"	Standard deviation in Fast Fourier Transform of Body linear acceleration in X dimension (units - g)

"70"	"fBodyAcc.std...Y"	Standard deviation in Fast Fourier Transform of Body linear acceleration in Y dimension (units - g)

"71"	"fBodyAcc.std...Z"	Standard deviation in Fast Fourier Transform of Body linear acceleration in Z dimension (units - g)

"72"	"fBodyAccJerk.std...X"	Standard deviation in Fast Fourier Transform of Body jerk acceleration in X dimension (units - g)

"73"	"fBodyAccJerk.std...Y"	Standard deviation in Fast Fourier Transform of Body jerk acceleration in Y dimension (units - g)

"74"	"fBodyAccJerk.std...Z"	Standard deviation in Fast Fourier Transform of Body jerk acceleration in Z dimension (units - g)

"75"	"fBodyGyro.std...X"	Standard deviation in Fast Fourier Transform of Body angular velocity in X dimension (units - radian/sec)

"76"	"fBodyGyro.std...Y"	Standard deviation in Fast Fourier Transform of Body angular velocity in Y dimension (units - radian/sec)

"77"	"fBodyGyro.std...Z"	Standard deviation in Fast Fourier Transform of Body angular velocity in Z dimension (units - radian/sec)

"78"	"fBodyAccMag.std.."	Standard deviation in Fast Fourier Transform of Magnitude of Body linear acceleration signal

"79"	"fBodyBodyAccJerkMag.std.."	Standard deviation in Fast Fourier Transform of Magnitude of Body jerk acceleration signal

"80"	"fBodyBodyGyroMag.std.."	Standard deviation in Fast Fourier Transform of Magnitude of Body angular velocity signal

"81"	"fBodyBodyGyroJerkMag.std.."	Standard deviation in Fast Fourier Transform of Magnitude of Body angular velocity signal

"82"	"activityLabel"	Code (1-6) of the activity for which measurements are captured

