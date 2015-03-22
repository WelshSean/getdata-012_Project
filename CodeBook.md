<h1> Getting and Cleaning Data - Course Project Codebook </h1>

<h2> Details regarding the initial files </h2>

<strong>activity_labels.txt</strong> - maps numeric codes to quantities (eg 1 -> Walking)

<strong>features_info.txt</strong> - summary of features

<strong>features.txt</strong> (561 obs x 2 vars) - mapping of numerical codes to features description (eg 1 -> tBodyAcc-mean()-X)

<strong>test/Inertial signals</strong> - accelerometer data

<strong>test/subject_test.txti</strong> (2947 obs x 1 var) - observation labels

<strong>test/y_test.txt</strong> (2947 obs x 1 var  - feature labels

<strong>test/X_test.txt</strong>  (2947 obs x 561 var)- data

<strong>train/Inertial signals</strong> - accelerometer data

<strong>train/subject_test.txt</strong> (7532 obs x 1 var) - observation labels

<strong>train/y_test.txt </strong> (7532 obs x 1 var  - feature labels

<strong>train/X_test.txt</strong>  (7532 obs x 561 var)- data

<h2> Initial data transformations </h2>

Note: there are two sets of data "train" (training data) and "test" (testing data). In this document these two sets of data are referred to using "shell style" nomenclature for brevity, eg <strong>subject_T[rain|est]</strong> would refer to both the <strong>subject_Train</strong> and <strong>subject_Test</strong> items.
<ol>
<li> cbind the subject_T[rain|est] and y_t[rain|est] vectors onto X_t[rain|est] - this links the subjects and features to the observations.</li>
<li> Use features.txt to create variable headers</li>
<li> rbind the training and testing data sets together as per the spec</li>
<li> Discard data columns that dont have mean or std in the name - done using grepl - dplyr would have been nicer but non-standard var names make it think that there are duplicate names.</li>
</ol>

**sean**
