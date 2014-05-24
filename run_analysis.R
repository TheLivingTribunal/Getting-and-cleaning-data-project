##This script needs to run in a directory which contains the following files - 
#features.txt
#activity_labels.txt 
#subject_test.txt
#X_test.txt
#y_test.txt
#subject_train.txt
#X_train.txt
#y_train.txt

##This step reads the features.txt file and subsets the data only for the features with the words "mean" of "std"
feat<-read.table("features.txt",col.names=c("FeatNo","Feature"))
mrow<-grep("mean",feat[,2])
srow<-grep("std",feat[,2])
rows<-sort(c(mrow,srow))
features<-subset(feat,feat[,1] %in% rows)

##This step reads the Subject,X and y data for test and train separately and then merges both to for a unified dataset
subtest<-read.table("subject_test.txt",col.names="Subject")
acttest<-read.table("y_test.txt",col.names="ActNum")
datatest<-read.table("X_test.txt")
subdatatest<-datatest[,rows]
names(subdatatest)<-features$Feature
test<-cbind(subtest,acttest,subdatatest)

subtrain<-read.table("subject_train.txt",col.names="Subject")
acttrain<-read.table("y_train.txt",col.names="ActNum")
datatrain<-read.table("X_train.txt")
subdatatrain<-datatrain[,rows]
names(subdatatrain)<-features$Feature
train<-cbind(subtrain,acttrain,subdatatrain)

rawdata<-rbind(test,train)

##This step reads the activity_labels.txt file and creates a lookup table to populate the Activity names in main dataset
labels<-read.table("activity_labels.txt",col.names=c("ActNum","Activity"))

##This step makes the rawdata more readable by assigning labels to activity numbers and removing the latter
sub<-merge(labels,rawdata,by.x="ActNum",by.y="ActNum",all.y=TRUE)
options(digits=5)
tidy<-subset(sub,select=-ActNum)

##This step assigns readable column names which are fully explained in the codebook
names(tidy)<-c("Activity","Subject","TimeBodyAccMeanX","TimeBodyAccMeanY","TimeBodyAccMeanZ","TimeBodyAccSTDX","TimeBodyAccSTDY",
               "TimeBodyAccSTDZ","TimeGravAccMeanX","TimeGravAccMeanY","TimeGravAccMeanZ","TimeGravAccSTDX","TimeGravAccSTDY",
               "TimeGravAccSTDZ","TimeBodyAccJerkMeanX","TimeBodyAccJerkMeanY","TimeBodyAccJerkMeanZ","TimeBodyAccJerkSTDX",
               "TimeBodyAccJerkSTDY","TimeBodyAccJerkSTDZ","TimeBodyGyrMeanX","TimeBodyGyrMeanY","TimeBodyGyrMeanZ","TimeBodyGyrSTDX",
               "TimeBodyGyrSTDY","TimeBodyGyrSTDZ","TimeBodyGyrJerkMeanX","TimeBodyGyrJerkMeanY","TimeBodyGyrJerkMeanZ",
               "TimeBodyGyrJerkSTDX","TimeBodyGyrJerkSTDY","TimeBodyGyrJerkSTDZ","TimeBodyAccMeanMag","TimeBodyAccSTDMag",
               "TimeGravAccMeanMag","TimeGravAccSTDMag","TimeBodyAccJerkMeanMag","TimeBodyAccJerkSTDMag","TimeBodyGyrMeanMag",
               "TimeBodyGyrSTDMag","TimeBodyGyrJerkMeanMag","TimeBodyGyrJerkSTDMag","FreqBodyAccMeanX","FreqBodyAccMeanY",
               "FreqBodyAccMeanZ","FreqBodyAccSTDX","FreqBodyAccSTDY","FreqBodyAccSTDZ","FreqBodyAccWtMeanX","FreqBodyAccWtMeanY",
               "FreqBodyAccWtMeanZ","FreqBodyAccJerkMeanX","FreqBodyAccJerkMeanY","FreqBodyAccJerkMeanZ","FreqBodyAccJerkSTDX",
               "FreqBodyAccJerkSTDY","FreqBodyAccJerkSTDZ","FreqBodyAccJerkWtMeanX","FreqBodyAccJerkWtMeanY","FreqBodyAccJerkWtMeanZ",
               "FreqBodyGyrMeanX","FreqBodyGyrMeanY","FreqBodyGyrMeanZ","FreqBodyGyrSTDX","FreqBodyGyrSTDY","FreqBodyGyrSTDZ",
               "FreqBodyGyrWtMeanX","FreqBodyGyrWtMeanY","FreqBodyGyrWtMeanZ","FreqBodyAccMeanMag","FreqBodyAccSTDMag",
               "FreqBodyAccWtMeanMag","FreqBodyAccJerkMeanMag","FreqBodyAccJerkSTDMag","FreqBodyAccJerkWtMeanMag","FreqBodyGyrMeanMag",
               "FreqBodyGyrSTDMag","FreqBodyGyrWtMeanMag","FreqBodyGyrJerkMeanMag","FreqBodyGyrJerkSTDMag","FreqBodyGyrJerkWtMeanMag")

#The data frame "tidy" is a tidy data set with readable Activity names and meaningful Variable names.


##This step creates an independent tidy data set which stores the average of each variable for every activity and subject

library(reshape2)
inter<-melt(tidy,id=c("Subject","Activity"))
final<-dcast(inter, Subject + Activity ~ variable, fun.aggregate=mean)