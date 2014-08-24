+## Coursera Course: Getting and Cleaning Data 
+### Codebook 
+ 
+The generated flat file output is saved to tidy_data directory as file tidy_data_means.txt, which includes all rows joined from the test and training data included in the activity recognition dataset. 
+ 
+The data processing starts by reading the training (e.g. X_train.txt, y_train.txt, subject_train.txt) and test (e.g. X_test.txt, y_test.txt, subject_test.txt) data individually , and then joined all read datasets to create one dataset. The analysis addresses the training and test data separately, first combining the feature vector with outcome variables and subject identifiers (e.g. X_train.txt, Y_train.txt, subject_train.txt), and then merges the training and test data into a single, larger dataset. 
+ 
+Next, the data processing subsets the data to only include the mean and standard devation measurements from the original data are included. This includes all measurements identified by -mean() or -std() labels. 
+ 
+The code then takes the average value for each of these measurements by subject and activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). 
+ 
+Last, the code writes out a final flat file combines the average values by subject/activity pair for every mean or std devation measurement in the original training and test data. 
