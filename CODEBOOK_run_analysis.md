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
The files containing the activity type for the dataset is in the directory with the respective datasets.  The information is numeric and will be translated from numbers to activity by the run_analysis.R software.  

The code for this project is in the run_analysis.R file. There are four functions in the file.
1) header() 
2) xlate_activity(activity_type) 
3) mean_std_data_set() 
4) run_analysis()

header() The header() function builds the header for the data files. The header information must be unique as some of column headers in the features.txt file are the same. The column number was prepended to the column name assuring uniqueness of the column name and ensuring the processed data associated with the column name can be traced back to the orignating column in the initial data sets.

xlate_activity(activity_type) The xlate_activity(activity_type) function will translate the activity number in the y_test.txt and y_train.txt file to an activity.

mean_std_data_set() The mean_std_data_set() function reads the data files into data frames. Puts a header on the data frames, merges the dataframes and then makes a new dataframe from columns that have only the subject, activity and columns containing mean and standard deviation information.

******  Important Point  ********
Some of the column names in the data file have the same name.  when processing the data this issue must be addressed. Either there are duplicate columns of data or there are duplicate column names.  There are multiple instances of column names being duplicated.  The data set has over 500 columns.  The issue does not have to be the same for each occurrence of duplication. It is possible that in some instances the column name has inadvertently been duplicated in other instances the column of data has been duplicated.  I have elected to pre-pend the column name with the column number.  This action makes the column name unique and permits the user of the data to trace the column of data back to the source of the data.  All the data is available and the column names are unique.  

*************************

when calculating the mean of each of the columns I chose to remove data that is not a number.  
when building the final data set I built each row of data one mean at a time and used the rbind function to bind the mean to the right of the data structure.  When this activity was complete I used the cbind function to bind it to the data frame. 

run_analysis() The run_analysis() function is the main function of this software. It is the function that will be called to perform the analysis. When the dataframe is returned from mean_std_data_set() with the subject, activity, mean and standard deviation infromaiton the final processing begins. This function will deterine the mean for each of the thirty subject for each of their six activities.





