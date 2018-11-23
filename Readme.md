# Coursera *Getting and Cleaning Data* course project

In this course project, we have to build a tidy data set from data collected from the accelerometer and gyroscope of the (Samsung Galaxy S II) on the waist of 30 subjects.

This repository contains the following files:

- `README.md`, is an overview and explanation of the files included in the repo.
- `final_dataset.txt`, contains the tidy dataset containing the test and train set merged.
- `summary_table.txt`, contains a summary table of the final dataset, calculating the average by subject and activity for all variables.
- `codebook.md`, is a description of the variables in both datasets
- `run_analysis.R`, is the actual script that takes the raw data and makes a tidy data set out of it. I made sure to comment all the process inside this file so the work is understandable.

If you want to reproduce the `run_analysis.R` script, you must install the library `data.table` as this is the data library i use to load and process the raw data. This script assumes you already downloaded and unzipped the [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), it also assumes that the script `run_analysis.R` is inside this folder.
