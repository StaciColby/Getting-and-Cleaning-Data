
#import the data sets
X_train <- read.table("~/Math378/UCI HAR Dataset/train/X_train.txt", quote="\"")
Y_train <- read.table("~/Math378/UCI HAR Dataset/train/Y_train.txt", quote="\"")
subject_train <- read.table("~/Math378/UCI HAR Dataset/train/subject_train.txt", quote="\"")
subject_test <- read.table("~/Math378/UCI HAR Dataset/test/subject_test.txt", quote="\"")
X_test <- read.table("~/Math378/UCI HAR Dataset/test/X_test.txt", quote="\"")
Y_test <- read.table("~/Math378/UCI HAR Dataset/test/Y_test.txt", quote="\"")
features <- read.table("~/Math378/UCI HAR Dataset/features.txt", quote="\"")

#labels the data set with descriptive names 
activity.levels<-rbind(Y_train,Y_test)
View(activity.levels)
for(i in 1:nrow(activity.levels)){
  if(activity.levels[i,]==1) {
    activity.levels[i,]<-"WALKING"}
  if(activity.levels[i,]==2) {
    activity.levels[i,]<-"WALKING_UPSTAIRS"}
  if(activity.levels[i,]==3) {
    activity.levels[i,]<-"WALKING_DOWNSTAIRS"}
  if(activity.levels[i,]==4) {
    activity.levels[i,]<-"SITTING"}
  if(activity.levels[i,]==5) {
    activity.levels[i,]<-"STANDING"}
  if(activity.levels[i,]==6) {
    activity.levels[i,]<-"LAYING"}
}

#merge the data
complied_train<-rbind(X_train,X_test)
complied_test<-rbind(activity.levels)
subjects<-rbind(subject_train,subject_test)
complied<-cbind(complied_train,complied_test, subjects)
View(complied)

#name the data
labels<-t(features)
colnames<-labels[2,]
ncol(complied)
length(colnames)
colnames(complied)<-c(colnames,"Activity Levels", "subjects")
View(complied)
names(complied)

#change the variable names
names(complied)<-gsub("ime","",names(complied))
names(complied)<-gsub("^t","time ",names(complied))
names(complied)<-gsub("^t","frequency ",names(complied))
names(complied)<-gsub("freq","frequency ",names(complied))
names(complied)<-gsub("Acc","acceleration ",names(complied))
names(complied)<-gsub("mag","magnitude ",names(complied))
View(complied)

#Extracts only the measurements on the mean and standard deviation for each measurement
require(base)
std.cols<-grep("std()",colnames(complied))
mean.cols<-grep("mean()",colnames(complied))
cols_of_std<-complied[,std.cols]
cols_of_mean<-complied[,mean.cols]
head(cols_of_mean)

#creates an independent tidy data set with the average of each variable for each activity 
#and each subject

tidy_dataframe<-cbind(subjects,activity.levels,cols_of_std,cols_of_mean)
mean.cols.prime<-grep("meanFreq()", colnames(tidy_dataframe))
tidy_dataframe<-tidy_dataframe[,-mean.cols.prime]
names(tidy_dataframe)[1]<-"subject_num"
names(tidy_dataframe)[2]<-"activity_levels"

newsubs<-c(1:30)
uniq_activity<-c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
head(uniq_activity)

tidy.data<-c()
for(i in 1:30){
  for(j in 1:6){
    temp.data<-subset(tidy_dataframe,subject_num==newsubs[i]&activity_levels==uniq_activity[j])
    newvector<-apply(temp.data[,3:68],2,mean)
    anothervector<-cbind(newsubs[i],uniq_activity[j],t(newvector))
    tidy.data<-rbind(tidy.data,anothervector)
  }
  }
