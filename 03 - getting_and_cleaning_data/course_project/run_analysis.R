## Download and unzip dataset:

if(!file.exists("./course_project")){dir.create("./course_project")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./course_project/dataset.zip")
unzip(zipfile = "./course_project/dataset.zip", exdir = "./course_project")

setwd('/Users/Username/Documents/course_project/UCI HAR Dataset')



## Read train tables:
x_train <- read.table('train/X_train.txt')
y_train <- read.table('train/y_train.txt')
subject_train <- read.table('train/subject_train.txt')


## Read test tables:
x_test <- read.table('test/X_test.txt')
y_test <- read.table('test/y_test.txt')
subject_test <- read.table('test/subject_test.txt')


## Read features and activity labels:
features <- read.table('features.txt')
activity_labels <- read.table('activity_labels.txt')


## Assign column names:
colnames(x_train) <- features$V2
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

colnames(x_test) <- features$V2
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

colnames(activity_labels) <- c("activityID", "activity")


## Combine all the data
merg_train <- cbind(y_train, subject_train, x_train)
merg_test <- cbind(y_test, subject_test, x_test)
all_data <- rbind(merg_train, merg_test)



## Read all column names:
col_names <- colnames(all_data)

## Logical vector for extracting ID, mean and standard deviation
mean_std <- (grepl("activityID", col_names) | grepl("subjectID", col_names) | grepl("mean..", col_names) | grepl("std..", col_names))

## Subset combined data to keep only the desired columns
setofmean_std <- all_data[mean_std == TRUE]


## Use descriptive activity names to name the activities in the data set:
set_with_activity <- merge(setofmean_std, activity_labels, by = "activityID", all.x = TRUE)
set_with_activity$activityID[set_with_activity$activityID == 1] <- as.character(activity_labels$activity[1])
set_with_activity$activityID[set_with_activity$activityID == 2] <- as.character(activity_labels$activity[2])
set_with_activity$activityID[set_with_activity$activityID == 3] <- as.character(activity_labels$activity[3])
set_with_activity$activityID[set_with_activity$activityID == 4] <- as.character(activity_labels$activity[4])
set_with_activity$activityID[set_with_activity$activityID == 5] <- as.character(activity_labels$activity[5])
set_with_activity$activityID[set_with_activity$activityID == 6] <- as.character(activity_labels$activity[6])

## Create a second, independent tidy data set with the average of each variable for each activity and each subject:
tidy_data <- aggregate(. ~activityID + subjectID, set_with_activity, mean)

write.table(tidy_data, "tidy_data.txt", row.names = FALSE, sep = '\t')
