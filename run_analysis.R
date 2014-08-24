## Steve Anderson
## Data Science Specialization
## - R Programming Course
## August 24, 2014
## This R script reads course datasets, cleans and tidy it.
## Assignment instructions are below. Instructions include 5 steps

## You should create one R script called run_analysis.R that does the following. 
## 1.Merges the training and the test sets to create one data set.
## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive variable names. 
## 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Step 1: Merges the training and the test sets to create one data set. 
# setwd("C:/Users/Steve/Documents/Datasciencecoursera/UCI_HAR_Dataset/")
train_x_data <- read.table("./train/X_train.txt") # reads training data
dim(train_x_data)
head(train_x_data) 
train_y_data <- read.table("./train/y_train.txt") # reads training data
table(train_y_data) 
train_subject <- read.table("./train/subject_train.txt") # reads subject training data
test_data_x <- read.table("./test/X_test.txt") 
dim(test_data_x)
test_data_y <- read.table("./test/y_test.txt") # reads test data
table(test_data_y)  
test_subject <- read.table("./test/subject_test.txt") # reads test subject data
merge_data <- rbind(train_x_data, test_data_x) # merge data
dim(merge_data)
merge_y_data <- rbind(train_y_data, test_data_y) # merge data
dim(merge_y_data)
merge_subject <- rbind(train_subject, test_subject) # merge data
dim(merge_subject)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
features_data <- read.table("./features.txt") 
dim(features_data)
mean_std <- grep("mean\\(\\)|std\\(\\)", features_data[, 2]) 
length(mean_std)
merge_data <- merge_data[, mean_std] 
dim(merge_data)
names(merge_data) <- gsub("\\(\\)", "", features_data[mean_std, 2]) # remove "()" 
names(merge_data) <- gsub("mean", "Mean", names(merge_data)) # capitalize M 
names(merge_data) <- gsub("std", "Std", names(merge_data)) # capitalize S 
names(merge_data) <- gsub("-", "", names(merge_data)) # remove "-" in column names  

# Step3: Uses descriptive activity names to name the activities in the data set 
activity_label <- read.table("./activity_labels.txt") 
activity_label[, 2] <- tolower(gsub("_", "", activity_label[, 2])) 
substr(activity_label[2, 2], 8, 8) <- toupper(substr(activity_label[2, 2], 8, 8)) 
substr(activity_label[3, 2], 8, 8) <- toupper(substr(activity_label[3, 2], 8, 8)) 
act_label_final <- activity_label[merge_y_data[, 1], 2] 
merge_y_data[, 1] <- act_label_final
names(merge_y_data) <- "activity_label" 

# Step 4: Appropriately labels the data set with descriptive variable names.  
names(merge_subject) <- "subject" 
cleaned_data <- cbind(merge_subject, merge_y_data, merge_data) 
dim(cleaned_data) # 10299*68 
write.table(cleaned_data, "./tidy_data/cleaned_merged_data.txt") # write out the merged dataset to tidy_data directory

# Step 5: Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
subject_len <- length(table(merge_subject)) # 30 
activity_len <- dim(activity_label)[1] # 6 
column_len <- dim(cleaned_data)[2] 
result <- matrix(NA, nrow=subject_len*activity_len, ncol=column_len)  
result <- as.data.frame(result) 
colnames(result) <- colnames(cleaned_data) 
row <- 1 
for(i in 1:subject_len) { 
  for(j in 1:activity_len) { 
    result[row, 1] <- sort(unique(merge_subject)[, 1])[i] 
    result[row, 2] <- activity_label[j, 2] 
    bool1 <- i == cleaned_data$subject 
    bool2 <- activity_label[j, 2] == cleaned_data$activity_label 
    result[row, 3:column_len] <- colMeans(cleaned_data[bool1&bool2, 3:column_len]) 
    row <- row + 1 
  } 
} 
head(result) 
write.table(result, "./tidy_data/tidy_data_means.txt", row.names = FALSE) # write out the dataset with means to tidy_data director

