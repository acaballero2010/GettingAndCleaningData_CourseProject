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





