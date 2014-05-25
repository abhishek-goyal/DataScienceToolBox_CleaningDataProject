The file rub_analysis.R needs the following files in its working directory to work without errors:
train/X_train.txt
train/subject_train.txt
train/Y_train.txt
test/X_test.txt
test/subject_test.txt
test/Y_test.txt
features.txt
activity_labels.txt

Step 1:
Combined data of test and training.

Step 2:
From the file features.txt, identified which features have mean and std in them and filtered those using grep command.
Created a mini (tidier) data, comprising of only these features.

Step 3:
Read activity labels from 'activity_labels.txt' and replaced the Activity numbers with their corresponding label. This method could have been optimized. Didn't know the correct way.

Step 4:
Took mean of the tidy data we got, by Subject and Activity, used aggregate function for this.

Step 5:
Create a file containing this tidier data.