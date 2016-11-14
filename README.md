---
title: "README.md"
author: "Kamal Rautela"
date: "November 14, 2016"
output: html_document
---
## R Markdown

Please use this file to understand the various components of the package that form the submission for Getting and Cleaning Data Course Project

Steps for downloading the raw data file and extracing the files from zipped file format are in CodeBook.md

The R script that cleans up the data is in Cleanup.R  

The logic for cleaning and tidying the data is in CodeBook.md

The output of the script, the tidy data, is in the file Tidy.txt

The column/variable names used in tidy data are in the file Features_Tidy.txt


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
