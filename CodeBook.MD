##Code Book

###Summary

30 volunteers wearing a smartphone are recorded performing 6 different activities. This project aims to clean the data by merging together multiples files and tyding it up.

###Files used

`features.txt`: Names of the 561 features.
`activity_labels.txt`: Names and IDs of the 6 activities.
`x_train.txt`: 7352 observations of the 561 features, for 21 of the 30 volunteers.
`subject_train.txt`: The ID of the volunteer related to each of the observations in `X_train.txt`.
`y_train.txt`: A vector of 7352 integers, denoting the ID of the activity related to each of the observations in `X_train.txt`.
`x_test.txt`: 2947 observations of the 561 features, for 9 of the 30 volunteers.
`subject_test.txt`: The ID of the volunteer related to each of the observations in `X_test.txt`.
`y_test.txt`: A vector of 2947 integers, denoting the ID of the activity related to each of the observations in `X_test.txt`.

###Steps

1. Reading data. 
2. Merging data (X with X, Y with Y, Subject with Subject).
3. Setting descriptive names to features column.
4. Selecting features containing means and standard deviations.
5. Setting descriptive names to activities column.
6. Combining X, Y and Subject together.
7. Creating second tidy set and outputting it.