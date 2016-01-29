library(dplyr)

# Create ProjData directory
if (!dir.exists(file.path(getwd(), "ProjData"))) {
    dir.create(file.path(getwd(), "ProjData"))
}

# Download dataset zipfile to ./ProjData dir
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, "./ProjData/UCI_HAR_Dataset.zip")

# Read Test and Train datasets
testzip <- unz("./ProjData/UCI_HAR_Dataset.zip", "UCI HAR Dataset/test/X_test.txt")
trainzip <- unz("./ProjData/UCI_HAR_Dataset.zip", "UCI HAR Dataset/train/X_train.txt")
testdata <- read.table(testzip, header=FALSE)
traindata <- read.table(trainzip, header=FALSE)
rm(testzip)
rm(trainzip)

# Names of features (Variables)
featureszip <- unz("./ProjData/UCI_HAR_Dataset.zip", "UCI HAR Dataset/features.txt")
features <- read.table(featureszip, header=FALSE)
rm(featureszip)

# Update variables name of testdata and traindata
names(testdata) <- features$V2
names(traindata) <- features$V2

# Extract only measurements on the mean and standard deviation
testdata <- testdata[grepl("mean|std", names(testdata)) & !grepl("meanFreq", names(testdata))]
traindata <- traindata[grepl("mean|std", names(traindata)) & !grepl("meanFreq", names(traindata))]


#### PROCESS ACTIVITIES DATAFRAME
# Activities
testactzip <- unz("./ProjData/UCI_HAR_Dataset.zip", "UCI HAR Dataset/test/y_test.txt")
trainactzip <- unz("./ProjData/UCI_HAR_Dataset.zip", "UCI HAR Dataset/train/y_train.txt")
testact <- read.table(testactzip, header=FALSE)
trainact <- read.table(trainactzip, header=FALSE)
rm(testactzip)
rm(trainactzip)

names(testact) <- c("ActID")
names(trainact) <- c("ActID")

#Activity Labels
actlabzip <- unz("./ProjData/UCI_HAR_Dataset.zip", "UCI HAR Dataset/activity_labels.txt")
actlab <- read.table(actlabzip, header=FALSE)
rm(actlabzip)

names(actlab) <- c("ActID", "Activity")


#### PROCESS SUBJECTS DATAFRAME
testsubjzip <- unz("./ProjData/UCI_HAR_Dataset.zip", "UCI HAR Dataset/test/subject_test.txt")
trainsubjzip <- unz("./ProjData/UCI_HAR_Dataset.zip", "UCI HAR Dataset/train/subject_train.txt")
testsubj <- read.table(testsubjzip, header=FALSE)
trainsubj <- read.table(trainsubjzip, header=FALSE)
rm(testsubjzip)
rm(trainsubjzip)

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

write.table(mergedata_grouped, file="./ProjData/summarised_dataset.txt", row.names=FALSE) 

