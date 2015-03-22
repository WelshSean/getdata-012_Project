# Getting and Cleaning Data - Course Project Codebook 

## Details regarding the initial files 

**activity_labels.txt** - maps numeric codes to quantities (eg 1 -> Walking)

**features_info.txt** - summary of features

**features.txt** (561 obs x 2 vars) - mapping of numerical codes to features description (eg 1 -> tBodyAcc-mean()-X)

**test/Inertial signals** - accelerometer data

**test/subject_test.txt** (2947 obs x 1 var) - observation labels

**test/y_test.txt** (2947 obs x 1 var  - feature labels

**test/X_test.txt**  (2947 obs x 561 var)- data

**train/Inertial signals** - accelerometer data

**train/subject_test.txt** (7532 obs x 1 var) - observation labels

**train/y_test.txt** (7532 obs x 1 var  - feature labels

**train/X_test.txt**  (7532 obs x 561 var)- data

## Initial data transformations 

Note: there are two sets of data "train" (training data) and "test" (testing data). In this document these two sets of data are referred to using "shell style" nomenclature for brevity, eg **subject_T[rain|est]** would refer to both the **subject_Train** and **subject_Test** items.
1. `cbind` the subject_T[rain|est] and y_t[rain|est] vectors onto X_t[rain|est] - this links the subjects and Activities to the observations.
2. Use features.txt to create variable headers so that we known what each variable is.
3. `rbind` the training and testing data sets together as per the spec to provide a consolidated data set.
4. Use `merge` to join the **activity_labels** data set onto the DataFrame in order to map the nuemric values to human readable labels.
5. Now we want to subset the variables to only those made on the mean and Standard Deviation. The rationale for the columns picked obviously comes from the Code Book for the original data set (features_info.txt file in the original Zip file). First of all features (Variable/Column names) containing the text patterns **mean()** and **std()** are included as these indicate the mean and standard deviation of the signal that they are associated with, eg tBodyAcc-mean()-Y would be the mean calculated from the Y-component of the tBodyAcc signal. In addition to these variables, thise containing the text pattern **mean** are included as these were also obtained by averaging signals. To this end, the following regular expression was used to pick the variables `"mean|std|Subject|Activity"`. Subject and Activity were used to pull in the Variables added above to allow the measuresments to be attributed to the Subjects and the Activities that they carried out.This was all done using `grepl` - `dplyr` would have been nicer but fact that the variable names conatined dashes  make it think that there are duplicate names resulting in an error.

## Creation of second, independent, summarise data set.
The instructions now asked for a separate tidy dataset to be included that has the average of each variable for each activity and subject. This was all achieved using a  `dplyr` "pipe" which performs the following tasks.

1. Group the data by the "Subject" and "Activity" variables
2. Perform a summarisation by caclulating the means of the grouped data.


## Description of Variables in the "mean" data set


