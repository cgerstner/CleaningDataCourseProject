## Coursera Getting and Cleaning Data Course Project
This repository contains a tidied data set of averaged gyroscope and accelerometer measurements from 30 subjects grouped by subject and activity.
It also contains the script used to download, clean and generate the summarized averaged data set.
### Data Set Notes
* The data is tidied in long form rather than wide. I selected this method due to the number of averaged columns -- wide form would be too wide for my comfort.
Long form seems the more appropriate choice to me as a matter of personal preference.
* Due to the nature of the data, I did not expand "Acc" to "Accelerometer" or "Gyro" to "Gyroscope" in column names. It seems to me that brevity is superior to
expanding those words in this instance as they are sufficiently descriptive in my opinion, and thus superior to enormously long column names.
### Files
* README.md - this document
* CodeBook.md - a codebook explaining the data set's contents and details of its generation
* run_analysis.R - the script used to generate the data set
* tidydata.txt - the computer readble data set, as generated by write.table() in R
### Usage
run_analysis.R checks the working directory for the original data used and downloads and/or unzips the data if not found. Thus you are not required
to source the data yourself. The table is saved to the working directory as tidydata.txt, and the table remains in the environment named "summary".

