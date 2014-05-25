## Code book for Course project
## "Getting and Cleaning Data"

### Variables and Explanations

* feature.names	- [2X562] Contains the names of the 561 features along with a serial column.

* activity.names	- [6X2] Contains the activity codes and the corresponding names of the activities

* X.train		- [7352X561] Contains the feature values for the training data set

* Y.train		- [7352X1] Contains the activity codes for the training data set

* subj.train	- [7352X1] Contains the subject codes for the training data set

* X.test		- [2947X1] Contains the feature values for the test data set

* Y.test		- [2947X1] Contains the activity codes for the test data set

* subj.test	- [2947X1] Contains the subject codes for the test data set

* combined.train	- [7352X563] Combined data of subject codes, activity codes and feature values in that order for training data set

* combined.test	- [2947X563] Combined data of subject codes, activity codes and feature values in that order for test data set

* combined.data	- [10299X563] Combined data for the total training and test data sets

* req.data	- [10299X68] Combined data with training and test data for only the 66 features required along with subject and activity factors

* melt.data	- [679734X4] Melted data from req.data to be used for summarization based on subject and activity

* dcast.data	- [180X68] Subject and activity- wise casted data for the average values of 66 features

### Raw Data

The data for this project has been obtained from - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The unzipped folder contains 4 files and 2 folders

Files-

* README.txt - Explains the original data sourcing mechanism

* features_info.txt - Explains the process of obtaining 561 features from the original readings

* features.txt - Lists the feature names

* activity_labels.txt - The labels for the 6 activities that were recorded

Folders-

* train

* test

The folders contain

* subject_'folder name'.txt - The subject for the readings in the train data set as a factor

* X-'folder name'.txt - Contains the full readings for the 561 features in the train data set

* y-'folder name'.txt - The corresponding activity code that produced the readings in the train data set

Note: The Inertial Signals folders in both the train and test folders contain raw readings from the initial observations and as such are not required for this project.

### The Tidying process

* The feature names were obtained from the features.txt file
-Result-- feature.names

* The activity names were obtained from the activity_labels.txt file
-Result-- activity.names

Training Data Set

* The subjects for the corresponding readings in the training data set were passed on to the variable subj.train. The vector was named "subject.code"
-Result-- subj.train

* The 561 features for all the readings were read to the X.train variable. The features were given the names from the feature.names variable obtained above
-Result-- X.train

* The corresponding activities that the subject was doing during the readings were taken is obtained from y_train.txt and given to variable Y.train. The variable is given the name "activity"
-Result-- Y.train

* The whole dataset is combined with the first column describing the subjects who participated in the reading, followed by the activity they undertook and finally the 561 features that the readings obtained. The activity column (2nd column) is changed into a factor with the levels obtained from the activity names in Y.train
-Result-- combined.train

Test Data Set

*  The whole process is repeated with the test data set. Process is exactly same as above.
-Result-- subj.test, X.test, Y.test, combined.test

Combined Data Set

* Both the data frames from the training and test data sets are to be row bind using rbind. 

* The resulting dataframe has to sorted/ordered based on the subject codes. This will allow us to have a clean and nice data set at the end.

* After the sorting of the subject.code column, the column is to be converted to a factor
-Result-- combined.data

Required Data set

* The features required for the final output of the project are to be either a mean or a standard deviation of a particular reading. These were obtained by using the grep() function to get 66 variables in total. They are combined with the first two columns with the subject code and the activity to get 68 columns in the final data set. In total, there are 10299 observations.
-Result-- req.data

* The names of the variables contain characters like "(", ")", "-". There were removed or replaced with "." to get clean variable names.

Summarizing the data

* The melt and dcast functions in the reshape2 package are used to summarize the data in the req.data dataframe. The dataframe is summarized based on the first 2 columns i.e., the subject code and the activity. An average of the values is obtained for the 180 rows (30 subjects with 6 activities)
-Result-- melt.data, dcast.data

Writing to a file

* The final output of dcast.data is written into the a file named "tidy_data.txt" in the same folder as the working directory.
-Result-- "tidy_data.txt"