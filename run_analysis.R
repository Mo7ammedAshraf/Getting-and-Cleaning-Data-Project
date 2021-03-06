setwd("./")

# Read Trainig Data
Training <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
Training <- cbind(Training, 
                  YTrain = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE),
                  SubjectTrain = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE))

# Read Test Data
Test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
Test <- cbind(Test, 
              YTest = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE),
              SubjectTest = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE))

# Read activityLabels Data
activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# Read and clean features Data
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

# bind Test and Training data
allData = rbind(Training, Test)
# Select only Mean and STD columns
MeanAndStdCols <- grep(".*Mean.*|.*Std.*", features[,2])

features <- features[MeanAndStdCols,]

MeanAndStdCols <- c(MeanAndStdCols, 562, 563)

allData <- allData[,MeanAndStdCols]

colnames(allData) <- c(features$V2, "Activity", "Subject")
colnames(allData) <- tolower(colnames(allData))

currentActivity = 1
for (currentActivityLabel in activityLabels$V2) {
  allData$activity <- gsub(currentActivity, currentActivityLabel, allData$activity)
  currentActivity <- currentActivity + 1
}

allData$activity <- as.factor(allData$activity)
allData$subject <- as.factor(allData$subject)

tidy = aggregate(allData, by=list(activity = allData$activity, subject=allData$subject), mean)
# Remove unused Columns
tidy[,90] = NULL
tidy[,89] = NULL
write.table(tidy, "tidy.txt", sep="\t", row.name=FALSE)