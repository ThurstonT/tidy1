# tidy1
This repository contaions files that are the resultant of the Getting and Cleaning Data course project.  The objective of the course project was to:

            The text below, in this window, is a direct copy of the Course Project and is the propery of the course instructor.  
            You should create one R script called run_analysis.R that does the following. 

                1.	Merges the training and the test sets to create one data set.
                2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
                3.	Uses descriptive activity names to name the activities in the data set
                4.	Appropriately labels the data set with descriptive variable names. 
                5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for
                        each activity and each subject.
               
The data for the project can be found at this link:
          https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 



When the zip file is expanded a UCI HAR Dataset directory is created.
In the directory there are two sub-directories and four files.

High-Level Overview.
A number of experiments were performed.  The experiments are broken into two groups.  The experiments used for training and the experiments used for testing.  The data sets from the two experiments are structured similarly.  The data files have the same number of columns and different number of rows.  This makes sense as each row is the data from a sample point.    

Assessing the data sets
In the train directory there is a dataset named x_train.txt.  It is a file of numbers for the training dataset.  There is no header information describing what data is in each column.  Furthermore there is no row label information associating the row data to any activity or subject in the experiment.  Simiarly, there is a file in test sub-directory named X_test.txt that has no header information and no row label information.  The two files have the same number of columns but different number of rows.   There are 561 columns in each of the two files.  
The header information for both files is the same and is in the UCI HAR Dataset directory in the features.txt file.  The row label information for the ./train and ./test sub-directories with the data file.   The subject_test.txt file in the ./test subdirectory and the subject_train.txt in the ./train contain each part of the row label information.  This information must be appended to the datasets.  Importantly, the row label information has two pieces subject and activity.  
The activity information is encoded.  The row label information for activity is numeric and uses the number 1 through 6.  The files are in the ./test and ./train sub-directories and are named y_test.txt and y_train.txt respectively.   The information in the UCI HAR Dataset directory in the activity_labels.txt file shows the translation between the numeric data the activity being performed.  Using this information the row activity information can be translated in the activity being performed.  This transformation allows the row information to be easily understood.  For example, instead of seeing the data for “Subject-1” engaging in “1” activity we can see the data for  “Subject-1” “WALKING”.

The code for this project is in the run_analysis.R file.
There are four functions in the file.  
header()
xlate_activity(activity_type)
mean_std_data_set()
run_analysis()

header()
The header() function builds the header for the data files.  The header information must be unique as some of column headers in the features.txt file are the same.  The column number was prepended to the column name assuring uniqueness of the column name and ensuring the processed data associated with the column name can be traced back to the orignating column in the initial data sets.  


xlate_activity(activity_type)
The xlate_activity(activity_type) function will translate the activity number in the y_test.txt and y_train.txt file to an activity.  

mean_std_data_set()
The mean_std_data_set() function reads the data files into data frames.  Puts a header on the data frames, murges the dataframes and then makes a new dataframe from columns that have only the subject, activity and columns containing mean and standard deviation information.  

run_analysis()
The run_analysis() function is the main function of this software.  It is the function that will be called to perform the analysis.  When the dataframe is returned from mean_std_data_set() with the subject, activity, mean and standard deviation infromaiton the final processing begins.  This function will deterine the mean for each of the thirty subject for each of their six activities.  

Important Point:
If there is an entry in the data set that is not a valid number it is ignored during the mean operation. 

When the resulting data frame, named final_data, is complete it is written to a file nameed clean-tidy.txt.  The file will be written to the c:/Coursera/data sub-directory. 


