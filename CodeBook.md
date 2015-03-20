<h1> Getting and Cleaning Data - Course Project Codebook </h1>

<h2> Details regarding the initial files </h2>

activity_labels.txt - maps numeric codes to quantities (eg 1 -> Walking)

features_info.txt - summary of features

features.txt (561 obs x 2 vars) - mapping of numerical codes to features description (eg 1 -> tBodyAcc-mean()-X)

test/Inertial signals - accelerometer data

test/subject_test.txt (2947 obs x 1 var) - observation labels

test/y_test.txti (2947 obs x 1 var  - feature labels

test/X_test.txt  (2947 obs x 561 var)- data

train/Inertial signals - accelerometer data

train/subject_test.txt (7532 obs x 1 var) - observation labels

train/y_test.txti (7532 obs x 1 var  - feature labels

train/X_test.txt  (7532 obs x 561 var)- data

<h2> Initial data transformations </h2>
<ol> cbind the subject_T[rain|est] and y_t[rain|est] vectors onto X_t[rain|est] - this links the subjects and features to the observations.a
<ol> Use features.txt to create variable headers
<ol> rbind the training and testing data sets together as per the spec
<ol> Discard data columns that dont have mean or std in the name - done using grepl - dplyr would have been nicer but non-standard var names make it think that there are duplicate names.
</ol>
