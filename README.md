# Getting And Cleaning Data - Course Project

## Introduction

This document describes the contents of this repository. The purpose of this code is to clean up the Human Activity Recognition Using Smartphones Data Set

The repository contains 3 files:

* run_analysis.R
* Codebook.md
* README.md

## run_analysis.R
This is the main file that executes the analysis. It assumes the "Human Activity Recognition Using Smartphones Data Set" is already available in the current folder. The steps executed by the code includes:

1. Read the training and test data set
2. Perform some transformations
3. Generate the tidy data set that contains variables of importance and saves it in "tidydata.txt"
4. Generate a mean of all the variables in the tidy data set and saves it in "meanVarData.txt"

## CodeBook.md
This file explains in detail the working of the run_analysis.R script and the output it generates

## README.md
This file itself

## Running this script
1. Clone this repo
2. In the r console use the following command

        $ source("run_analysis.R")

   2 files will be generated in the same directory as explained under the run_analysis.R section of this README
   
   2. Run the script:
   
       $ Rscript run_analysis.R