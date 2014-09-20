GCD Assignment
==============

## Processing the UCI HAR Dataset

This repository contains a single R script, run_analysis.R, that processes the raw data from the UCI HAR Dataset and produces a tidy data set.

To run the script:

1. call ```setwd``` to set the working directory to the folder containing the run_analysis.R script
2. the UCI HAR Dataset folder should be contained in this same folder
3. call ```source("run_analysis.R")``` to run the script
4. the tidy data set will be created in the file tidydata.txt in the same folder
5. to view this data set, run ```View(read.table("tidydata.txt",header=TRUE))```

