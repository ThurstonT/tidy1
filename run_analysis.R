header <- function() {
# the objective of this function is to build the list of columns names for the output data.  Read in the column names and then 
# extract the column names that are part of the data set we want to keep. 
     cn <- read.csv2(file="C:/Coursera/data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", sep=" ",header = FALSE)

    # prepend the column number to the column name.  This will retain columns that have duplicate names and allow the users of 
    # the data to reference the output data to the input data by column numbers. 
    cn3 <- paste(cn[,1],"-",cn[,2], sep="")
    listOfData = length(cn3)                     # prepare to search through column names
    mean_std  <- c("subject", "activity")        # we will want the output data to have subject and activity so add those columns
                                                  #prepare collection for column names that contain mean or std
    # loop through list of data 
    for (i in 1:listOfData)
    {
       # check to see if the column header contains the phrase mean or std. If so put it in the output data set        
       if(grepl("mean", cn3[i]) | grepl("std", cn3[i]))
       {
           mean_std <- c(mean_std,cn3[i])
        }
    }
    mean_std
}

xlate_activity <- function(active_type){
    # read the type of activities that have been performed by the subjects. 
    activity_labels <- read.csv2(file="C:/Coursera/data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", sep=" ",header = FALSE)
    # read the activites for the training subjects. translate the number of the training activity to the activity itself
    # read the activity type and the subject for the training date
    if (active_type == "train"){
        activity  <- read.csv2(file="C:/Coursera/data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt",
                               sep=" ",header = FALSE)
        subject <-  read.csv2(file="C:/Coursera/data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt",
                              sep=" ",header = FALSE)
    
    }else{
        # read the activity type and the subject for the test date
        activity  <- read.csv2(file="C:/Coursera/data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", 
                               sep=" ",header = FALSE)
        subject <-  read.csv2(file="C:/Coursera/data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt",
                              sep=" ",header = FALSE)
    }
    # translate activty numbers to activity names.
    for (i in 1:nrow(activity_labels)) {
        activity[,1] <- gsub(activity_labels$V1[i], activity_labels$V2[i], activity[,1])
    }

    # define the returning data structure as a data.frame upon its creation 
    info <- data.frame()
    info <- cbind(subject,activity)
    colnames(info) <- c("subject", "activity")
    info  # data frame that is returned to the calling function
}

mean_std_data_set <- function(){
    # Get column names with only mean and standard deviation header
    mean_std_col <- header()
    
    #get file header names()
    c_names <- read.csv2(file="C:/Coursera/data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", sep=" ",header = FALSE)
    # important step the column number is pre-pended to the column name.  This allows for duplicate column names and for the
    # user of the data to trace the data back to the orignating column 
    c_names<- paste(c_names[,1],"-",c_names[,2], sep="")

############################################
##
##   Get and prepare training data
##
############################################    
    # get training data 
    training_data <- read.csv2(file="C:/Coursera/data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", sep="",header = FALSE)

    # add column names to training data
    colnames(training_data) <- c_names

    # add subject and activyt information to the left side of the data frame. 
    # first get the subject and activity data frame 
    subject_activity <- xlate_activity("train")
    # put the subject and activity informaiton on the left side of the training data data frame. 
    training_data <- cbind(subject_activity, training_data)

############################################
##
##   Get and prepare test data
##
############################################        
    # get test data 
    test_data <- read.csv2(file="C:/Coursera/data/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", sep="",header = FALSE)

    # add column names to test data
    colnames(test_data) <- c_names 

    # add subject and activyt information to the left side of the data frame. 
    # first get the subject and activity data frame 
    subject_activity <- xlate_activity("test")
    # put the subject and activity informaiton on the left side of the training data data frame. 
    test_data <- cbind(subject_activity, test_data)

    ############################################
    ##
    ##   This is the point in the code where the two data data are murged together.  
    ##
    ############################################        
    all_data <- rbind(training_data, test_data)    
    ms_data <- all_data[,mean_std_col]    # select only the 
    ms_data
}

##########################################################################################################################
#
# this is the main calling function.  Call this function, it will initiate and finalize all of the data translations. 
#
#
##########################################################################################################################
run_analysis <-function( ){
    data1 <- mean_std_data_set()
    # make the final data set
    # the mean for each of the columns of for each of the 30 participants and each of the activity types. 
    final_data <- data.frame()
    # give final_data its column names
    # extract all of the subject numbers from the data frame.   
    subjects <- unique(data1$subject)
    subjects <- sort(subjects)                       # sort the subjects 
    activity <- unique(data1$activity)               # get a single list of activities
  
    datarow <- c()                                   # prepare a datarow data structure for temporary use.
    num_cols <- ncol(data1)                          # determine how many columns in this data. 
################################
#    
# build the output data structure 
#
################################
    for (i in 1:length(subjects)){
       for (j in 1:length(activity)){
           datarow <-cbind(paste("Subject-",subjects[i],sep=""),activity[j])
           for (k in 3:num_cols){
             element<- subset(data1[k],data1$subject==i & data1$activity==activity[j] )  
             mean_val <- mean(as.numeric(as.character(element[!is.na(element)])))
            datarow <- cbind(datarow,mean_val )   
           }
           final_data <- rbind(final_data,datarow)
       }
    }
    # add column names to the final output data frame
    colnames(final_data) <- colnames(data1)
    
    # write the output data frame to a file. 
    write.table(gd1,file="c:/Coursera/data/clean-tidy.txt", row.name=FALSE)

    # return the data structure 
    final_data
}