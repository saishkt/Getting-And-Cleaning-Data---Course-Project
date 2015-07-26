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
Takes an input of total measurement data and selects all the columns

### labelVariables

### labelVariables

### appendActivityData

### appendSubjectData

## Main Function

### runAnalysis

## Variable Description
There are 81 variables generated in the tidydata.txt and meanVarData.txt

1. Information regarding the first 79 Variables can be found in the features_info.txt
2. Activity Variable

        The subjects were made to do the following activities:
         
        WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
        
3. Subject Variable:

        There were 30 subjects who were made to the activities so the value ranges from 1 to 30

