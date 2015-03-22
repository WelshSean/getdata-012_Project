# getdata-012_Project
#Johns Hopkins University Getting and Sharing Data Coursera Course - Course Project

## Summary

This repo contains the following items.

* README - This File.
* run_analysis.R - the code that will consume the data and produced the summarise dataset.
* CodeBook.md - the Code Book to describe the summarised data set.
* UCI HAR Dataset - a directory containing all the files from the original data set [Original Link](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/)

The R script will combine the datasets into one consolidated dataset and will summarise it t by Subject and Activity to produce means of each variable.

## Running the code

### Command-line R
1. Start R
2. Run setwd("Directory into which you extracted the repo")
3. Run source("run_analysis.R)

### RStudio
1. Start RStudio
2. File -> Open -> open run_analysis.R from where you saved the repo.
3. Run setwd("Directory into which you extracted the repo")
4. Either click "Source" or run source("run_analysis.R)

## Output

### Output File
In the working directory, you should find a file called means.txt - this contains the output data set, written out from R as follows `write.table(means, file="means.txt", row.name=FALSE)` which can be read back into R using something like `df<- read.table(file="means.txt")`.

### Variables in R Workspace after running Code

If you dont want to trawl through the list below, the final summarise data is contained in the "means" Data-Frame.


**X_test** - Raw data from Test data set

**X_train** - Raw data from Training data set

** activity_labels** - Labels to map activity codes to human readable form

**df** - the final processed input data set before summarisation.

**features** - variable/column names

** means ** - final processed data set containing means of all variables summarised by Subject and Activity.

** subject_test** - vector containing subjects in the order that the observations are listed in the file - test data.

** subject_train** - vector containing subjects in the order that the observations are listed in the file - training data.

** y_test** - Activites in the order that the observations are listed in the file - test data.

** y_train** - Activites in the order that the observations are listed in the file - train data.
