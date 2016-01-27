##Code Book
The experiments have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
The measurements selected for the original database come from the accelerometer and gyroscope 3-axial raw signals. The acceleration signal was then separated into body and gravity acceleration signals. The body linear acceleration and angular velocity were derived in time to obtain Jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain signals.

This project requires to produce the average of each variable for each activity and each subject (volunteer).
####List of variables in the final dataset:
 [1] "Activity"                                                         
 [2] "Subject"                                                          
 [3] "Time - Body Acceleration - Mean-X.axis"                           
 [4] "Time - Body Acceleration - Mean-Y.axis"                           
 [5] "Time - Body Acceleration - Mean-Z.axis"                           
 [6] "Time - Body Acceleration - Standard Deviation-X.axis"             
 [7] "Time - Body Acceleration - Standard Deviation-Y.axis"             
 [8] "Time - Body Acceleration - Standard Deviation-Z.axis"             
 [9] "Time - Gravity Acceleration - Mean-X.axis"                        
[10] "Time - Gravity Acceleration - Mean-Y.axis"                        
[11] "Time - Gravity Acceleration - Mean-Z.axis"                        
[12] "Time - Gravity Acceleration - Standard Deviation-X.axis"          
[13] "Time - Gravity Acceleration - Standard Deviation-Y.axis"          
[14] "Time - Gravity Acceleration - Standard Deviation-Z.axis"          
[15] "Time - Body Acceleration Jerk - Mean-X.axis"                      
[16] "Time - Body Acceleration Jerk - Mean-Y.axis"                      
[17] "Time - Body Acceleration Jerk - Mean-Z.axis"                      
[18] "Time - Body Acceleration Jerk - Standard Deviation-X.axis"        
[19] "Time - Body Acceleration Jerk - Standard Deviation-Y.axis"        
[20] "Time - Body Acceleration Jerk - Standard Deviation-Z.axis"        
[21] "Time - Body Gyroscope - Mean-X.axis"                              
[22] "Time - Body Gyroscope - Mean-Y.axis"                              
[23] "Time - Body Gyroscope - Mean-Z.axis"                              
[24] "Time - Body Gyroscope - Standard Deviation-X.axis"                
[25] "Time - Body Gyroscope - Standard Deviation-Y.axis"                
[26] "Time - Body Gyroscope - Standard Deviation-Z.axis"                
[27] "Time - Body Gyroscope Jerk - Mean-X.axis"                         
[28] "Time - Body Gyroscope Jerk - Mean-Y.axis"                         
[29] "Time - Body Gyroscope Jerk - Mean-Z.axis"                         
[30] "Time - Body Gyroscope Jerk - Standard Deviation-X.axis"           
[31] "Time - Body Gyroscope Jerk - Standard Deviation-Y.axis"           
[32] "Time - Body Gyroscope Jerk - Standard Deviation-Z.axis"           
[33] "Time - Body Acceleration Magnitute - Mean"                        
[34] "Time - Body Acceleration Magnitute - Standard Deviation"          
[35] "Time - Gravity Acceleration Magnitute - Mean"                     
[36] "Time - Gravity Acceleration Magnitute - Standard Deviation"       
[37] "Time - Body Acceleration Jerk Magnitute - Mean"                   
[38] "Time - Body Acceleration Jerk Magnitute - Standard Deviation"     
[39] "Time - Body Gyroscope Magnitute - Mean"                           
[40] "Time - Body Gyroscope Magnitute - Standard Deviation"             
[41] "Time - Body Gyroscope Jerk Magnitute - Mean"                      
[42] "Time - Body Gyroscope Jerk Magnitute - Standard Deviation"        
[43] "Frequency - Body Acceleration - Mean-X.axis"                      
[44] "Frequency - Body Acceleration - Mean-Y.axis"                      
[45] "Frequency - Body Acceleration - Mean-Z.axis"                      
[46] "Frequency - Body Acceleration - Standard Deviation-X.axis"        
[47] "Frequency - Body Acceleration - Standard Deviation-Y.axis"        
[48] "Frequency - Body Acceleration - Standard Deviation-Z.axis"        
[49] "Frequency - Body Acceleration Jerk - Mean-X.axis"                 
[50] "Frequency - Body Acceleration Jerk - Mean-Y.axis"                 
[51] "Frequency - Body Acceleration Jerk - Mean-Z.axis"                 
[52] "Frequency - Body Acceleration Jerk - Standard Deviation-X.axis"   
[53] "Frequency - Body Acceleration Jerk - Standard Deviation-Y.axis"   
[54] "Frequency - Body Acceleration Jerk - Standard Deviation-Z.axis"   
[55] "Frequency - Body Gyroscope - Mean-X.axis"                         
[56] "Frequency - Body Gyroscope - Mean-Y.axis"                         
[57] "Frequency - Body Gyroscope - Mean-Z.axis"                         
[58] "Frequency - Body Gyroscope - Standard Deviation-X.axis"           
[59] "Frequency - Body Gyroscope - Standard Deviation-Y.axis"           
[60] "Frequency - Body Gyroscope - Standard Deviation-Z.axis"           
[61] "Frequency - Body Acceleration Magnitute - Mean"                   
[62] "Frequency - Body Acceleration Magnitute - Standard Deviation"     
[63] "Frequency - Body Acceleration Jerk Magnitute - Mean"              
[64] "Frequency - Body Acceleration Jerk Magnitute - Standard Deviation"
[65] "Frequency - Body Gyroscope Magnitute - Mean"                      
[66] "Frequency - Body Gyroscope Magnitute - Standard Deviation"        
[67] "Frequency - Body Gyroscope Jerk Magnitute - Mean"                 
[68] "Frequency - Body Gyroscope Jerk Magnitute - Standard Deviation" 

###`run_analysis.R` script to do
* Load package `dplyr`
* Download data zip file from internet to `ProjData` directory
* Read test and train datasets from the data zip file
* Read features file (variables name), activities file, subject file
* Filter only variables with mean and standard deviation 
* Join data files: data, activity and subject for test and train 
* Merge test and train datasets
* Populate variable by using descriptive names
* Group dataset with average of each variable for each activity and each subject
* Print out the result to `summarised_dataset.txt` file in `ProjData` directory
* 
