################################
# run_analysis.R
#
# This script is for the final course project for the Coursera Getting & 
# Cleaning Data course. It acquires, if necessary, the UCI Human Activity
# Recognition Using Smartphones Dataset and cleans and reformats it for future
# analysis.
###############################################################################
library(data.table)
library(dplyr)

# Download and unzip dataset if not present in the working directory.
if (!file.exists('UCIHCD.zip')) {
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(url, "UCIHCD.zip")
}
if (!dir.exists('UCI HAR Dataset')) {
  unzip("UCIHCD.zip")
}

# Step 1: Generate data table with appropriate labels merging trial and test
# data sets, reading the labels from the features.txt file.
ds_dir <- 'UCI HAR Dataset/'
var_labels <- make.names(fread(paste(ds_dir, 'features.txt', sep = ''))$V2, unique = TRUE)
dt <- merge(
  cbind(fread(paste(ds_dir, 'test/subject_test.txt', sep = ''), col.names = "subject"),
        fread(paste(ds_dir, 'test/X_test.txt', sep = ''), col.names = var_labels),
        fread(paste(ds_dir, 'test/y_test.txt', sep = ''), col.names = "activity")
  ),
  cbind(fread(paste(ds_dir, 'train/subject_train.txt', sep = ''), col.names = "subject"),
        fread(paste(ds_dir, 'train/X_train.txt', sep = ''), col.names = var_labels),
        fread(paste(ds_dir, 'train/y_train.txt', sep = ''), col.names = "activity")
  ),
  all = TRUE
)

# Step 2: Throw out everything but mean and stddev measurements.
dt <- select(dt, one_of(c("subject", "activity")),
                 contains('mean', ignore.case = FALSE),
                 contains('std'),
                 -contains('meanFreq')
      )

# Step 3: Replace numeric activity names with descriptive values
activity_names <- fread(paste(ds_dir, 'activity_labels.txt', sep = ''))[[2]]
dt$activity <- factor(dt$activity, labels = activity_names)

# Step 4: Label data set more descriptively.
# clean up from make.names
names(dt) <- gsub('\\.*$', '', names(dt))
names(dt) <- gsub('\\.+', '.', names(dt))

# expand t/f to be more descriptive
names(dt) <- gsub('^f', 'frequency', names(dt))
names(dt) <- gsub('^t', 'time', names(dt))

names(dt) <- gsub('Mag', 'Magnitude', names(dt))
names(dt) <- gsub('BodyBody', 'Body', names(dt))

# Step 5: Generate independent tidy data set of averages grouped by subject
# and activity

summary <- summarize_all(group_by(dt, activity, subject), mean)

# save to a file and clean up the environment
write.table(summary, 'tidydata.txt', row.names = FALSE)
rm(dt, activity_names, ds_dir, url, var_labels)
