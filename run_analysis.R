library(reshape2)

## read activity labels
activity_labels <-read.table("UCI HAR Dataset\\activity_labels.txt")

## read train data set
initial <- read.table("UCI HAR Dataset\\train\\X_train.txt", nrows=100)
classes <- sapply(initial, class)
X_train <- read.table("UCI HAR Dataset\\train\\X_train.txt", colClasses = classes)
y_train <- read.table("UCI HAR Dataset\\train\\y_train.txt")
subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")

## add in column for activity labels and subject
X_train$activity <- factor(y_train$V1, labels = activity_labels$V2)
X_train$subject <- subject_train$V1

## read test data set
initial <- read.table("UCI HAR Dataset\\test\\X_test.txt", nrows=100)
classes <- sapply(initial, class)
X_test <- read.table("UCI HAR Dataset\\test\\X_test.txt", colClasses = classes)
y_test <- read.table("UCI HAR Dataset\\test\\y_test.txt")
subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")

## add in column for activity labels and subject
X_test$activity <- factor(y_test$V1, labels = activity_labels$V2)
X_test$subject <- subject_test$V1

## merge data sets
X_merged <- rbind(X_train, X_test)

## read in column names
features <- read.table("UCI HAR Dataset\\features.txt")
features$V2 <- as.character(features$V2)

## add in column name for activity label
features[length(features$V2)+1,] <- c(length(features$V2)+1, "activity")
features[length(features$V2)+1,] <- c(length(features$V2)+1, "subject")

## set column names
names(X_merged) <- features$V2

## drop non mean() and std() columns
grepl_results <- grepl("mean\\(\\)|std\\(\\)|activity|subject", features$V2)
X_merged <- subset(X_merged, select = grepl_results)

## rename variable names with descriptive variable names
names(X_merged) <- sub("mean\\(\\)", "Mean", names(X_merged))
names(X_merged) <- sub("std\\(\\)", "StdDev", names(X_merged))
names(X_merged) <- sub("BodyBody", "Body", names(X_merged))

## melt X_merged to X_melt, specifying the 66 columns as variable
the_id <- c("subject", "activity")
X_melt <- melt(X_merged, id=the_id, measure.vars = names(X_merged)[c(1:66)])

## cast X_melt, subject, activity by variable, and aggregate using mean
X_dcast <- dcast(X_melt, subject + activity ~ variable, mean)

## save tidy data to text file
write.table(X_dcast, file="tidydata.txt",row.names=FALSE)

## to read tidy data text file
## X_dcast_read <- read.table("tidydata.txt",header=TRUE)
