---
output: html_document
---
### Getting and Cleaning Data Course Project

Bettina Schieche, June, 19, 2015

### Relevant files

* `run_analysis.R`: R script to obtain a tidy data set based on
Human Activity Recognition Using Smartphones Dataset

* `CodeBook.md`: Information on the variables in the output data set and how it is obtained 

* `tidy_data.txt`: Tidy data, output data of the R script

* Original data

### Where original data comes from:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

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

4. Converting feature names to more descriptive variable names by making a help function
and applying it to all names
<pre><code>
cleanFeatureNames <- function(features) {
        features <- sub("BodyBody","Body",features)
        features <- sub("std","STD",features)
        features <- sub("mean","MEAN",features)
        features <- gsub("-","",gsub("\\(\\)","",features))
        if (substr(features,1,1)=="t"){
                sub("t","time",features) 
        }
        else if (substr(features,1,1)=="f"){
                sub("f","freq",features)
        }
}
features <- sapply(features,cleanFeatureNames,USE.NAMES=FALSE)
</code></pre>

5. Extracting the corresponding measurements and combine test and train data
<pre><code>
test <- test[,mean_or_std_index]
train <- train[,mean_or_std_index]
alldata <- rbind(test,train)
</code></pre>

6. Reading activity labels
<pre><code>
labels <- read.table("activity_labels.txt")
labels <- as.character(labels[,2])
</code></pre>

7. Reading activity label numbers for each measurement for test and train data
and concetenating them
<pre><code>
activityNoTest <- read.table("test/y_test.txt",sep="")
activityNoTrain <- read.table("train/y_train.txt",sep="")
activityNo <- rbind(activityNoTest,activityNoTrain)
</code></pre>

8. Reading subject numbers for each measurement for test and train data
and concetenating them
<pre><code>
subjectNoTest <- read.table("test/subject_test.txt",sep="")
subjectNoTrain <- read.table("train/subject_train.txt",sep="")
subjectNo <- rbind(subjectNoTest,subjectNoTrain)
</code></pre>

9. Adding subject and activity number to the data frame
<pre><code>
alldata <- cbind(subjectNo,activityNo,alldata)
</code></pre>

10. Setting descriptive variable nambes based on the used features
<pre><code>
names(alldata) <- c('subjectNumber','activityNumber',features)
</code></pre>

11. Splitting data with respect to subject and activity number
<pre><code>
sepdata <- split(alldata, cbind(activityNo,subjectNo))
</code></pre>

12. Calculating the mean for each group and creating new data frame from the results
<pre><code>
tidy_data <- data.frame(t(sapply(sepdata,colMeans)))
</code></pre>

13. Replacing the activity numbers by descriptive activity labels
<pre><code>
tidy_data$activityNumber <- factor(tidy_data$activityNumber, labels = labels)
names(tidy_data)<- c('subjectNumber','activityNumber',features)
</code></pre>

14. Writing tidy data set into `tidy_data.txt` without row names
<pre><code>
write.table(tidy_data,file="tidy_data.txt",row.names=FALSE)
</code></pre>

15. Printing the first 10 observations with subject number and activity label and
first three feature variables
<pre><code>
tidy_data[1:10,1:5]
</code></pre>
