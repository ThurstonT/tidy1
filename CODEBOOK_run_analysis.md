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


The output data file will have 180 rows of data.  There are 30 participants or subjects and each engaged in six activities, therefore 180 rows.  Each row has two row labels "Subject" and "Activity"
Subject can take on the values of 'Subject-1' to 'Subject-30'
Activity can take the following six values. 
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

There are 79 additional columns as shown below.  Per the course assignment the value in each element of column is the mean of source file.
1-tBodyAcc-mean()-X

2-tBodyAcc-mean()-Y

3-tBodyAcc-mean()-Z

4-tBodyAcc-std()-X

5-tBodyAcc-std()-Y

6-tBodyAcc-std()-Z

41-tGravityAcc-mean()-X

42-tGravityAcc-mean()-Y

43-tGravityAcc-mean()-Z

44-tGravityAcc-std()-X

45-tGravityAcc-std()-Y

46-tGravityAcc-std()-Z

81-tBodyAccJerk-mean()-X

82-tBodyAccJerk-mean()-Y

83-tBodyAccJerk-mean()-Z

84-tBodyAccJerk-std()-X

85-tBodyAccJerk-std()-Y

86-tBodyAccJerk-std()-Z

121-tBodyGyro-mean()-X

122-tBodyGyro-mean()-Y

123-tBodyGyro-mean()-Z

124-tBodyGyro-std()-X

125-tBodyGyro-std()-Y

126-tBodyGyro-std()-Z

161-tBodyGyroJerk-mean()-X

162-tBodyGyroJerk-mean()-Y

163-tBodyGyroJerk-mean()-Z

164-tBodyGyroJerk-std()-X

165-tBodyGyroJerk-std()-Y

166-tBodyGyroJerk-std()-Z

201-tBodyAccMag-mean()

202-tBodyAccMag-std()

214-tGravityAccMag-mean()

215-tGravityAccMag-std()

227-tBodyAccJerkMag-mean()

228-tBodyAccJerkMag-std()

240-tBodyGyroMag-mean()

241-tBodyGyroMag-std()

253-tBodyGyroJerkMag-mean()

254-tBodyGyroJerkMag-std()

266-fBodyAcc-mean()-X

267-fBodyAcc-mean()-Y

268-fBodyAcc-mean()-Z

269-fBodyAcc-std()-X

270-fBodyAcc-std()-Y

271-fBodyAcc-std()-Z

294-fBodyAcc-meanFreq()-X

295-fBodyAcc-meanFreq()-Y

296-fBodyAcc-meanFreq()-Z

345-fBodyAccJerk-mean()-X

346-fBodyAccJerk-mean()-Y

347-fBodyAccJerk-mean()-Z

348-fBodyAccJerk-std()-X

349-fBodyAccJerk-std()-Y

350-fBodyAccJerk-std()-Z

373-fBodyAccJerk-meanFreq()-X

374-fBodyAccJerk-meanFreq()-Y

375-fBodyAccJerk-meanFreq()-Z

424-fBodyGyro-mean()-X

425-fBodyGyro-mean()-Y

426-fBodyGyro-mean()-Z

427-fBodyGyro-std()-X

428-fBodyGyro-std()-Y

429-fBodyGyro-std()-Z

452-fBodyGyro-meanFreq()-X

453-fBodyGyro-meanFreq()-Y

454-fBodyGyro-meanFreq()-Z

503-fBodyAccMag-mean()

504-fBodyAccMag-std()

513-fBodyAccMag-meanFreq()

516-fBodyBodyAccJerkMag-mean()

517-fBodyBodyAccJerkMag-std()

526-fBodyBodyAccJerkMag-meanFreq()

529-fBodyBodyGyroMag-mean()

530-fBodyBodyGyroMag-std()

539-fBodyBodyGyroMag-meanFreq()

542-fBodyBodyGyroJerkMag-mean()

543-fBodyBodyGyroJerkMag-std()

552-fBodyBodyGyroJerkMag-meanFreq()




