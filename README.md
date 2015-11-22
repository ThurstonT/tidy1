# tidy1
This repository contaions files that are the resultant of the Getting and Cleaning Data course project.  The objective of the course project was to:

            You should create one R script called run_analysis.R that does the following. 

                1.	Merges the training and the test sets to create one data set.
                2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
                3.	Uses descriptive activity names to name the activities in the data set
                4.	Appropriately labels the data set with descriptive variable names. 
                5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for                           each activity and each subject.
               
The data for the project can be found at this link:
          https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 




When the zip file is expanded a UCI HAR Dataset directory is created.
In the directory there are two sub-directories and four files.

High-Level Overview.
A number of experiments were performed.  The experiments are broken into two groups.  The experiments used for training and the experiments used for testing.  The data sets are structured similarly.  

Assessing the data sets
In the train directory there is a data set named x_train.txt.  It is a file of numbers for the training dataset.  There is no header information describing what is in each column.  Furthermore there is no row label information associating the row data to any activity.  Simiarly, there is a file in test sub-directory named X_test.txt  that has no header information and no row label information.  The files have the same number of columns but different number of rows.   There are 561 columns in both files.  
The header information for both files is the same and is the UCI HAR Dataset directory in the features.txt file.  The row label information for the ./train and  ./test sub-directories with the data file.   The subject_test.txt in the ./test subdirectory and the subject_train.txt in the ./train contain part of the row label information.  This information must be appended to the data sets.  Importantly, the row label information has two pieces subject and activity.  The activity information is encoded.  The row label information for activity is numeric and uses the number 1 through 6.  The files are in the ./test and ./train sub-directories and are named y_test.txt and y_train.txt respectively.   The information in these UCI HAR Dataset directory.
