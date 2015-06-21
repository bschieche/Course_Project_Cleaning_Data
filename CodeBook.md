---
output: html_document
---
### Getting and Cleaning Data Course Project: Code Book

Bettina Schieche, June, 19, 2015

### Output:

tidy data set `tidy_data.txt`

### Variable names

1. subjectNumber: numbers from 1 to 30 refering to the person of the observation
2. activityLabel: the type of activity of the corresponging observation
  * WALKING
  * WALKING_UPSTAIRS 
  * WALKING_DOWNSTAIRS 
  * SITTING
  * STANDING
  * LAYING
3. timeBodyAccMEANX
4. timeBodyAccMEANY
5. timeBodyAccMEANZ
6. timeGravityAccMEANX
7. timeGravityAccMEANY
8. timeGravityAccMEANZ
9. timeBodyAccJerkMEANX
10. timeBodyAccJerkMEANY
11. timeBodyAccJerkMEANZ
12. timeBodyGyroMEANX
13. timeBodyGyroMEANY
14. timeBodyGyroMEANZ
15. timeBodyGyroJerkMEANX
16. timeBodyGyroJerkMEANY
17. timeBodyGyroJerkMEANZ
18. timeBodyAccMagMEAN
19. timeGravityAccMagMEAN
20. timeBodyAccJerkMagMEAN
21. timeBodyGyroMagMEAN
22. timeBodyGyroJerkMagMEAN
23. freqBodyAccMEANX
24. freqBodyAccMEANY
25. freqBodyAccMEANZ
26. freqBodyAccJerkMEANX
27. freqBodyAccJerkMEANY
28. freqBodyAccJerkMEANZ
29. freqBodyGyroMEANX
30. freqBodyGyroMEANY
31. freqBodyGyroMEANZ
32. freqBodyAccMagMEAN
33. freqBodyAccJerkMagMEAN
34. freqBodyGyroMagMEAN
35. freqBodyGyroJerkMagMEAN
36. timeBodyAccSTDX
37. timeBodyAccSTDY
38. timeBodyAccSTDZ
39. timeGravityAccSTDX
40. timeGravityAccSTDY
41. timeGravityAccSTDZ
42. timeBodyAccJerkSTDX
43. timeBodyAccJerkSTDY
44. timeBodyAccJerkSTDZ
45. timeBodyGyroSTDX
46. timeBodyGyroSTDY
47. timeBodyGyroSTDZ
48. timeBodyGyroJerkSTDX
49. timeBodyGyroJerkSTDY
50. timeBodyGyroJerkSTDZ
51. timeBodyAccMagSTD
52. timeGravityAccMagSTD
53. timeBodyAccJerkMagSTD
54. timeBodyGyroMagSTD
55. timeBodyGyroJerkMagSTD
56. freqBodyAccSTDX
57. freqBodyAccSTDY
58. freqBodyAccSTDZ
59. freqBodyAccJerkSTDX
60. freqBodyAccJerkSTDY
61. freqBodyAccJerkSTDZ
62. freqBodyGyroSTDX
63. freqBodyGyroSTDY
64. freqBodyGyroSTDZ
65. freqBodyAccMagSTD
66. freqBodyAccJerkMagSTD
67. freqBodyGyroMagSTD
68. freqBodyGyroJerkMagSTD

### Where do the features come from: modified version of `feature_info.txt` from original data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals (Acc and Gyro). These time domain signals (prefix 'time') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcc and timeGravityAcc) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk and timeBodyGyroJerk). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAcc, freqBodyAccJerk, freqBodyGyro, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag. (Note the 'freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* timeBodyAccXYZ
* timeGravityAccXYZ
* timeBodyAccJerkXYZ
* timeBodyGyroXYZ
* timeBodyGyroJerkXYZ
* timeBodyAccMag
* timeGravityAccMag
* timeBodyAccJerkMag
* timeBodyGyroMag
* timeBodyGyroJerkMag
* freqBodyAccXYZ
* freqBodyAccJerkXYZ
* freqBodyGyroXYZ
* freqBodyAccMag
* freqBodyAccJerkMag
* freqBodyGyroMag
* freqBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value (indicated by MEAN)
* std(): Standard deviation (indicated by STD)
