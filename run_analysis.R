##1.Merges the training and the test sets to create one data set.

#Reading Data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", header = FALSE)
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)

#Merging Data
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

##2.Extracts only the measurements on the mean and standard deviation for each measurement. 

#Read Features descriptions
features <- read.table("UCI HAR Dataset/features.txt")

#Descriptive names to features column
names(features) <- c('feat_id', 'feat_name')
#Search for matches to argument mean or standard deviation (sd)  within each element of character vector
index_features <- grep("-mean\\(\\)|-std\\(\\)", features$feat_name) 
x <- x[, index_features] 
#Replaces all matches of a string features 
names(x) <- gsub("\\(|\\)", "", (features[index_features, 2]))

##3.Uses descriptive activity names to name the activities in the data set.
##4.Appropriately labels the data set with descriptive activity names.

#Read activity labels
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
#Descriptive names to activities column
names(activities) <- c('act_id', 'act_name')
y[, 1] = activities[y[, 1], 2]

names(y) <- "Activity"
names(subject) <- "Subject"

#Combines data table by columns
tidyData <- cbind(subject, y, x)

#5.Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
p <- tidyData[, 3:dim(tidyData)[2]] 
tidyDataAvg <- aggregate(p,list(tidyData$Subject, tidyData$Activity), mean)

# Activity and Subject name of columns 
names(tidyDataAvg)[1] <- "Subject"
names(tidyDataAvg)[2] <- "Activity"

# Creating file
write.table(tidy, "tidy.txt", row.names=FALSE)