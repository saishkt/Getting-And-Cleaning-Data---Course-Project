# Code Book

This document describes the code inside `run_analysis.R`.

## Introduction

The code has the following Helper Functions:

1. loadMeasurementData
2. extractMeanAndStdData
3. labelVariables
4. appendActivityData
5. appendSubjectData

and a main function that executes the analysis

1. runAnalysis

## Helper Function

### loadMeasurementData

Loads all the measurement data from `UCI HAR Dataset/train/X_train.txt` and `UCI HAR Dataset/test/X_test.txt` and returns the total dataset

### extractMeanAndStdData

Takes an input of total measurement data and selects all the columns containing the word mean or std in them

### labelVariables

Takes an input of all the measurement data and applies the variables name from the `UCI HAR Dataset/features.txt` file

### appendActivityData

Takes an input of measurement data and appends the Activity Variable. The data for the same is loaded from the `UCI HAR Dataset/activity_labels.txt` file.

### appendSubjectData

Takes an input of measurement data and appends the Subject Variable. The data for the same is loaded from the `UCI HAR Dataset/train/subject_train.txt` and the `UCI HAR Dataset/test/subject_test.txt` file.

### genAndSaveAvgVariableData
Takes an input of extracted measurement data, melts all the feature variables and then calculates the average for each feature variable by activity and subject using dcast

## Main Function

### runAnalysis

Runs the main Analysis data follows the following steps

1. Loads the measurement data loadMeasurementData()
2. Labels the variables measures using labelVariables()
3. Extracts the mean and std variables using extractMeanAndStdData()
4. Appends Activity Data using appendActivityData()
5. Appends Subject Data using appendSubjectData()
6. Generates Mean of each variable for each activity and subject using genAndSaveAvgVariableData()

## Variable Description
There are 81 variables generated in the tidydata.txt and meanVarData.txt

1. Information regarding the first 79 Variables can be found in the features_info.txt

        These are all the variables from the training and test dataset that contain the word mean or std in them. 
        
2. Activity Variable

        The subjects were made to do the following activities:
         
        WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
        
3. Subject Variable:

        There were 30 subjects who were made to the activities so the value ranges from 1 to 30

