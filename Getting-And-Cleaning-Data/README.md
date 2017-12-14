
This repository contains the following: 

* a R script for the course project of Coursera course Getting And Cleaning Data. The file name is run_analysis.R.  
* a code book that describes all the variables in the data set returned from running the script.

---

To run the script, you need do the following: 

1. Get the data from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and unzip the oontent in a folder "UCI HAR Dataset".   
2. Download run\_analysis.R and place it at the same folder which contains the folder "UCI HAR Dataset".  
3. Open R Studio and run the command: <span style="color:blue;font-style: italic">source("run\_analysis.R")</span>.  
4. To test the sript, run the command:  
   <span style="color:blue;font-style: italic">tidyData <- read.table("./tidyData.txt", header = TRUE, stringsAsFactors=FALSE, check.names=FALSE)</span>.   
   The data frame tidyData should contain 180 observations of 68 variables. The 180 observations are for 30 subjects with 6 activities each. 

---

The script does the following:  

1.  Merges the training and the test sets to create one data set. This includes:  

  - Merge x\_train and x\_test to one data set  
  - Merge y\_train and y\_test to one data set  
  - Merge subject\_train and subject\_test to one data set  
  - Merge the data sets above to one single data set  
2.  Extracts only the measurements on the mean and standard deviation for each measurement. This is done by using the grep function.  
3.  Uses descriptive activity names to name the activities in the data set. This is done  by using the join function in plyr package to join with data set from activity_labels.txt to get activity names.   
4.  Appropriately labels the data set with descriptive variable names.  
5.  From the data set in step 4, creates a tidy data set with the average of each variable for each activity and each subject. This is done by using the aggregate function.   
6.  Write tidy data set to a file "tidyData.txt" in the same folder where the R script is.  

  