This repository has been created to answer the question if self-reported sleep measures can determine generalization performance.
The files in this repositories are as follows: 
1) Foundations4 Dataset .csv = The origninal dataset for analysis


   Variables included are: 

   subjectid = The ID associated with the individual subjects

   age = The age of subjects

    gender = Male (1) or Female (0)

   education_yrs = Education in years of the subjects 


   facquisition = The acquisition score from the learning trials of the Rutgers Acquired Equivalence Task. This variable is used as a covariate for regression. 
     

   fgen = The generalization performance score from the testing phase of the Rutgers Acquired Equivalence Task.


    psqi_sleeplatencymin = The total reported time in minutes it takes a subject to fall asleep after they have gone to bed. This information has been collected from the Pittsburgh Sleep Quality Index


    psqi_hourssleep = The total reported time in hours that a subject sleeps in a night. This information has been collected from the Pittsburgh Sleep Quality Index


    psqi_sleepquality = A categorical response to the question "How would you rate your overall sleep quality" 0(Very Good) 1(Fairly Good) 2(Fairly Bad) 3(Very Bad). This information has been collected from the         


     Pittsburgh Sleep Quality Index



3) found4data.mat = The MatLab compatible file or the dataset. The code will create this but this is included in case it is needed.


4) Finalproject2.m = The Matlab Analysis Code


    This code does the following:


    -Sets the path 


    -Converts the .csv file to a Matlab compatible file


    -Create variables from from the Matlab compatible file
 

   -Creates summary statistics for each variable


    -Create histograms for all continuous variables to determine distribution of all variables


    -Create scatter plots of each independent variable to the dependent variable. This code highlights the points at which multiple data points fall.


   -Conducts Pearson's Correlations on each variable with the fgen variable.


    -Conducts Spearman's correlation on the sleep latency variable and the fgen variable because sleep latency is not normally distributed in this dataset
 

   -Conducts a simple linear regression on each individual independent variable with fgen


    -Conducts a multiple regression with all independent variable and fgen to test the interactive effect


   -The code then repeats all of these actions using Foundations4 Dataset.2.csv which removes the outlier for sleep latency


4) Foundations4 Dataset.2.csv = This is an altered version of the original dataset that has sleep latency outliers removed


5) found4data2.mat = The MatLab compatible dataset without sleep latency outliers


      
