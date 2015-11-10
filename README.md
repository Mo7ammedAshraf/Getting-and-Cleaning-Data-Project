################################################
## Getting and Cleaning Data: Course Project ###
################################################

#=========================================
#	A)	Prerequisites:
#=========================================
1. the UCI HAR Dataset must be exists in the working directory.
2. the UCI HAR Dataset must be availble in a directory called "UCI HAR Dataset"

#=========================================
#	B)	About the script and the tidy dataset
#=========================================
The run_analysis.R which do the following fnctions:

1. Loads both the training and test datasets
2. ActivityLabels and Features data.
3. Clean the Features names.
4. Bind both Trainig and Test data.
5. Extracts only the measurements on the mean and standard deviation for each measurement.
6. Uses descriptive activity names to name the activities in the data set.
7. Appropriately labels the data set with descriptive variable names. 
8. Create a tidy data set named tidy.txt in the working directory.