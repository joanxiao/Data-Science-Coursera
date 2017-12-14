
# Step 1: Merges the training and the test sets to create one data set.
# Merge x_train and x_test to one data set
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", 
                      sep="", 
                      strip.white=TRUE, 
                      header=FALSE, 
                      stringsAsFactors=FALSE)
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", 
                     sep="", 
                     strip.white=TRUE, 
                     header=FALSE, 
                     stringsAsFactors=FALSE)
x <- rbind(x_train, x_test)

# Merge y_train and y_test to one data set
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", 
                      sep="", 
                      strip.white=TRUE, 
                      header=FALSE, 
                      stringsAsFactors=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", 
                     sep="", 
                     strip.white=TRUE, 
                     header=FALSE, 
                     stringsAsFactors=FALSE)
y <- rbind(y_train, y_test)
names(y) <- "Activity_ID"

# Merge subject_train and subject_test to one data set
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", 
                      sep="", 
                      strip.white=TRUE, 
                      header=FALSE, 
                      stringsAsFactors=FALSE,
                      col.names="Subject")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", 
                            sep="", 
                            strip.white=TRUE, 
                            header=FALSE, 
                            stringsAsFactors=FALSE,
                            col.names="Subject")
subject <- rbind(subject_train, subject_test)

# Combine all data sets above to one single data set
data <- cbind(subject, y, x)


# Step 2: Extracts only the measurements on the mean and standard deviation for 
# each measurement.  
features <- read.table("./UCI HAR Dataset/features.txt", 
                       stringsAsFactors=FALSE, 
                       col.names=c("Feature_ID", "Feature_Name"))

meanFeatureIDs <- grep("mean\\(\\)", features[,2])
meanData <- x[, meanFeatureIDs]

stdFeatureIDs <- grep("std()", features[,2]) 
stdData <- x[, stdFeatureIDs]

# Step 3: Uses descriptive activity names to name the activities in the data set
# load activity labels
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", 
                    stringsAsFactors=FALSE, 
                    col.names=c("Activity_ID", "Activity_Name"))

library("plyr")
activitiesPerformed <- join(y, activities)
extractedData <- cbind(subject, activitiesPerformed[,2], meanData, stdData)

# Step 4: Appropriately labels the data set with descriptive variable names. 
meanFeatureNames <- features[meanFeatureIDs,]$Feature_Name
stdFeatureNames <- features[stdFeatureIDs,]$Feature_Name
names(extractedData) <- c("Subject", "Activity", meanFeatureNames, stdFeatureNames)

# Step 5: From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.
tidyData <- aggregate(extractedData[3:68], extractedData[1:2], FUN="mean")

# Save tidy data set to a file
write.table(tidyData, file="./tidyData.txt", row.names=FALSE)

# Cdoe to test the script
#testData <- read.table("./tidyData.txt", header = TRUE, 
#stringsAsFactors=FALSE, check.names=FALSE)

