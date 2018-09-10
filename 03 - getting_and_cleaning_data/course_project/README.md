## GCD course project

This is a repository for the Getting & Cleaning Data course from Coursera. 
The description and files needed for this porject can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Code summary

The R script, `run_analysis.R`, found in this repository contains the code to perform the described analysis. Upon running the script in RStudio, the script: 
  1. Downloads the required files from the UCI Machine Learning Repository
  2. Loads the train and test data, and the features and activity info into R
  3. Merges the two data sets into one combined data set
  4. Extracts a subset of the combined data set containing only the measurements of mean and standard deviations
  5. The extracted data set is appropriately labelled with the activity names
  6. A second, independent tidy data set with the average of each variable for each activity and suject is created

## Additional information

Additional information about the variables, data and the code can be found in the CodeBook.md file
