
# Name: Guilherme de Araujo

# 1 Merges the training and the test sets to create one data set.
# 2 Extracts only the measurements on the mean and standard deviation for each measurement.
# 3 Uses descriptive activity names to name the activities in the data set
# 4 Appropriately labels the data set with descriptive variable names.
#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Load Library
library(data.table)

# Create directory is name coletadados
if (!file.exists("coletadados")) { 
          dir.create("coletadados")           
} 

# Download Dataset
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              destfile = "coletadados/dados.zip") 
          
# Unzip Dataset
unzip("coletadados/dados.zip", exdir = "coletadados")

# Load Dataset's
x_test <- read.table(file = "coletadados/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table(file = "coletadados/UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("coletadados/UCI HAR Dataset/test/subject_test.txt")

x_train <- read.table(file = "coletadados/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table(file = "coletadados/UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("coletadados/UCI HAR Dataset/train/subject_train.txt")

features <- read.table("coletadados/UCI HAR Dataset/features.txt")

# Merge Dataset's
dadosx <-  rbind(x_test, x_train)

dadosy <- rbind(y_test, y_train)

# Mean and Standard Deviation
media <- mean(dadosx$V2)
desviopadrao <- sd(dadosx$V2)
          
# Rename Variables 
features$V2 <- as.character(features$V2)
dadosx <- setnames(dadosx, features[,2])

# Create Dataset organized
write.table(dadosx,"coletadados/UCI HAR Dataset/Data.txt") 
