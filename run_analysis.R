## Checks if the reshape2 package is installed and installs it if required
if(!require(reshape2)){
  install.packages("reshape2")
  library(reshape2)
}

## Reading the 561 features from and the 6 activity names
feature.names<- read.table("features.txt")
activity.names <- read.table("activity_labels.txt")

## Reading the 7352 instances of recording in the train data set and combining 
## them into a single data frame called combined.train
subj.train <- read.table("./train/subject_train.txt")
colnames(subj.train) <- "subject.code"

X.train <- read.table("./train/X_train.txt")
colnames(X.train) <- feature.names[,2]

Y.train <- read.table("./train/y_train.txt")
colnames(Y.train) <- "activity"

combined.train <- as.data.frame(cbind(subj.train, Y.train, X.train))
combined.train[,2] <- factor(combined.train[,2],activity.names[,1],activity.names[,2])

## Reading the 2947 instances of recording in the test data set and combining 
## them into a single data frame called combined.test
subj.test <- read.table("./test/subject_test.txt")
colnames(subj.test) <- "subject.code"

X.test <- read.table("./test/X_test.txt")
colnames(X.test) <- feature.names[,2]

Y.test <- read.table("./test/y_test.txt")
colnames(Y.test) <- "activity"

combined.test <- as.data.frame(cbind(subj.test, Y.test, X.test))
combined.test[,2] <- factor(combined.test[,2],activity.names[,1],activity.names[,2])

## Merging by rows, the train and test data set into a single data set 
## called combined.data
combined.data <- rbind(combined.train, combined.test)
combined.data <- combined.data[order(combined.data[,1]),]
combined.data[,1] <- factor(combined.data[,1])

## Selecting only the variables required for the course project; the required
## variables are selected by using the grep() function
req.data <- combined.data[,c(1,2,sort(c(grep("mean()",feature.names[,2],fixed=TRUE),grep("std()",feature.names[,2],fixed=TRUE)))+2)]
names(req.data) <- gsub("()","",names(req.data),fixed=TRUE)
names(req.data) <- gsub("-",".",names(req.data))


## Melting and Dcasting the data.frame to give the average values of the 66 
## variables for each combination of subject and activity
melt.data <- melt(req.data,id=c(1,2), measure.vars=3:68)
dcast.data <- dcast(melt.data, subject.code + activity ~ variable,mean)

## Creating a txt file with the final output data set
write.table(dcast.data, file="tidy_data.txt")