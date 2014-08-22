Getting and Cleaning Data (Coursera). Course Project Codebook
==============================================================


## Original Data [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html)

Contains Human Activity Recognition database built from the recordings of 30 subjects performing 
activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Original data collected from the smartphones accelerometer and gyroscope 3-axial raw signals, 
further processed using various signal processing techniques resulting in a measurement vector with
561 features.

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

For detailed description of the original dataset, refer to `README.txt` and `features_info.txt` bundeled with the original data set zip archive.
The original data set is split into training and test sets where each partition consists of three files that contain
* the measurements from the accelerometer and gyroscope
* the labels for activity
* the subject identifiers

# Tidy Data
Contains aggregated mean values of all mean and standard deviation values from original data set grouped by activity  and subject, resulting in total 180 records.

## Attribute Information:
For each record in the tidy data it is provided: 
- Its activity label (one out of 6 different activities)
- An identifier of the subject who carried out the experiment (one out of 30 different subjects)
- 79 features with the
  - Mean of Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
  - Mean of Triaxial Angular velocity from the gyroscope. 

## Variable names
- activity
- subject
- tbodyacc.mean.x
- tbodyacc.mean.y
- tbodyacc.mean.z
- tbodyacc.std.x
- tbodyacc.std.y
- tbodyacc.std.z
- tgravityacc.mean.x
- tgravityacc.mean.y
- tgravityacc.mean.z
- tgravityacc.std.x
- tgravityacc.std.y
- tgravityacc.std.z
- tbodyaccjerk.mean.x
- tbodyaccjerk.mean.y
- tbodyaccjerk.mean.z
- tbodyaccjerk.std.x
- tbodyaccjerk.std.y
- tbodyaccjerk.std.z
- tbodygyro.mean.x
- tbodygyro.mean.y
- tbodygyro.mean.z
- tbodygyro.std.x
- tbodygyro.std.y
- tbodygyro.std.z
- tbodygyrojerk.mean.x
- tbodygyrojerk.mean.y
- tbodygyrojerk.mean.z
- tbodygyrojerk.std.x
- tbodygyrojerk.std.y
- tbodygyrojerk.std.z
- tbodyaccmag.mean
- tbodyaccmag.std
- tgravityaccmag.mean
- tgravityaccmag.std
- tbodyaccjerkmag.mean
- tbodyaccjerkmag.std
- tbodygyromag.mean
- tbodygyromag.std
- tbodygyrojerkmag.mean
- tbodygyrojerkmag.std
- fbodyacc.mean.x
- fbodyacc.mean.y
- fbodyacc.mean.z
- fbodyacc.std.x
- fbodyacc.std.y
- fbodyacc.std.z
- fbodyacc.meanfreq.x
- fbodyacc.meanfreq.y
- fbodyacc.meanfreq.z
- fbodyaccjerk.mean.x
- fbodyaccjerk.mean.y
- fbodyaccjerk.mean.z
- fbodyaccjerk.std.x
- fbodyaccjerk.std.y
- fbodyaccjerk.std.z
- fbodyaccjerk.meanfreq.x
- fbodyaccjerk.meanfreq.y
- fbodyaccjerk.meanfreq.z
- fbodygyro.mean.x
- fbodygyro.mean.y
- fbodygyro.mean.z
- fbodygyro.std.x
- fbodygyro.std.y
- fbodygyro.std.z
- fbodygyro.meanfreq.x
- fbodygyro.meanfreq.y
- fbodygyro.meanfreq.z
- fbodyaccmag.mean
- fbodyaccmag.std
- fbodyaccmag.meanfreq
- fbodybodyaccjerkmag.mean
- fbodybodyaccjerkmag.std
- fbodybodyaccjerkmag.meanfreq
- fbodybodygyromag.mean
- fbodybodygyromag.std
- fbodybodygyromag.meanfreq
- fbodybodygyrojerkmag.mean
- fbodybodygyrojerkmag.std
- fbodybodygyrojerkmag.meanfreq


© Heinrich Krupp 2014 All Rights reserved.

