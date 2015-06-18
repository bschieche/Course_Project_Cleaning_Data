# This R script reads test and training data, combines them in one data set,
# extracts only these columns refering to mean or standard deviation values,
# and gets the average of all variable for each subject and activity.
# The result is the tidy data.

# Reads test and train data
test <- read.table("test/X_test.txt",sep="")
train <- read.table("train/X_train.txt",sep="")

# Reads feature vector and converts it into one single vector
features <- read.table("features.txt",sep="",col.names=c("number","features"))
features <- as.matrix(features)[,2]

# Extracts only the indices of the feature vector where variable names
# have "mean" or "std" in their names
mean_or_std_index <- c(grep("mean()",features,fixed=TRUE),grep("std()",features,fixed=TRUE))
features <- features[mean_or_std_index]

# Extracts only the measurements on the mean and standard deviation 
# for each measurement and merges them to one data set.
test <- test[,mean_or_std_index]
train <- train[,mean_or_std_index]
alldata <- rbind(test,train)

# Reads activity labels and and converts them into one single vector
labels <- read.table("activity_labels.txt")
labels <- as.character(labels[,2])

# Reads activity label numbers for each measurement for test and train data
# and concetenates them.
activityNoTest <- read.table("test/y_test.txt",sep="")
activityNoTrain <- read.table("train/y_train.txt",sep="")
activityNo <- rbind(activityNoTest,activityNoTrain)

# Reads subject numbers for each measurement for test and train data
# and concetenates them.
subjectNoTest <- read.table("test/subject_test.txt",sep="")
subjectNoTrain <- read.table("train/subject_train.txt",sep="")
subjectNo <- rbind(subjectNoTest,subjectNoTrain)

# Adds the subject and activity numbers to the data frame
alldata <- cbind(subjectNo,activityNo,alldata)

# Appropriately labels the data set with descriptive variable names stored in features. 
names(alldata) <- c('subject_number','activity_number',features)

# Splits alldata in data subsets where each subset refers to 
# a pair of subject and activity number
sepdata <- split(alldata, cbind(activityNo,subjectNo))

# From the data set in step 4, creates a second, independent 
# tidy data set with the average of each variable for each activity and 
# each subject. For that sapply is used on the split data with the 
# function colMeans. This is possible, because activity numbers are used
# instead of labels and each group has constant activity and subject number,
# so that their average remains the same. The result is transposed and 
# converted to a data frame.

tidy_data <- data.frame(t(sapply(sepdata,colMeans)))
# Uses descriptive activity names to name the activities in the data set.
tidy_data$activity_number <- factor(tidy_data$activity_number, labels = labels)
names(tidy_data)<- c('subject_number','activity_number',features)

# Writes tidy data into a new file named tidy_data.txt.
write.table(tidy_data,file="tidy_data.txt",row.names=FALSE)

# Prints the first 10 observations with subject number and activity label and
# first three features
tidy_data[1:10,1:5]
