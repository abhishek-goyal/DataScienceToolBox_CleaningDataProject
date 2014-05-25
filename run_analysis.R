# Reading files containing training data
trainData <- read.csv('train/X_train.txt', sep = "", header=FALSE);
trainSubject <- read.csv('train/subject_train.txt', sep = "", header=FALSE);
trainActivity <- read.csv('train/Y_train.txt', sep = "", header=FALSE);
colnames(trainData) <- c(1:dim(trainData)[2]);
trainData$Activity <- trainActivity[,1];
trainData$Subject <- trainSubject[,1];
rownames(trainData) <- NULL;

# Reading files containing test data
testData <- read.csv('test/X_test.txt', sep = "", header=FALSE);
testSubject <- read.csv('test/subject_test.txt', sep = "", header=FALSE);
testActivity <- read.csv('test/Y_test.txt', sep = "", header=FALSE);
colnames(testData) <- c(1:dim(testData)[2]);
testData$Activity <- testActivity[,1];
testData$Subject <- testSubject[,1];
rownames(testData) <- NULL;

# Combining test and training data
dataset <- rbind(trainData, testData);

# Getting only means and std dev
feature <- read.csv("features.txt", sep = "", header = FALSE);
meanAndDev <- grep("mean|std", feature[,2]);

# Reading activity labels
activities <-read.csv('activity_labels.txt', sep = "", header=FALSE,);

# Replacing activity numbers by labels
for (i in seq(activities[,1])) {
  dataset$Activity <- sub(as.character(i), replacement=activities[[i,2]] ,dataset$Activity);
}

# Adding Activity and Subject to clean data set
cleanSet <- dataset[,meanAndDev];
cleanSet <- cbind(as.factor(dataset$Subject), as.factor(dataset$Activity), cleanSet)

# Taking mean by Subject and Activity
cleanerSet <- aggregate(cleanSet[,3:dim(cleanSet)[2]], by=list(cleanSet[,1], cleanSet[,2]), FUN=mean);

# Writing to output file
write.table(cleanerSet[order(as.numeric(cleanerSet[, 1]), cleanerSet[, 2], decreasing = FALSE), ]
            , file="output.txt", quote = FALSE, col.names = FALSE, row.names = FALSE);
