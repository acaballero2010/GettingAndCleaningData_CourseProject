# Coursera - Getting and Cleaning Data
# Course Project

# Downloading the required dataset
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if (!file.exists("data")) {
  dir.create("data")
}

download.file(fileUrl, destfile = "./data/run_analysis.zip")
unzip("./data/run_analysis.zip")


# Setting up working directory
setwd("C:/Users/Miah Alexa/Documents/Coursera - Data Science Specialization Track/Getting and Cleaning Data/Coursework/UCI HAR Dataset")

# Dataset downloaded and unzipped. Folder name: UCI HAR Dataset
# The purpose of this project is to collect, work with, and clean the given data set
# The goal is to prepare a tidy data set that can be used for data analysis later


# AFTER DATA INSPECTION WE CAN NOW LOAD THE REQUIRED DATA SETS INTO R STUDIO

# Loading activity_labels and features
# Links the class labels with their activity name.
activity_labels <- read.table("activity_labels.txt")
str(activity_labels)

# List of all features.
features <- read.table("features.txt")
str(features)

# LOADING THE TEST SET DATA
# Each row identifies the subject who performed the activity for each window sample
subject_test <- read.table("./test/subject_test.txt")
str(subject_test)

# Test set
x_test <- read.table("./test/X_test.txt")
str(x_test)

# Test labels
y_test <- read.table("./test/y_test.txt")
str(y_test)

# LOADING THE TRAIN SET DATA
# Each row identifies the subject who performed the activity for each window sample
subject_train <- read.table("./train/subject_train.txt")
str(subject_train)

# Train set
x_train <- read.table("./train/X_train.txt")
str(x_train)

# Train labels
y_train <- read.table("./train/y_train.txt")
str(y_train)

# All the required datasets have been loaded. We can now proceed with the first task.
# TASK 1 
# Merges the training and the test sets to create one data set.
# To do this, we can perform row bind for x_test and x_train. Both have 561 variables.

one_set <- rbind(x_test, x_train)
str(one_set) # 'data.frame':  2947 obs. of  561 variables

# TASK 2
# Extracts only the measurements on the mean and standard deviation for each measurement.
# To do this, we need to subset variables that contain mean() and std()
# However, since 'one_set' doesn't have variables names yet we need to get them from 'features'

# Adding variable names to the dataset
variable_names <- features[,2]
names(one_set) <- variable_names

# Checking if there are duplicate variables/features
duplicated(colnames(one_set)) # Returns TRUE on some instances

# Removing duplicate variables
tidy_data <- one_set[, !duplicated(colnames(one_set))]
str(tidy_data) # 'data.frame':  10299 obs. of  477 variables

# Extracting variables with mean() and std() only
library(stats)
library(plyr)
library(dplyr)
library(tidyr)

# Extracting variables with mean() first
mean_data <-tidy_data %>%
  select(contains("mean()"))
head(mean_data)

# Then extracting variables with std()
std_data <- tidy_data %>%
  select(contains("std()"))
head(std_data)

# Binding the datasets to come up with one tidy dataset where only the measurements on the mean and standard deviation are presented

one_tidy_data <- cbind(mean_data, std_data)
head(one_tidy_data)
str(one_tidy_data) # 'data.frame':  10299 obs. of  66 variables

# TASK 3
# Uses descriptive activity names to name the activities in the data set
# To do this, we need appropriately match the activity labels to that of the train and test sets.
# Required Datasets: activity_labels, y_test, y_train  

# Test set - Activity labels
test_activity_label <- list(y_test, activity_labels)
merge_test_label <- join_all(test_activity_label)

# To check if rows are matching and if correct activity labels are attached.
head(y_test, n=20)
head(merge_test_label, n=20)
tail(y_test, n=20)
tail(merge_test_label, n=20)

# Train set - Activity labels
train_activity_label <- list(y_train, activity_labels)
merge_train_label <- join_all(train_activity_label)

# To check if rows are matching and if correct activity labels are attached.
head(y_train, n=20)
head(merge_train_label, n=20)
tail(y_train, n=20)
tail(merge_train_label, n=20)

# Binding activity labels. To match the order with the main dataset, merge_test_label first then merge_train_label.
one_activity_label <- rbind(merge_test_label, merge_train_label)
str(one_activity_label) # 'data.frame':  10299 obs. of  2 variables

# TASK 4
# Appropriately labels the data set with descriptive variable names.
# To do this, we will attach activity labels and subject to the main dataset

# Merging subject data
# Same order: Test first and then train
merge_subject <- rbind(subject_test, subject_train)
str(merge_subject) # 'data.frame':  10299 obs. of  1 variable

# We only need the descriptive activity labels so we need to drop V1 (numeric equivalent of activities)
one_activity_label$V1 <- NULL
str(one_activity_label) # 'data.frame':  10299 obs. of  1 variable


# PUTTING THEM ALL TOGETHER
# one_tidy_data, 'data.frame':  10299 obs. of  66 variables
# merge_subject, 'data.frame':  10299 obs. of  1 variable
# one_activity_label, 'data.frame':  10299 obs. of  1 variable

# Final dataset
# Order: Subject, Activity Name, Activity Measurements
final_tidy_data <- cbind(merge_subject, one_activity_label, one_tidy_data)
str(final_data)


# Adding appropriate variable names, V1 = Subject, V2 = Activity Name
colnames(final_tidy_data)[1:2] <- c("Subject", "Activity_Name")
head(final_tidy_data)
str(final_tidy_data)

# REVIEW OF THE FINAL TIDY DATA SET
# Requirements/checklist of a tidy data set
# 1. Each variable forms a column <- TRUE
# 2. Each observation forms a row <- TRUE
# 3. Each table/file stores data about one kind of observation <- TRUE

# Requirements/checklist based on the tasks provided
# 1. Merges the test and training sets to create one data set <- TRUE
# 2. Extracts on the measurements on the mean and standard deviation for each measurement. <- TRUE
# 3. Uses decriptive activity names to name the activities in the data set <- TRUE
# 4. Appropriately labels the data set with descriptive in the data set <- TRUE

# Final tidy data set description
# 1. 'data.frame':  10299 obs. of  68 variables
# 2. Variable Names: Subject, Actvity_Name, Activity Measurements (66)


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data5 <- 
  tbl_dt(final_tidy_data) %>%
  group_by(Subject, Activity_Name) %>%
  summarise_each(
    funs(mean)
    )
  
str(tidy_data5) # Classes 'grouped_dt' and 'data.frame':  180 obs. of  68 variables:
View(tidy_data5)

write.table(tidy_data5, "tidy_data5.txt", sep = " ", row.names = FALSE)

# Read the data back to R
check <- read.table("tidy_data5.txt", header = TRUE)
View(check)
str(check) 


