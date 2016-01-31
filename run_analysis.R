## Load the data files

X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")



#Merges the training and the test sets to create one data set.
all.x<-rbind(X_train,X_test)


#Extracts only the measurements on the mean and standard deviation for each measurement.
colnames(all.x) <- c(as.character(features[,2]))

Media <- grep("mean()",colnames(all.x),fixed=TRUE)

Sd <- grep("std()",colnames(all.x),fixed=TRUE)

Media_Sd <- all.x[,c(Media,Sd)]


#Uses descriptive activity names to name the activities in the data set.

all.y<-rbind(y_train,y_test)

all.activity<-cbind(all.y,Media_Sd)

colnames(all.activity)[1] <- "Activity"


#Appropriately labels the data set with descriptive activity names.
activity_labels[,2]<-as.character(activity_labels[,2])

for(i in 1:length(all.activity[,1])){
  all.activity[i,1]<-activity_labels[all.activity[i,1],2]
}


#Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Subject_all<-rbind(subject_train,subject_test)

all<-cbind(Subject_all,all.activity)

colnames(all)[1] <- "Subject"

Limpio <- aggregate( all[,3] ~ Subject+Activity, data = all, FUN= "mean" )

for(i in 4:ncol(all)){
  Limpio[,i] <- aggregate( all[,i] ~ Subject+Activity, data = all, FUN= "mean" )[,3]
}

colnames(Limpio)[3:ncol(Limpio)] <- colnames(Media_Sd)

write.table(Limpio, file = "Limpio.txt", row.name = FALSE)
