# Code Book
###Description of data sets used in the analysis  

- activity_labels  
Links the class labels with their activity name.    
- features  
List of all features.     
- subject_test   
Each row identifies the subject who performed the activity for each window sample      
- x_test  
Contains the test data set    
- y_test  
Activity labels for test data set    
- subject_train  
Each row identifies the subject who performed the activity for each window sample    
- x_train  
Contains the training data set    
- y_train  
Activity labels for training data set    
- one_set  
Merged x_test and x_train data set, 'data.frame':  2947 obs. of  561 variables    
- tidy_data  
Data set as result of removing duplicated variables from one_set    
- mean_data  
Extracted data set from tidy_data that contains mean measurements only    
- std_data  
Extracted data set from tidy_data that contains standard deviation measurements only  
- one_tidy_data  
Binding mean_data and std_data  
- merge_test_label  
Merged data set of y_test and activity labels  
- merge_train_label  
Merged data set of y_train and activity labels  
- one_activity_label  
Merged data set of merge_test_label and merge_train_label  
- merge_subject  
Merged data set of subjest_test and subject_train
- final_tidy_data  
The complete dataset with Subject, Activity Name, and Measurements variables

### Activities
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

### Features
- "tBodyAcc-mean()-X"  	
- "tBodyAcc-mean()-Y"  	
- "tBodyAcc-mean()-Z"  	
- "tGravityAcc-mean()-X"  	
- "tGravityAcc-mean()-Y"  	
- "tGravityAcc-mean()-Z"  	
- "tBodyAccJerk-mean()-X"  	
- "tBodyAccJerk-mean()-Y"  	
- "tBodyAccJerk-mean()-Z"  	
- tBodyGyro-mean()-X"	  
- "tBodyGyro-mean()-Y"  	
- "tBodyGyro-mean()-Z"  	
- "tBodyGyroJerk-mean()-X"  	
- "tBodyGyroJerk-mean()-Y"  	
- "tBodyGyroJerk-mean()-Z"  	
- "tBodyAccMag-mean()"  	
- "tGravityAccMag-mean()"  	
- "tBodyAccJerkMag-mean()"  	
- "tBodyGyroMag-mean()"  	
- "tBodyGyroJerkMag-mean()"	  
- "fBodyAcc-mean()-X"  	
- "fBodyAcc-mean()-Y"  	
- "fBodyAcc-mean()-Z"  	
- "fBodyAccJerk-mean()-X"	  
-  "fBodyAccJerk-mean()-Y"  	
- "fBodyAccJerk-mean()-Z"  	
- "fBodyGyro-mean()-X"  	
- "fBodyGyro-mean()-Y"  	
- "fBodyGyro-mean()-Z"  	
- "fBodyAccMag-mean()"  	
- "fBodyBodyAccJerkMag-mean()"    	
- "fBodyBodyGyroMag-mean()"    	
- "fBodyBodyGyroJerkMag-mean()"  	  
- tBodyAcc-std()-X"  	
- "tBodyAcc-std()-Y"  	
- "tBodyAcc-std()-Z"  	
- "tGravityAcc-std()-X"  	
- "tGravityAcc-std()-Y"  	
- "tGravityAcc-std()-Z"  	
- "tBodyAccJerk-std()-X"  	
- "tBodyAccJerk-std()-Y"  
- "tBodyAccJerk-std()-Z"  	
- "tBodyGyro-std()-X"  	
- "tBodyGyro-std()-Y"  	
- "tBodyGyro-std()-Z"  	
- "tBodyGyroJerk-std()-X"  	
- "tBodyGyroJerk-std()-Y"  	
- "tBodyGyroJerk-std()-Z"  	
- "tBodyAccMag-std()"	  
- "tGravityAccMag-std()"  	
- "tBodyAccJerkMag-std()"  	
- "tBodyGyroMag-std()"  	
- "tBodyGyroJerkMag-std()"  	
- "fBodyAcc-std()-X"  	
- "fBodyAcc-std()-Y"  	
- "fBodyAcc-std()-Z"  	
- "fBodyAccJerk-std()-X"  	
- "fBodyAccJerk-std()-Y"  	
- "fBodyAccJerk-std()-Z"  	
- "fBodyGyro-std()-X"  	
- "fBodyGyro-std()-Y"  	
- "fBodyGyro-std()-Z"  	
-  "fBodyAccMag-std()"  	
-  "fBodyBodyAccJerkMag-std()"  	
- "fBodyBodyGyroMag-std()"  	
- "fBodyBodyGyroJerkMag-std()"  



