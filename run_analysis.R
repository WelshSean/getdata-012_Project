library(dplyr)

#### Initially we read the data in


features <- read.table("UCI HAR Dataset/features.txt") ### This file stores headers

## test data

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")  ### test data vector
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="Subject")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names="Activity")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names=c("Index", "Activity"))

#### Read in features as the variable headers for X_test
names(X_test) <- features[,2]

#### cbind subject_test and y_test to X_test to give labels of observation details.
X_test <- cbind(subject_test, y_test, X_test)

## train data

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")  ### train data vector
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="Subject")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names="Activity")

#### Read in features as the variable headers for X_train
names(X_train) <- features[,2]

#### cbind subject_test and y_test to X_test to give labels of observation details.
X_train <- cbind(subject_train, y_train, X_train)

### rbind test and training data to give a consolidated data set

df <- rbind(X_test, X_train)

### Join df to  activity_labels in order to provide friendly labels for activities
df <- merge(activity_labels, df, by.x="Index", by.y="Activity")

### Extract columns containing Means and SDs using grepl
### Wanted to use dplyr but the non-standard characters
### in the column names broke that!

df <-  df[grepl("mean|std|Subject|Activity", names(df))]

means <- group_by(df,Subject, Activity) %>%
    summarise_each(funs(mean))

write.table(means, file="means.txt", row.name=FALSE)
