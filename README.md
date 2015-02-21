
I created the data frame using one script, called run_analysis. The beginning of this script imports the data set using the read.table() function. Then, I label the data set using the descriptive names given in the text file. 
Then I combine the individual data sets into one data frame using the rbind() and cbind() functions. I call this new data set complied. 
Then I label the columns, which were given in the zip file. 
Then I find the columns that measure the standard dev and and extract them. 
Finally, I created a tidy data frame of unique activities and subjects by using the columns extracted in the previous step. I took the mean of these columns and recoreded it in the data frame, giving me an independent tidy data set with the average of each variable for each activity and each subject. 
