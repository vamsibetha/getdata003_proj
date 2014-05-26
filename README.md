## "Getting and Cleaning Data"
##  Course Project - Coursera

This file serves as a guide to anyone who wants to understand the basic processes that went behind the project and the corresponding R script file given here.

### Files in the repo

* run_analysis.R
* Codebook.md
* README.md (present file)

### Original Data Set Information

The project gets its data from the "Human Activity Recognition Using Smartphones Data Set" obtained from the UC Irvine MAchine Learning Repository. The project abstract describes the database as "Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors". The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The data set can be downloaded at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

More information can be obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Project Description

The Project's goal is to obtain the aggregated values for the mean and standard deviation values for the various measures based on the subject and activity codes.

The data is placed in 2 separate data sets - training and test data set. Also for each data set, the subject codes, activity codes and the feature values are scattered in separate .txt files. This data needs to be collated and the required variables are to be chosen from this collated data set and summarized for the final output. Care needs to be taken to name the variables in a clean manner and convert the subject and activity codes to factors for easier analysis

### Process

Note- 

The R script assumes that it is present inside the "UCI HAR Dataset" folder along with the other files. Otherwise, set the working directory to this folder using setwd().

The R script requires the reshape2 library of functions for performing the melt and dcast functions. The script automatically installs the library if not present already.


* The training data set is combined with the subject, activity and feature values for all the training readings.
* The test data set is similarly prepared.
* Training and test data are combined row-wise to get the combined data set
* The required variables are selected using the grep() function for "mean()" and "std()" values.
* The data set obtained above is summarized for average values using melt and dcast based on subject and activity codes.
* The final data set is written to a local .txt file in the working directory.
