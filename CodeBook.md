---
output: html_document
---
### Getting and Cleaning Data Course Project: Code Book

Bettina Schieche, June, 19, 2015

### Aim:

The R script `run_analysis.R` reads test and training data, combines them in one data set,
extracts only these columns refering to mean or standard deviation values,
and gets the average of all variable for each subject and activity.
The result is the tidy data.

### Output:

tidy data set `tidy_data.txt`

### How it runs:

1. Reading test and train data sets
<pre><code>
test <- read.table("test/X_test.txt",sep="")
train <- read.table("train/X_train.txt",sep="")
</code></pre>

2. Reading feature vector and convertíng it into one single vector
<pre><code>
features <- read.table("features.txt",sep="",col.names=c("number","features"))
features <- as.matrix(features)[,2]
</code></pre>

3. Extracting only the indices of the feature vector where variable names
refer to mean or standard deviation features
<pre><code>
mean_or_std_index <- c(grep("mean()",features,fixed=TRUE),grep("std()",features,fixed=TRUE))
features <- features[mean_or_std_index]
</code></pre>

4. Extracting the corresponding measurements and combine test and train data
<pre><code>
test <- test[,mean_or_std_index]
train <- train[,mean_or_std_index]
alldata <- rbind(test,train)
</code></pre>

5. Reading activity labels
<pre><code>
labels <- read.table("activity_labels.txt")
labels <- as.character(labels[,2])
</code></pre>

6. Reading activity label numbers for each measurement for test and train data
and concetenating them
<pre><code>
activityNoTest <- read.table("test/y_test.txt",sep="")
activityNoTrain <- read.table("train/y_train.txt",sep="")
activityNo <- rbind(activityNoTest,activityNoTrain)
</code></pre>

7. Reading subject numbers for each measurement for test and train data
and concetenating them
<pre><code>
subjectNoTest <- read.table("test/subject_test.txt",sep="")
subjectNoTrain <- read.table("train/subject_train.txt",sep="")
subjectNo <- rbind(subjectNoTest,subjectNoTrain)
</code></pre>

8. Adding subject and activity number to the data frame
<pre><code>
alldata <- cbind(subjectNo,activityNo,alldata)
</code></pre>

9. Setting descriptive variable nambes based on the used features
<pre><code>
names(alldata) <- c('subject_number','activity_number',features)
</code></pre>

10. Splitting data with respect to subject and activity number
<pre><code>
sepdata <- split(alldata, cbind(activityNo,subjectNo))
</code></pre>

11. Calculating the mean for each group and creating new data frame from the results
<pre><code>
tidy_data <- data.frame(t(sapply(sepdata,colMeans)))
</code></pre>

12. Replacing the activity numbers by descriptive activity labels
<pre><code>
tidy_data$activity_number <- factor(tidy_data$activity_number, labels = labels)
names(tidy_data)<- c('subject_number','activity_number',features)
</code></pre>

13. Writing tidy data set into `tidy_data.txt` without row names
<pre><code>
write.table(tidy_data,file="tidy_data.txt",row.names=FALSE)
</code></pre>

14. Printing the first 10 observations with subject number and activity label and
first three feature variables
<pre><code>
tidy_data[1:10,1:5]
</code></pre>

### Variable names

1. subject_number: numbers from 1 to 30 refering to the person of the observation
2. activity_label: the type of activity of the corresponging observation
  * WALKING
  * WALKING_UPSTAIRS 
  * WALKING_DOWNSTAIRS 
  * SITTING
  * STANDING
  * LAYING
3. tBodyAcc-mean()-X
4. tBodyAcc-mean()-Y
5. tBodyAcc-mean()-Z
6. tGravityAcc-mean()-X
7. tGravityAcc-mean()-Y
8. tGravityAcc-mean()-Z
9. tBodyAccJerk-mean()-X
10. tBodyAccJerk-mean()-Y
11. tBodyAccJerk-mean()-Z
12. tBodyGyro-mean()-X
13. tBodyGyro-mean()-Y
14. tBodyGyro-mean()-Z
15. tBodyGyroJerk-mean()-X
16. tBodyGyroJerk-mean()-Y
17. tBodyGyroJerk-mean()-Z
18. tBodyAccMag-mean()
19. tGravityAccMag-mean()
20. tBodyAccJerkMag-mean()
21. tBodyGyroMag-mean()
22. tBodyGyroJerkMag-mean()
23. fBodyAcc-mean()-X
24. fBodyAcc-mean()-Y
25. fBodyAcc-mean()-Z
26. fBodyAccJerk-mean()-X
27. fBodyAccJerk-mean()-Y
28. fBodyAccJerk-mean()-Z
29. fBodyGyro-mean()-X
30. fBodyGyro-mean()-Y
31. fBodyGyro-mean()-Z
32. fBodyAccMag-mean()
33. fBodyBodyAccJerkMag-mean()
34. fBodyBodyGyroMag-mean()
35. fBodyBodyGyroJerkMag-mean()
36. tBodyAcc-std()-X
37. tBodyAcc-std()-Y
38. tBodyAcc-std()-Z
39. tGravityAcc-std()-X
40. tGravityAcc-std()-Y
41. tGravityAcc-std()-Z
42. tBodyAccJerk-std()-X
43. tBodyAccJerk-std()-Y
44. tBodyAccJerk-std()-Z
45. tBodyGyro-std()-X
46. tBodyGyro-std()-Y
47. tBodyGyro-std()-Z
48. tBodyGyroJerk-std()-X
49. tBodyGyroJerk-std()-Y
50. tBodyGyroJerk-std()-Z
51. tBodyAccMag-std()
52. tGravityAccMag-std()
53. tBodyAccJerkMag-std()
54. tBodyGyroMag-std()
55. tBodyGyroJerkMag-std()
56. fBodyAcc-std()-X
57. fBodyAcc-std()-Y
58. fBodyAcc-std()-Z
59. fBodyAccJerk-std()-X
60. fBodyAccJerk-std()-Y
61. fBodyAccJerk-std()-Z
62. fBodyGyro-std()-X
63. fBodyGyro-std()-Y
64. fBodyGyro-std()-Z
65. fBodyAccMag-std()
66. fBodyBodyAccJerkMag-std()
67. fBodyBodyGyroMag-std()
68. fBodyBodyGyroJerkMag-std()

### Where do the features come from: extract of `feature_info.txt` from original data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

The complete list of variables of each feature vector is available in `features.txt`
