# Getting And Cleaning Data - Course Project

## Introduction

This document describes the contents of this repository. The purpose of this code is to clean up the Human Activity Recognition Using Smartphones Data Set

The repository contains 3 files:

* run_analysis.R
* Codebook.md
* README.md
* tidydata.txt
* meanVarData.txt

## run_analysis.R
This is the main file that executes the analysis. It assumes the "Human Activity Recognition Using Smartphones Data Set" is already available in the current folder. The steps executed by the code includes:

1. Read the training and test data set
2. Perform some transformations
3. Generate the tidy data set that contains variables of importance
4. Generate a mean of all the variables in the tidy data set and 
