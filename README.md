coursera-getting-cleaning-data-proj
============================== 
   
Repository: Getting and Cleaning Data Course Project. 
   
### run_analysis.R 
  
To run the program, simply download the zip file that contains the data from:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Then save it to your computer to your desired location and unzip the files.
Within the location that you unzip the file, create a directory called tidy_data to store the tidy data latet
Then set your working directorey to the root directory where you store the files.
Example: setwd("C:/Users/Steve/Documents/Datasciencecoursera/UCI_HAR_Dataset/")
Last, source the included R file: run_analysis.R

   
```r 
source('./run_analysis.R') 
 ``` 
 
In the case the Samsung data is already unzipped and directory with the dataset is available as 
`UCI HAR Dataset` subdirectory of the current directory, the processing function `run.analysis()` can be  
called straight away. 
 

+## Processing steps 
+ 
+When sourced, it executes the code, which kicks off the data processing, which read the test and training data is read in, merged into one dataset, manipulated, summarized and written out.
+ 
+The tidy dataset is written the the tidy_data directory which you create above
