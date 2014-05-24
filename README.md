Getting-and-cleaning-data-project
=================================

Repo for submission of Course Project for Getting and Cleaning Data

This script needs to be run in a directory which contains the following files - 
* features.txt
* activity_labels.txt 
* subject_test.txt
* X_test.txt
* y_test.txt
* subject_train.txt
* X_train.txt
* y_train.txt


The attached script run_analysis.R follows the given logical sequence -

* Reads the Features.txt master file into a local data frame
* Binds the subbject and sensor data into separate test and train data frames
* The required data is subset by performing a grep on the features data frame. The feature name is partially matched to the strings "mean" and "std" to get a total of 79 columns + 1 column for Activity Number and Subject Number
* The two datasets "test" and "train" are merged to form a single dataset
* The Activity labels file is also read into R and is merged with the dataset obtained from step 4 by using a common Activity Number column.
* The resulting dataset is then manually modified to have human readable column names. (The columnn naming convention is provided in the attached CodeBook)
* Finally, the tidy dataset is melted and recast using the reshape2 package to provide the means of all columns for each unique combination of Activity and Subject Number.


