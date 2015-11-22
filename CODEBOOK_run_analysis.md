Project Description


        The text below, in this window, is a direct copy of the Course Project and is the propery of the course instructor.  
        You should create one R script called run_analysis.R that does the following. 

            1.  Merges the training and the test sets to create one data set.
            2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
            3.  Uses descriptive activity names to name the activities in the data set
            4.  Appropriately labels the data set with descriptive variable names. 
            5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for
                    each activity and each subject.

The data for the project can be found at this link:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Further information about the project can be found here:
    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


Informaiton about the data to be process and it layout can be found in the readme.md file in this repo.


Overview of the data processing.
There are two datasets that are to be merged, the training dataset and the testset.  References to the datasets can be found in the readme.md file.  
The processing to be done is to add the column header information so that we know what data is in each column.  We also need to add descriptive row information.  Each row needs two pieces of data.  The subject who produced the data and the activity being performed. The data file containing subject information is purely numerical and takes on the values 1 through 30 inclusive.  The column header information for this data is “Subject” and each entry in the file will be prepended with “Subject-“ and the subject number.  The resultant is an entry in the Subject column, the form of the entry is exemplified by “Subject-1”.  Entries in the column will be “Subject-1” through “Subject-6”.
There will also be a column named Activity.  Each row will have an activity.  The possibilities for activities are: 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The file containing this information is named activity_lables.txt and is located in the UCI HAR Dataset directory. 
The files containing the activity type for the dataset is in the directory for the datasets.  The information is numeric and will be translated from numbers to activity by the run_analysis.R software.  









tudy design and data processing

Collection of the raw data

Description of how the data was collected.

Notes on the original (raw) data

Some additional notes (if avaialble, otherwise you can leave this section out).

Creating the tidy datafile

