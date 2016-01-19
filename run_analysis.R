library(dplyr)

#### PROCESS TEST DATA DATAFRAME
# Train and Test data frames
testdata <- read.table("./test/X_test.txt", header=FALSE)
traindata <- read.table("./train/X_train.txt", header=FALSE)

# Names of features (Variables)
features <- read.table("./features.txt", header=FALSE)

# Update variables name of testdata and traindata
names(testdata) <- features$V2
names(traindata) <- features$V2

# Extract only measurements on the mean and standard deviation
testdata <- testdata[grepl("mean|std", names(testdata)) & !grepl("meanFreq", names(testdata))]
traindata <- traindata[grepl("mean|std", names(traindata)) & !grepl("meanFreq", names(traindata))]


#### PROCESS ACTIVITIES DATAFRAME
# Activities
testact <- read.table("./test/y_test.txt", header=FALSE)
trainact <- read.table("./train/y_train.txt", header=FALSE)
names(testact) <- c("ActID")
names(trainact) <- c("ActID")

#Activity Labels
actlab <- read.table("activity_labels.txt", header=FALSE)
names(actlab) <- c("ActID", "Activity")


#### PROCESS SUBJECTS DATAFRAME
testsubj <- read.table("./test/subject_test.txt", header=FALSE)
trainsubj <- read.table("./train/subject_train.txt", header=FALSE)
names(testsubj) <- c("Subject")
names(trainsubj) <- c("Subject")


# We need to join 3 data frames: testdata, testact, testsubj by rownumber
# First, we create new column $rn, copying from row.names
testdata$rn <- row.names(testdata)
testact$rn <- row.names(testact)
testsubj$rn <- row.names(testsubj)

testdata <- merge(testact, testdata, by="rn", all=TRUE)
testdata <- merge(testsubj, testdata, by="rn", all=TRUE)

# Join 3 data frames: traindata, trainact, trainsubj by rownumber
traindata$rn <- row.names(traindata)
trainact$rn <- row.names(trainact)
trainsubj$rn <- row.names(trainsubj)

traindata <- merge(trainact, traindata, by="rn", all=TRUE)
traindata <- merge(trainsubj, traindata, by="rn", all=TRUE)


#Merge testdata and traindata 
mergedata <- rbind(testdata, traindata)

# Join testdata with actlab
mergedata <- merge(actlab, mergedata, by="ActID", all.y=TRUE)

# Remove ActID and rn columns
mergedata <- mergedata[,-c(1,3)]

# Update descriptive variable names
names(mergedata) <- gsub("[[:punct:]]", "", names(mergedata))  # Remove all special characters
names(mergedata) <- sub("^t", "Time - ", names(mergedata))
names(mergedata) <- sub("^f", "Frequency - ", names(mergedata))
names(mergedata) <- sub("Acc", " Acceleration", names(mergedata))
names(mergedata) <- sub("Gyro", " Gyroscope", names(mergedata))
names(mergedata) <- sub("Mag", " Magnitute", names(mergedata))
names(mergedata) <- sub("BodyBody", "Body", names(mergedata))
names(mergedata) <- sub("Jerk", " Jerk", names(mergedata))
names(mergedata) <- sub("mean", " - Mean", names(mergedata))
names(mergedata) <- sub("std", " - Standard Deviation", names(mergedata))
names(mergedata) <- sub("X", "-X.axis", names(mergedata))
names(mergedata) <- sub("Y", "-Y.axis", names(mergedata))
names(mergedata) <- sub("Z", "-Z.axis", names(mergedata))


# Group dataframe by Activity and Subject
mergedata_grouped <- mergedata %>% group_by(Activity, Subject) %>% summarise_each(funs(mean))

#write.table(mergedata_grouped, file="tidydataset.txt", row.names=FALSE)

