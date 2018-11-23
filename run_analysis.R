# For this to work you have to set the working 
# directory to the UCI HAR Dataset folder
library(data.table)
# first i need to get the <id, label> of activities(WALKING, etc) 
# and the feature description files which are in the root of UCI HAR Dataset folder
activity_names <- fread("activity_labels.txt")
setnames( activity_names, c("V1", "V2"), c("id", "activityLabel") )
feature_names <- fread("features.txt")
setnames( feature_names, c("V1", "V2"), c("id", "label") )
# then we have to read the measurements files for train and test
twofolders <- c("train", "test") 
for (onefolder in twofolders) {
  files <- list.files(pattern = "\\.txt$", path = onefolder)
  for (onefile in files) {
    assign( 
      paste(onefolder, "_", onefile, sep = ""), 
      fread( paste(onefolder, "/", onefile, sep = "") ) 
    )
  }
}
# Then we need to put toguether the activity id, 
# 128 sized vector of measures and the subject
# but first lets get the vector of measurements we are going to take
selected_features <- feature_names[ grep('\\b(mean()|std())\\b', label) ]
# lets make variable names correctly descriptive
selected_features[[2]] <- gsub("[()|-]","", selected_features[[2]])
selected_features[[2]] <- gsub("^f", "frequency", selected_features[[2]])
selected_features[[2]] <- gsub("^t", "time", selected_features[[2]])
selected_features[[2]] <- gsub("Acc", "Accelerometer", selected_features[[2]])
selected_features[[2]] <- gsub("Gyro", "Gyroscope", selected_features[[2]])
selected_features[[2]] <- gsub("Mag", "Magnitude", selected_features[[2]])
selected_features[[2]] <- gsub("mean", "Mean", selected_features[[2]])
selected_features[[2]] <- gsub("std", "StandardDeviation", selected_features[[2]])
# lets name the variables properly for the test set
test_subset_X <- test_X_test.txt[, selected_features[[1]], with = FALSE]
setnames( test_subset_X, colnames(test_subset_X), selected_features[[2]] )
# lets name the variables properly for the train set
train_subset_X <- train_X_train.txt[, selected_features[[1]], with = FALSE]
setnames( train_subset_X, colnames(train_subset_X), selected_features[[2]] )
#lets name the variables properly for the subjects
setnames(train_subject_train.txt, c("V1"), c("subjectId")) 
setnames(test_subject_test.txt, c("V1"), c("subjectId"))
setnames(test_y_test.txt, c("V1"), c("id"))
setnames(train_y_train.txt, c("V1"), c("id"))
# lets combine the activities id table with the observations tables
# and the subjects table
test_subset_X <- cbind(test_y_test.txt, test_subset_X)
test_subset_X <- cbind(test_subject_test.txt, test_subset_X)
train_subset_X <- cbind(train_y_train.txt, train_subset_X)
train_subset_X <- cbind(train_subject_train.txt, train_subset_X)
# lets start the join by setting the keys for the tables
setkey(activity_names,id)
setkey(test_subset_X,id)
setkey(train_subset_X,id)
test_subset_X <- test_subset_X[activity_names, nomatch=0]
train_subset_X <- train_subset_X[activity_names, nomatch=0]
# lets join the test and train set toguether
final_dataset <- rbind(test_subset_X, train_subset_X)
# ill remove the activity id as is useless now
final_dataset[,id:=NULL]
# summarize the values by actor and activity
summary_table <- final_dataset[, lapply(.SD, mean), by=list(activityLabel, subjectId)]

# write the 2 data sets to their respective file
fwrite(final_dataset, "final_dataset.txt", col.names = FALSE)
fwrite(summary_table, "summary_table.txt", col.names = FALSE)


