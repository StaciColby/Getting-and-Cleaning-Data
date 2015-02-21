Description of the variables:
  X_train<-X train data 
  Y_train<- Y train data
  X_test<- x test data
  Y_test<- y test data
  features<- features data
  activity levels<- the combination of the y test and train data to get all activitiy levels
  subjects<- the subject data
  complied<- the compiled list of all of the data (x train, y train, y test, x, test and the subjects)
  std.cols<- the column numbers of the standard dev columns
  cols_of_std<- stores the columns of the standard dev
  mean.cols/cols_of_mean<-same as std
  tidy_dataframe<- creates a data frame of the columns of the means and std dev's, and the activites and subjects
  uniq_activity<- gives the names of each activity once
  temp.data<- makes a data frame to store the values of the activities each subject does
  new vector<- takes the average of the columns of temp.data, except for the subject number and activity name
  another vector<- combines the subject, activity, and mean
  tidy data<-combines the new vectors together
  
  Description of transformations:
    First I label the data set with descriptive names by searching for the activity number (in a for loop), and replacing it with the appropriate name. Then I compile the data using rbind and cbind functions. Then I change the variable names so the reader can understand using the gsub functuion. I use the subset() function to extract unique combinations of subjects, variables, and activites to place in the data frame. 
