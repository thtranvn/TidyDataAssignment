## ANALYSIS OF HUMAN ACTIVITY RECOGNITION USING SMARTPHONES

This is the analysis of experiments dataset of Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto from Smartlab - Non Linear Complex Systems Laboratory (Università degli Studi di Genova, Italy)

The experiments have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. It captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The analysis is to tidy up and summarise the raw dataset by each activity and each subject (person). It takes average of mean and standard deviation of measurements in the experiments.

###This analysis includes the following files:
- This `README.md` file.
- `run_analysis.R`: the R script to populate summarised data set from the original experiments dataset.
- `summarised_dataset.txt`: the result dataset is created by `run_analysis.R` script.
- `CodeBook.md`: describes the variables, the data and transformation that `run_analysis.R` script perform.
 
###The script `run_analysis.R` to do
1. It requires `dplyr` package
2. Download dataset from [this source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) to `ProjData` directory.
3. Read data.
4. Populate dataset follow requirements
5. Write result dataset to `.\ProjData\summarised_dataset.txt`

###Execute `run_analysis.R` at command line:
For example to run the script in Windows OS

    > "C:\Program Files\R\R-3.2.3\bin\Rscript.exe"' run_analysis.R

or open the file in RGui or RStudio and execute it

###Open RGui or RStudio to view result dataset
    R> result <- read.table("./ProjData/summarised_dataset.txt", header=TRUE, check.names=FALSE)
    R> names(result)
    R> head(result[, 1:6], n=5)
