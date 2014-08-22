# Course Project assignment: create one R script called run_analysis.R that does the following. 
# globals: Data,features, path, cols.in.scope


# Download and unzip the dat set from the given source and extract it locally
download.data.set= function(url) {
  if (!file.exists("data")) {
    #  Check for existing data directory or create it
    message("create data folder...")
    dir.create("data")
  }
  if (!file.exists("data/UCI HAR Dataset")) {
    # if data set isn't existing download it
    #sourceURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    zipfile="data/UCI_HAR_data.zip"
    message("data download...")
    download.file(url, destfile=zipfile, method="auto")
    unzip(zipfile, exdir="data")
  }
}



# 0. load the train and test files 
load.merge.data= function() {
  message("load data...")
  # 0.1 build the common path to the data files
  path<<-paste(getwd(),"/data/UCI HAR Dataset/", sep = "")
  
  # 0.2 read X_train.txt into DF "train.dat"
  train.dat = read.csv(paste(path,"train/X_train.txt",sep=""), sep="", header=FALSE)
  
  # 0.3 append Y_train.txt to DF "train.dat" as variable 562
  train.dat[,ncol(train.dat)+1] = read.csv(paste(path,"train/Y_train.txt",sep=""), sep="", header=FALSE)
  
  # 0.4 append subject_train.txt to DF "train.dat" as variable 563
  train.dat[,ncol(train.dat)+1] = read.csv(paste(path,"train/subject_train.txt",sep=""), sep="", header=FALSE)
  
  # 0.5 read X_test.txt into DF "test.dat"
  test.dat = read.csv(paste(path,"test/X_test.txt",sep=""), sep="", header=FALSE)
  
  # 0.3 append Y_test.txt to DF "test.dat" as variable 562
  test.dat[,ncol(test.dat)+1] = read.csv(paste(path,"test/Y_test.txt",sep=""), sep="", header=FALSE)
  
  # 0.4 append subject_test.txt to DF "test.dat" as variable 563
  test.dat[,ncol(test.dat)+1] = read.csv(paste(path,"test/subject_test.txt",sep=""), sep="", header=FALSE)
  
  
  # 1. Merge train.dat and test.dat together into DF Data
  # Merges the training and the test sets to create one data set.
  message("merge data...")
  rbind(train.dat, test.dat)
}




# 2. Get only the data on mean and std. dev.
extract.data=function(df){
  # Extracts only the measurements on the mean and standard deviation for each measurement. 
  message("extract data...")
  # 2.1 read the features
  features <- read.csv(paste(path,"features.txt", sep=""), sep="", header=FALSE)
  
  # 2.2 find the relevant columns having "-mean"or "-std" in column name
  cols.in.scope <<- grep(".*-mean.*|.*-std.*", features[,2])
  
  
  # 2.3 set the features in scope (global)
  features <<- features[cols.in.scope,]
  
  var.count = ncol(df)
  # 2.4 also add the two columns for Subject and Activity (the last two columns of Data)
  cols.in.scope <<- c(cols.in.scope, var.count-1, var.count)
  
  # 2.5 remove the obsolete columns from DF Data
  #Data <- Data[,cols.in.scope]
  df<-df[,cols.in.scope]
  df
}




# 3. Uses descriptive activity names to name the activities in the data set
set.activity.names=function(df){
  message("set activity labels...")
  # 3.1 read the activity lables into DF activity.Labels)
  activity.Labels = read.csv(paste(path,"activity_labels.txt", sep=""), sep="", header=FALSE)
  
  # 3.2 set the matching activity label for each row
  Activity.ID = 1
  for (ActivityLabel in activity.Labels$V2) {
    #df$activity[df$activity == Activity.ID] = ActivityLabel
    
    #Data$Activity <- gsub(Activity.ID, ActivityLabel, Data$Activity)
    df$Activity <- gsub(Activity.ID, ActivityLabel, df$Activity)
    Activity.ID <- Activity.ID + 1
  }
  
  df
}




# 4. Appropriately labels the data set with descriptive variable names.
descriptive.variables=function(df){
  message("make descriptive variable names...")
  # 4.1 make suitable feature names for R using substitutions
  features[,2] <- gsub('-mean', '.MEAN', features[,2]) # substitutes "-mean" with ".MEAN"
  features[,2] <- gsub('-std', '.STD', features[,2]) # substitutes "-std" with ".STD"
  features[,2] <- gsub('[-]', '.', features[,2]) # substitutes "-" with "."
  features[,2] <- gsub('[()]', '', features[,2]) # removes "()"
  
  # 4.2 set the column names (as of DF features 2nd column) for DF Data
  colnames(df) <- c(features$V2, "Activity", "Subject")
  
  df
}

# 5. Creates a second, independent DF tidy.data with the mean of each variable for each activity and each subject. 
make.tidy=function(df){
  message("tidy data...")
  # 5.1 declare Activity and Subject as nominal data
  df$Activity <- as.factor(df$Activity)
  df$Subject <- as.factor(df$Subject)
  
  #5.2 aggregate DF Data by Activity and Subject while calculating the mean function
  #5.2.1 define the number of colums in DF Data minus the nominal columns (Activity and Subject)
  countnndc = ncol(df)-2 # the count of colums with non nominal data
  nndc = c(1:countnndc) # the colums with non nominal data
  
  #5.2.2 aggregate and calculate the mean only for the columns containing measured values
  # tidy.Data = aggregate(Data[,c(1:nndc)], by=list(Activity = Data$Activity, Subject=Data$Subject), mean, na.rm=TRUE)
  tidy <- aggregate(df[,nndc], by=list(Activity = df$Activity, Subject=df$Subject), mean, na.rm=TRUE)
  tidy
}



# Preparation:
download.data.set("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")

# 1. Merges the training and the test sets to create one data set.
Data<-load.merge.data()

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
Data<-extract.data(Data)

# 4. Appropriately labels the data set with descriptive variable names. 
Data<-descriptive.variables(Data)

# 3. Uses descriptive activity names to name the activities in the data set
Data<-set.activity.names(Data) # reasonable to be run after labeling because of script design

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
Data<-make.tidy(Data)

# Completion
message("write tidy.txt...")
write.table(Data, "tidy.txt", sep="\t",row.names = F)
message("done!")