**Data**

The downloaded dataset includes the following files:

README.txt

features_info.txt, information about the variables used on the feature vector

features.txt, features list

activity_labels.txt, links the class labels with their activity name

train/X_train.txt, training set

train/y_train.txt, training labels

test/X_test.txt, test set

test/y_test.txt, test labels


The following files are available for the train and test data, and they have an equivalent descriptions.

train/subject_train.txt, each row identifies the subject who performed the activity for each window sample.

train/Inertial Signals/total_acc_x_train.txt, the acceleration signal from the smartphone accelerometer X axis in standard gravity units g. Every row shows a 128 element vector. The same description applies for the total_acc_x_train.txt and total_acc_z_train.txt files for the Y and Z axis

train/Inertial Signals/body_acc_x_train.txt, the body acceleration signal obtained by subtracting the gravity from the total acceleration

train/Inertial Signals/body_gyro_x_train.txt, the angular velocity vector measured by the gyroscope for each window sample. The units are radians/second


**Variables**

For each record in the dataset, the following are provided:

Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration
Triaxial Angular velocity from the gyroscope
A 561-feature vector with time and frequency domain variables
Its activity label
An identifier of the subject who carried out the experiment


**Transformations**

Training and the test sets were merged to create one dataset
Measurements on the mean and standard deviation for each measurement were extracted
Descriptive activity names were then added according to activity_labels.txt
Subject column was added to to this dataset
Average of each variable for each activity and each subject was computed
Means were stored in a new tidy dataset
Tidy dataset was written to a text file
