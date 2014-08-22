# CodeBook

## Data Source [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html)

## Data info:
Please refere to README.txt and features_info.txt which come together with the original data set.
The original data set is split into training and test sets where each partition consists of three files that contain
- the measurements from the accelerometer and gyroscope
- the labels for activity
- the subject identifiers

# Getting and cleaning data

## R script run_analysis.R does the following.
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Preparation
Function: download.data.set(url)

Check if folder "data" exists in working directory, or create it.
Download and extract the zip file containing the dataset [FUCI HAR Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into fodler "data"


## 1. Loading and Merging the test sets
Function: load.merge.data()

Following the assignment both training and test data sets shall be merged.
Due to the fact that they reside in different subfolders the script addresses this while concatenating the common path with the individual subfolder and filenames into global value "path".
Load the main file X_train.txt (resp. X_test.txt) into a data frame train.dat (resp. test.dat)
then append the Y_train.txt( resp. Y_test.txt) and subject_train.txt(resp. subject_test.txt) to the data frames using read.csv()
Once all measurements are loaded, the two data frames train.dat and test.dat can be merged into a single global data frame called "Data"

## 2. Variable Selection 
Function: extract.data(df)


According to the assignment only the features that contain mean and standard deviation are in scope.
Read the file features.txt into a global data frame called "features" using read.csv().
Perform a regex search for strings containing "-mean" or "-std" on the features list and store the result in a global vector called cols.in.scope
Thus the features in scope are given and the resulting vector can now be used to reduce DF "feature"
Now to be able to reduce the DF "Data" add the columns ID for variable "Activity" and "Subject" to the vector col.in.scope
because they need to be kept for later aggregation.
Once that's done the col.in.scope vector can be used to remove the obsolete columns out of the input data frame.
return result

## 3. Use Descriptive activity names (due to script design will be performed after step 4.)
Function: set.activity.names(df)

The activity labels are declared in the file activity_labels.txt.
Load file into a DF "activity.Labels" using read.csv().
Loop through input data frame and replace activity IDs with their matching lables.
return result

## 4. Label the data set with descriptive variable names
Function:  descriptive.variables(df)

Now alter the variable names with the use of gsub() function which allows for quick and easy string replacement.
For better readability the author choose to make following replacements:
* substitute "-mean" with ".MEAN"
* substitute "-std" with ".STD"
* substitute "-" with "."
* remove "()"
return result


## 5. Creating the tidy data set
Function:  make.tidy(df)

Firstdeclare the variable "Activity" and "Subject" as noiminal data with function as.factor()
To avoid errors on aggregation declare the columns containing numeric data (which are all except the last two columns "Activity" and "Subject")
Then aggregate by grouping on "Activity" and "Subject" calculating the mean for each variable and return the result

## Completion
Finally write tidy.Data into the file "tidy.txt" using tabs as separators and avoids creating line numbers.codebook(Data)