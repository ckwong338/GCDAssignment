## Code book and transformations performed
### Code book
- subject the identifier of the subject, as specified in the files subject_test.txt and subject_train.txt
- activity a factor describing the activity the subject was performing
 - a factor with 6 levels, walking, walking upstairs, walking downstairs, sitting, standing, laying
- the remaining 66 variables are means and standard deviations as described in the features_info.txt file included
  in the zip file containing the [original data set](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip).  
  All these variables are normalized and bounded within [-1,1].
 

### Processing/transformations
The following transformations were performed on the raw data to clean up the data:
 - the training and test data sets were merged into a single data set
 - an ```activity``` variable was added and displayed as a string, that describes the activity the subject was doing
 - a ```subject``` variable was added and displayed as a number, that identifies the subject
 - the column names for the merged data set was updated to the original variable names (with the addition of "activity" and "subject" for the added variables
 - the non-mean and non-standard deviation variables were dropped
 - all variable names were replaced with more descriptive names
 - the data set was melted identified by the ```subject```, and ```activity```, and measured by the remaining variables
 - the melted data set was recasted with the measured variables aggregated by the ```mean``` function

