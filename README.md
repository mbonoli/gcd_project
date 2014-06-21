Getting and Cleaning Data Course Project - Peer Assessments
========================================================

## Set working directory 

First of all, I setup the working directory

```r
setwd("C:/Users/mbonoli/Documents/GitHub/gcd_project")
```

## Reading datasets and the varibles definition

```r
# Reading both datasets
X_test <- read.table("X_test.txt", quote="\"")
X_train <- read.table("X_train.txt", quote="\"")

# Reading variable names
features_names <- read.table("features.txt", quote="\"")[,2]

# Reading activity names
activities_names <- read.table("~/GitHub/gcd_project/activity_labels.txt", quote="\"")
names(activities_names) <- c("id_activity", "activity")

# Reading activities (y)
y_test <- read.table("y_test.txt", quote="\"")
y_train <- read.table("y_train.txt", quote="\"")

# Reading individuals data
indiv_test <- read.table("subject_test.txt", quote="\"")
indiv_train <- read.table("subject_train.txt", quote="\"")
indiv <- rbind(indiv_test, indiv_train)
names(indiv) <- "indiv"
```

## Starts

### 1. Merges the training and the test sets to create one data set

```r
X <- rbind(X_test, X_train)
y <- rbind(y_test, y_train)
activities <- activities_names[y[,1],2]
```

### 3. Uses descriptive activity names to name the activities in the data set

```r
names(X) <- features_names
```

### 2. Extracts only the measurements on the mean and standard deviation for each measurement

Storing the names of variables that contains ***mean()*** and ***std()*** in two vectors

```r
mean_names <- as.character(features_names[grep("mean()", features_names, fixed=TRUE)])
mean_names
```

```
##  [1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"          
##  [3] "tBodyAcc-mean()-Z"           "tGravityAcc-mean()-X"       
##  [5] "tGravityAcc-mean()-Y"        "tGravityAcc-mean()-Z"       
##  [7] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"      
##  [9] "tBodyAccJerk-mean()-Z"       "tBodyGyro-mean()-X"         
## [11] "tBodyGyro-mean()-Y"          "tBodyGyro-mean()-Z"         
## [13] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"     
## [15] "tBodyGyroJerk-mean()-Z"      "tBodyAccMag-mean()"         
## [17] "tGravityAccMag-mean()"       "tBodyAccJerkMag-mean()"     
## [19] "tBodyGyroMag-mean()"         "tBodyGyroJerkMag-mean()"    
## [21] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"          
## [23] "fBodyAcc-mean()-Z"           "fBodyAccJerk-mean()-X"      
## [25] "fBodyAccJerk-mean()-Y"       "fBodyAccJerk-mean()-Z"      
## [27] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"         
## [29] "fBodyGyro-mean()-Z"          "fBodyAccMag-mean()"         
## [31] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyGyroMag-mean()"    
## [33] "fBodyBodyGyroJerkMag-mean()"
```

```r
sd_names <- as.character(features_names[grep("std()", features_names, fixed=TRUE)])
sd_names
```

```
##  [1] "tBodyAcc-std()-X"           "tBodyAcc-std()-Y"          
##  [3] "tBodyAcc-std()-Z"           "tGravityAcc-std()-X"       
##  [5] "tGravityAcc-std()-Y"        "tGravityAcc-std()-Z"       
##  [7] "tBodyAccJerk-std()-X"       "tBodyAccJerk-std()-Y"      
##  [9] "tBodyAccJerk-std()-Z"       "tBodyGyro-std()-X"         
## [11] "tBodyGyro-std()-Y"          "tBodyGyro-std()-Z"         
## [13] "tBodyGyroJerk-std()-X"      "tBodyGyroJerk-std()-Y"     
## [15] "tBodyGyroJerk-std()-Z"      "tBodyAccMag-std()"         
## [17] "tGravityAccMag-std()"       "tBodyAccJerkMag-std()"     
## [19] "tBodyGyroMag-std()"         "tBodyGyroJerkMag-std()"    
## [21] "fBodyAcc-std()-X"           "fBodyAcc-std()-Y"          
## [23] "fBodyAcc-std()-Z"           "fBodyAccJerk-std()-X"      
## [25] "fBodyAccJerk-std()-Y"       "fBodyAccJerk-std()-Z"      
## [27] "fBodyGyro-std()-X"          "fBodyGyro-std()-Y"         
## [29] "fBodyGyro-std()-Z"          "fBodyAccMag-std()"         
## [31] "fBodyBodyAccJerkMag-std()"  "fBodyBodyGyroMag-std()"    
## [33] "fBodyBodyGyroJerkMag-std()"
```
Creating a dataset with includes the variables of interest: ID, activity and "mean" and "sd" of features.


```r
X_final <- cbind(indiv=indiv,
                 activity=activities,
                X[,mean_names],
                X[,sd_names])
head(X_final)
```

```
##   indiv activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z
## 1     2 STANDING            0.2572          -0.02329          -0.01465
## 2     2 STANDING            0.2860          -0.01316          -0.11908
## 3     2 STANDING            0.2755          -0.02605          -0.11815
## 4     2 STANDING            0.2703          -0.03261          -0.11752
## 5     2 STANDING            0.2748          -0.02785          -0.12953
## 6     2 STANDING            0.2792          -0.01862          -0.11390
##   tGravityAcc-mean()-X tGravityAcc-mean()-Y tGravityAcc-mean()-Z
## 1               0.9365              -0.2827               0.1153
## 2               0.9274              -0.2892               0.1526
## 3               0.9299              -0.2875               0.1461
## 4               0.9289              -0.2934               0.1429
## 5               0.9266              -0.3030               0.1383
## 6               0.9257              -0.3089               0.1306
##   tBodyAccJerk-mean()-X tBodyAccJerk-mean()-Y tBodyAccJerk-mean()-Z
## 1               0.07205              0.045754             -0.106043
## 2               0.07018             -0.017876             -0.001721
## 3               0.06937             -0.004908             -0.013673
## 4               0.07485              0.032274              0.012141
## 5               0.07838              0.022277              0.002748
## 6               0.07598              0.017519              0.008208
##   tBodyGyro-mean()-X tBodyGyro-mean()-Y tBodyGyro-mean()-Z
## 1           0.119976           -0.09179            0.18963
## 2          -0.001552           -0.18729            0.18071
## 3          -0.048213           -0.16628            0.15417
## 4          -0.056642           -0.12602            0.11834
## 5          -0.059992           -0.08472            0.07866
## 6          -0.039698           -0.06683            0.07055
##   tBodyGyroJerk-mean()-X tBodyGyroJerk-mean()-Y tBodyGyroJerk-mean()-Z
## 1               -0.20490               -0.17449               -0.09339
## 2               -0.13867               -0.02580               -0.07142
## 3               -0.09781               -0.03421               -0.06003
## 4               -0.10223               -0.04471               -0.05344
## 5               -0.09185               -0.02901               -0.06124
## 6               -0.09274               -0.03214               -0.07258
##   tBodyAccMag-mean() tGravityAccMag-mean() tBodyAccJerkMag-mean()
## 1            -0.8669               -0.8669                -0.9298
## 2            -0.9690               -0.9690                -0.9737
## 3            -0.9762               -0.9762                -0.9816
## 4            -0.9743               -0.9743                -0.9827
## 5            -0.9758               -0.9758                -0.9869
## 6            -0.9817               -0.9817                -0.9873
##   tBodyGyroMag-mean() tBodyGyroJerkMag-mean() fBodyAcc-mean()-X
## 1             -0.7955                 -0.9252           -0.9185
## 2             -0.8984                 -0.9734           -0.9609
## 3             -0.9392                 -0.9867           -0.9919
## 4             -0.9472                 -0.9888           -0.9930
## 5             -0.9574                 -0.9901           -0.9924
## 6             -0.9697                 -0.9878           -0.9938
##   fBodyAcc-mean()-Y fBodyAcc-mean()-Z fBodyAccJerk-mean()-X
## 1           -0.9182           -0.7891               -0.8996
## 2           -0.9644           -0.9567               -0.9435
## 3           -0.9650           -0.9669               -0.9910
## 4           -0.9683           -0.9669               -0.9905
## 5           -0.9692           -0.9797               -0.9915
## 6           -0.9707           -0.9756               -0.9938
##   fBodyAccJerk-mean()-Y fBodyAccJerk-mean()-Z fBodyGyro-mean()-X
## 1               -0.9375               -0.9236            -0.8236
## 2               -0.9692               -0.9734            -0.9225
## 3               -0.9734               -0.9717            -0.9728
## 4               -0.9725               -0.9703            -0.9715
## 5               -0.9798               -0.9835            -0.9764
## 6               -0.9790               -0.9861            -0.9797
##   fBodyGyro-mean()-Y fBodyGyro-mean()-Z fBodyAccMag-mean()
## 1            -0.8079            -0.9179            -0.7909
## 2            -0.9265            -0.9682            -0.9541
## 3            -0.9808            -0.9721            -0.9756
## 4            -0.9813            -0.9667            -0.9734
## 5            -0.9804            -0.9688            -0.9777
## 6            -0.9805            -0.9602            -0.9780
##   fBodyBodyAccJerkMag-mean() fBodyBodyGyroMag-mean()
## 1                    -0.8951                 -0.7706
## 2                    -0.9454                 -0.9245
## 3                    -0.9711                 -0.9752
## 4                    -0.9717                 -0.9763
## 5                    -0.9875                 -0.9770
## 6                    -0.9913                 -0.9770
##   fBodyBodyGyroJerkMag-mean() tBodyAcc-std()-X tBodyAcc-std()-Y
## 1                     -0.8902          -0.9384          -0.9201
## 2                     -0.9520          -0.9754          -0.9675
## 3                     -0.9857          -0.9938          -0.9699
## 4                     -0.9856          -0.9947          -0.9733
## 5                     -0.9905          -0.9939          -0.9674
## 6                     -0.9887          -0.9945          -0.9704
##   tBodyAcc-std()-Z tGravityAcc-std()-X tGravityAcc-std()-Y
## 1          -0.6677             -0.9254             -0.9370
## 2          -0.9450             -0.9891             -0.9839
## 3          -0.9627             -0.9959             -0.9883
## 4          -0.9671             -0.9931             -0.9704
## 5          -0.9783             -0.9956             -0.9710
## 6          -0.9653             -0.9988             -0.9907
##   tGravityAcc-std()-Z tBodyAccJerk-std()-X tBodyAccJerk-std()-Y
## 1             -0.5643              -0.9067              -0.9380
## 2             -0.9648              -0.9492              -0.9727
## 3             -0.9816              -0.9911              -0.9714
## 4             -0.9916              -0.9908              -0.9729
## 5             -0.9681              -0.9921              -0.9787
## 6             -0.9712              -0.9938              -0.9791
##   tBodyAccJerk-std()-Z tBodyGyro-std()-X tBodyGyro-std()-Y
## 1              -0.9359           -0.8831           -0.8162
## 2              -0.9777           -0.9256           -0.9296
## 3              -0.9729           -0.9730           -0.9785
## 4              -0.9759           -0.9678           -0.9751
## 5              -0.9866           -0.9747           -0.9780
## 6              -0.9876           -0.9799           -0.9765
##   tBodyGyro-std()-Z tBodyGyroJerk-std()-X tBodyGyroJerk-std()-Y
## 1           -0.9409               -0.9012               -0.9109
## 2           -0.9676               -0.9623               -0.9563
## 3           -0.9756               -0.9842               -0.9879
## 4           -0.9632               -0.9842               -0.9896
## 5           -0.9676               -0.9885               -0.9919
## 6           -0.9635               -0.9894               -0.9895
##   tBodyGyroJerk-std()-Z tBodyAccMag-std() tGravityAccMag-std()
## 1               -0.9393           -0.7052              -0.7052
## 2               -0.9813           -0.9539              -0.9539
## 3               -0.9762           -0.9791              -0.9791
## 4               -0.9807           -0.9770              -0.9770
## 5               -0.9820           -0.9769              -0.9769
## 6               -0.9778           -0.9777              -0.9777
##   tBodyAccJerkMag-std() tBodyGyroMag-std() tBodyGyroJerkMag-std()
## 1               -0.8960            -0.7621                -0.8943
## 2               -0.9410            -0.9109                -0.9441
## 3               -0.9714            -0.9718                -0.9844
## 4               -0.9748            -0.9704                -0.9856
## 5               -0.9889            -0.9695                -0.9904
## 6               -0.9920            -0.9733                -0.9890
##   fBodyAcc-std()-X fBodyAcc-std()-Y fBodyAcc-std()-Z fBodyAccJerk-std()-X
## 1          -0.9483          -0.9251          -0.6363              -0.9244
## 2          -0.9843          -0.9702          -0.9419              -0.9616
## 3          -0.9948          -0.9737          -0.9623              -0.9919
## 4          -0.9956          -0.9769          -0.9690              -0.9920
## 5          -0.9945          -0.9675          -0.9782              -0.9936
## 6          -0.9946          -0.9710          -0.9614              -0.9945
##   fBodyAccJerk-std()-Y fBodyAccJerk-std()-Z fBodyGyro-std()-X
## 1              -0.9432              -0.9479           -0.9033
## 2              -0.9800              -0.9808           -0.9271
## 3              -0.9710              -0.9723           -0.9732
## 4              -0.9754              -0.9806           -0.9672
## 5              -0.9787              -0.9885           -0.9744
## 6              -0.9808              -0.9876           -0.9800
##   fBodyGyro-std()-Y fBodyGyro-std()-Z fBodyAccMag-std()
## 1           -0.8227           -0.9562           -0.7111
## 2           -0.9320           -0.9701           -0.9597
## 3           -0.9772           -0.9791           -0.9838
## 4           -0.9719           -0.9653           -0.9821
## 5           -0.9766           -0.9700           -0.9788
## 6           -0.9742           -0.9678           -0.9799
##   fBodyBodyAccJerkMag-std() fBodyBodyGyroMag-std()
## 1                   -0.8964                -0.7971
## 2                   -0.9342                -0.9168
## 3                   -0.9703                -0.9740
## 4                   -0.9785                -0.9712
## 5                   -0.9897                -0.9696
## 6                   -0.9917                -0.9751
##   fBodyBodyGyroJerkMag-std()
## 1                    -0.9073
## 2                    -0.9382
## 3                    -0.9833
## 4                    -0.9858
## 5                    -0.9906
## 6                    -0.9898
```

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
Storing individual IDs in a vector

```r
indiv_ids <- unique(X_final[,"indiv"])
```


Creating an empty dataframe with the same struture than **X_final**

```r
tidy_data <- X_final[0,]
```



Adding records to tidy dataset through a bucle

```r
for (id in indiv_ids){
    for (act in activities_names[,2]){
        tidy_data <- rbind(tidy_data,
                             cbind(indiv=as.numeric(id), 
                                   activity=act,
                                   rbind(colMeans(X_final[X_final$indiv==id & X_final$activity==act,c(-1,-2)],na.rm=T)))
                             )
    }
}
for (i in c("indiv",mean_names,sd_names)) {
    tidy_data[,i] <- as.numeric(as.character(tidy_data[,i]))
}
```
## 4. Appropriately labels the data set with descriptive variable names. 

```r
names(tidy_data)[3:68] <- paste("average_",names(tidy_data)[3:68],sep="")
names(tidy_data)
```

```
##  [1] "indiv"                              
##  [2] "activity"                           
##  [3] "average_tBodyAcc-mean()-X"          
##  [4] "average_tBodyAcc-mean()-Y"          
##  [5] "average_tBodyAcc-mean()-Z"          
##  [6] "average_tGravityAcc-mean()-X"       
##  [7] "average_tGravityAcc-mean()-Y"       
##  [8] "average_tGravityAcc-mean()-Z"       
##  [9] "average_tBodyAccJerk-mean()-X"      
## [10] "average_tBodyAccJerk-mean()-Y"      
## [11] "average_tBodyAccJerk-mean()-Z"      
## [12] "average_tBodyGyro-mean()-X"         
## [13] "average_tBodyGyro-mean()-Y"         
## [14] "average_tBodyGyro-mean()-Z"         
## [15] "average_tBodyGyroJerk-mean()-X"     
## [16] "average_tBodyGyroJerk-mean()-Y"     
## [17] "average_tBodyGyroJerk-mean()-Z"     
## [18] "average_tBodyAccMag-mean()"         
## [19] "average_tGravityAccMag-mean()"      
## [20] "average_tBodyAccJerkMag-mean()"     
## [21] "average_tBodyGyroMag-mean()"        
## [22] "average_tBodyGyroJerkMag-mean()"    
## [23] "average_fBodyAcc-mean()-X"          
## [24] "average_fBodyAcc-mean()-Y"          
## [25] "average_fBodyAcc-mean()-Z"          
## [26] "average_fBodyAccJerk-mean()-X"      
## [27] "average_fBodyAccJerk-mean()-Y"      
## [28] "average_fBodyAccJerk-mean()-Z"      
## [29] "average_fBodyGyro-mean()-X"         
## [30] "average_fBodyGyro-mean()-Y"         
## [31] "average_fBodyGyro-mean()-Z"         
## [32] "average_fBodyAccMag-mean()"         
## [33] "average_fBodyBodyAccJerkMag-mean()" 
## [34] "average_fBodyBodyGyroMag-mean()"    
## [35] "average_fBodyBodyGyroJerkMag-mean()"
## [36] "average_tBodyAcc-std()-X"           
## [37] "average_tBodyAcc-std()-Y"           
## [38] "average_tBodyAcc-std()-Z"           
## [39] "average_tGravityAcc-std()-X"        
## [40] "average_tGravityAcc-std()-Y"        
## [41] "average_tGravityAcc-std()-Z"        
## [42] "average_tBodyAccJerk-std()-X"       
## [43] "average_tBodyAccJerk-std()-Y"       
## [44] "average_tBodyAccJerk-std()-Z"       
## [45] "average_tBodyGyro-std()-X"          
## [46] "average_tBodyGyro-std()-Y"          
## [47] "average_tBodyGyro-std()-Z"          
## [48] "average_tBodyGyroJerk-std()-X"      
## [49] "average_tBodyGyroJerk-std()-Y"      
## [50] "average_tBodyGyroJerk-std()-Z"      
## [51] "average_tBodyAccMag-std()"          
## [52] "average_tGravityAccMag-std()"       
## [53] "average_tBodyAccJerkMag-std()"      
## [54] "average_tBodyGyroMag-std()"         
## [55] "average_tBodyGyroJerkMag-std()"     
## [56] "average_fBodyAcc-std()-X"           
## [57] "average_fBodyAcc-std()-Y"           
## [58] "average_fBodyAcc-std()-Z"           
## [59] "average_fBodyAccJerk-std()-X"       
## [60] "average_fBodyAccJerk-std()-Y"       
## [61] "average_fBodyAccJerk-std()-Z"       
## [62] "average_fBodyGyro-std()-X"          
## [63] "average_fBodyGyro-std()-Y"          
## [64] "average_fBodyGyro-std()-Z"          
## [65] "average_fBodyAccMag-std()"          
## [66] "average_fBodyBodyAccJerkMag-std()"  
## [67] "average_fBodyBodyGyroMag-std()"     
## [68] "average_fBodyBodyGyroJerkMag-std()"
```

Checking results

```r
dim(tidy_data)
```

```
## [1] 180  68
```

```r
str(tidy_data)
```

```
## 'data.frame':	180 obs. of  68 variables:
##  $ indiv                              : num  2 2 2 2 2 2 4 4 4 4 ...
##  $ activity                           : Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 1 2 3 4 5 6 1 2 3 4 ...
##   ..- attr(*, "names")= chr  "activity" "activity" "activity" "activity" ...
##  $ average_tBodyAcc-mean()-X          : num  0.276 0.247 0.278 0.277 0.278 ...
##  $ average_tBodyAcc-mean()-Y          : num  -0.0186 -0.0214 -0.0227 -0.0157 -0.0184 ...
##  $ average_tBodyAcc-mean()-Z          : num  -0.106 -0.153 -0.117 -0.109 -0.106 ...
##  $ average_tGravityAcc-mean()-X       : num  0.913 0.791 0.862 0.94 0.897 ...
##  $ average_tGravityAcc-mean()-Y       : num  -0.347 -0.416 -0.326 -0.106 -0.37 ...
##  $ average_tGravityAcc-mean()-Z       : num  0.0847 -0.1959 -0.0439 0.1987 0.1297 ...
##  $ average_tBodyAccJerk-mean()-X      : num  0.0618 0.0745 0.11 0.0723 0.0748 ...
##  $ average_tBodyAccJerk-mean()-Y      : num  0.01825 -0.00971 -0.00328 0.0117 0.01033 ...
##  $ average_tBodyAccJerk-mean()-Z      : num  0.0079 0.01948 -0.02094 0.00761 -0.00837 ...
##  $ average_tBodyGyro-mean()-X         : num  -0.053 -0.0577 -0.1159 -0.0455 -0.0239 ...
##  $ average_tBodyGyro-mean()-Y         : num  -0.04824 -0.03209 -0.00482 -0.05993 -0.08204 ...
##  $ average_tBodyGyro-mean()-Z         : num  0.0828 0.0688 0.0972 0.0412 0.0878 ...
##  $ average_tBodyGyroJerk-mean()-X     : num  -0.0819 -0.0829 -0.0581 -0.0936 -0.1056 ...
##  $ average_tBodyGyroJerk-mean()-Y     : num  -0.0538 -0.0424 -0.0421 -0.0416 -0.0422 ...
##  $ average_tBodyGyroJerk-mean()-Z     : num  -0.0515 -0.0445 -0.071 -0.0436 -0.0547 ...
##  $ average_tBodyAccMag-mean()         : num  -0.29 -0.107 0.09 -0.968 -0.966 ...
##  $ average_tGravityAccMag-mean()      : num  -0.29 -0.107 0.09 -0.968 -0.966 ...
##  $ average_tBodyAccJerkMag-mean()     : num  -0.28142 -0.32127 0.00566 -0.98677 -0.98049 ...
##  $ average_tBodyGyroMag-mean()        : num  -0.447 -0.22 -0.162 -0.946 -0.963 ...
##  $ average_tBodyGyroJerkMag-mean()    : num  -0.548 -0.573 -0.411 -0.991 -0.984 ...
##  $ average_fBodyAcc-mean()-X          : num  -0.346 -0.267 0.113 -0.986 -0.984 ...
##  $ average_fBodyAcc-mean()-Y          : num  -0.0219 0.00992 0.27835 -0.95734 -0.95987 ...
##  $ average_fBodyAcc-mean()-Z          : num  -0.454 -0.281 -0.131 -0.97 -0.962 ...
##  $ average_fBodyAccJerk-mean()-X      : num  -0.305 -0.259 0.138 -0.988 -0.981 ...
##  $ average_fBodyAccJerk-mean()-Y      : num  -0.0788 -0.1878 0.0962 -0.9771 -0.9709 ...
##  $ average_fBodyAccJerk-mean()-Z      : num  -0.555 -0.523 -0.271 -0.985 -0.98 ...
##  $ average_fBodyGyro-mean()-X         : num  -0.43 -0.332 -0.146 -0.983 -0.967 ...
##  $ average_fBodyGyro-mean()-Y         : num  -0.555 -0.488 -0.362 -0.982 -0.973 ...
##  $ average_fBodyGyro-mean()-Z         : num  -0.3967 -0.2486 -0.0875 -0.9598 -0.9606 ...
##  $ average_fBodyAccMag-mean()         : num  -0.324 -0.145 0.293 -0.961 -0.964 ...
##  $ average_fBodyBodyAccJerkMag-mean() : num  -0.169 -0.19 0.222 -0.984 -0.977 ...
##  $ average_fBodyBodyGyroMag-mean()    : num  -0.531 -0.451 -0.321 -0.972 -0.962 ...
##  $ average_fBodyBodyGyroJerkMag-mean(): num  -0.583 -0.601 -0.38 -0.99 -0.978 ...
##  $ average_tBodyAcc-std()-X           : num  -0.4236 -0.3044 0.0464 -0.9868 -0.9873 ...
##  $ average_tBodyAcc-std()-Y           : num  -0.0781 0.108 0.2629 -0.9507 -0.9573 ...
##  $ average_tBodyAcc-std()-Z           : num  -0.425 -0.112 -0.103 -0.96 -0.95 ...
##  $ average_tGravityAcc-std()-X        : num  -0.973 -0.934 -0.94 -0.98 -0.987 ...
##  $ average_tGravityAcc-std()-Y        : num  -0.972 -0.924 -0.94 -0.957 -0.974 ...
##  $ average_tGravityAcc-std()-Z        : num  -0.972 -0.878 -0.931 -0.954 -0.946 ...
##  $ average_tBodyAccJerk-std()-X       : num  -0.278 -0.276 0.147 -0.988 -0.981 ...
##  $ average_tBodyAccJerk-std()-Y       : num  -0.0166 -0.1856 0.1268 -0.978 -0.9711 ...
##  $ average_tBodyAccJerk-std()-Z       : num  -0.586 -0.574 -0.34 -0.988 -0.983 ...
##  $ average_tBodyGyro-std()-X          : num  -0.562 -0.439 -0.321 -0.986 -0.973 ...
##  $ average_tBodyGyro-std()-Y          : num  -0.538 -0.466 -0.416 -0.979 -0.971 ...
##  $ average_tBodyGyro-std()-Z          : num  -0.481 -0.164 -0.279 -0.96 -0.965 ...
##  $ average_tBodyGyroJerk-std()-X      : num  -0.39 -0.465 -0.244 -0.99 -0.979 ...
##  $ average_tBodyGyroJerk-std()-Y      : num  -0.634 -0.645 -0.469 -0.991 -0.983 ...
##  $ average_tBodyGyroJerk-std()-Z      : num  -0.435 -0.468 -0.218 -0.986 -0.974 ...
##  $ average_tBodyAccMag-std()          : num  -0.423 -0.206 0.216 -0.953 -0.958 ...
##  $ average_tGravityAccMag-std()       : num  -0.423 -0.206 0.216 -0.953 -0.958 ...
##  $ average_tBodyAccJerkMag-std()      : num  -0.164 -0.217 0.23 -0.984 -0.977 ...
##  $ average_tBodyGyroMag-std()         : num  -0.553 -0.378 -0.275 -0.961 -0.954 ...
##  $ average_tBodyGyroJerkMag-std()     : num  -0.558 -0.597 -0.343 -0.99 -0.977 ...
##  $ average_fBodyAcc-std()-X           : num  -0.4577 -0.3206 0.0161 -0.9874 -0.9891 ...
##  $ average_fBodyAcc-std()-Y           : num  -0.1692 0.0849 0.172 -0.9501 -0.9579 ...
##  $ average_fBodyAcc-std()-Z           : num  -0.4552 -0.0945 -0.162 -0.9569 -0.9464 ...
##  $ average_fBodyAccJerk-std()-X       : num  -0.314 -0.365 0.05 -0.989 -0.983 ...
##  $ average_fBodyAccJerk-std()-Y       : num  -0.0153 -0.2436 0.0808 -0.9808 -0.9735 ...
##  $ average_fBodyAccJerk-std()-Z       : num  -0.616 -0.625 -0.408 -0.989 -0.985 ...
##  $ average_fBodyGyro-std()-X          : num  -0.604 -0.476 -0.379 -0.987 -0.975 ...
##  $ average_fBodyGyro-std()-Y          : num  -0.533 -0.46 -0.459 -0.977 -0.971 ...
##  $ average_fBodyGyro-std()-Z          : num  -0.56 -0.218 -0.423 -0.964 -0.97 ...
##  $ average_fBodyAccMag-std()          : num  -0.5771 -0.3667 -0.0215 -0.9556 -0.9605 ...
##  $ average_fBodyBodyAccJerkMag-std()  : num  -0.164 -0.26 0.227 -0.984 -0.975 ...
##  $ average_fBodyBodyGyroMag-std()     : num  -0.652 -0.439 -0.373 -0.961 -0.957 ...
##  $ average_fBodyBodyGyroJerkMag-std() : num  -0.558 -0.622 -0.344 -0.99 -0.978 ...
```

```r
head(tidy_data)
```

```
##   indiv           activity average_tBodyAcc-mean()-X
## 1     2            WALKING                    0.2764
## 2     2   WALKING_UPSTAIRS                    0.2472
## 3     2 WALKING_DOWNSTAIRS                    0.2776
## 4     2            SITTING                    0.2771
## 5     2           STANDING                    0.2779
## 6     2             LAYING                    0.2814
##   average_tBodyAcc-mean()-Y average_tBodyAcc-mean()-Z
## 1                  -0.01859                   -0.1055
## 2                  -0.02141                   -0.1525
## 3                  -0.02266                   -0.1168
## 4                  -0.01569                   -0.1092
## 5                  -0.01842                   -0.1059
## 6                  -0.01816                   -0.1072
##   average_tGravityAcc-mean()-X average_tGravityAcc-mean()-Y
## 1                       0.9130                      -0.3466
## 2                       0.7907                      -0.4162
## 3                       0.8618                      -0.3258
## 4                       0.9405                      -0.1056
## 5                       0.8969                      -0.3701
## 6                      -0.5098                       0.7525
##   average_tGravityAcc-mean()-Z average_tBodyAccJerk-mean()-X
## 1                      0.08473                       0.06181
## 2                     -0.19589                       0.07445
## 3                     -0.04389                       0.11004
## 4                      0.19873                       0.07226
## 5                      0.12975                       0.07476
## 6                      0.64683                       0.08260
##   average_tBodyAccJerk-mean()-Y average_tBodyAccJerk-mean()-Z
## 1                       0.01825                      0.007895
## 2                      -0.00971                      0.019481
## 3                      -0.00328                     -0.020935
## 4                       0.01170                      0.007605
## 5                       0.01033                     -0.008372
## 6                       0.01225                     -0.001803
##   average_tBodyGyro-mean()-X average_tBodyGyro-mean()-Y
## 1                   -0.05303                  -0.048238
## 2                   -0.05769                  -0.032088
## 3                   -0.11595                  -0.004823
## 4                   -0.04547                  -0.059929
## 5                   -0.02386                  -0.082040
## 6                   -0.01848                  -0.111801
##   average_tBodyGyro-mean()-Z average_tBodyGyroJerk-mean()-X
## 1                    0.08283                       -0.08188
## 2                    0.06884                       -0.08289
## 3                    0.09717                       -0.05810
## 4                    0.04123                       -0.09363
## 5                    0.08784                       -0.10556
## 6                    0.14488                       -0.10197
##   average_tBodyGyroJerk-mean()-Y average_tBodyGyroJerk-mean()-Z
## 1                       -0.05383                       -0.05149
## 2                       -0.04241                       -0.04452
## 3                       -0.04215                       -0.07102
## 4                       -0.04156                       -0.04359
## 5                       -0.04224                       -0.05465
## 6                       -0.03586                       -0.07018
##   average_tBodyAccMag-mean() average_tGravityAccMag-mean()
## 1                   -0.29041                      -0.29041
## 2                   -0.10732                      -0.10732
## 3                    0.08995                       0.08995
## 4                   -0.96789                      -0.96789
## 5                   -0.96588                      -0.96588
## 6                   -0.97744                      -0.97744
##   average_tBodyAccJerkMag-mean() average_tBodyGyroMag-mean()
## 1                      -0.281424                     -0.4465
## 2                      -0.321269                     -0.2197
## 3                       0.005655                     -0.1622
## 4                      -0.986775                     -0.9460
## 5                      -0.980489                     -0.9635
## 6                      -0.987742                     -0.9500
##   average_tBodyGyroJerkMag-mean() average_fBodyAcc-mean()-X
## 1                         -0.5479                   -0.3460
## 2                         -0.5728                   -0.2667
## 3                         -0.4109                    0.1128
## 4                         -0.9911                   -0.9858
## 5                         -0.9840                   -0.9839
## 6                         -0.9918                   -0.9767
##   average_fBodyAcc-mean()-Y average_fBodyAcc-mean()-Z
## 1                 -0.021905                   -0.4538
## 2                  0.009924                   -0.2810
## 3                  0.278345                   -0.1313
## 4                 -0.957343                   -0.9702
## 5                 -0.959872                   -0.9625
## 6                 -0.979801                   -0.9844
##   average_fBodyAccJerk-mean()-X average_fBodyAccJerk-mean()-Y
## 1                       -0.3046                      -0.07876
## 2                       -0.2586                      -0.18784
## 3                        0.1381                       0.09621
## 4                       -0.9878                      -0.97714
## 5                       -0.9810                      -0.97085
## 6                       -0.9858                      -0.98277
##   average_fBodyAccJerk-mean()-Z average_fBodyGyro-mean()-X
## 1                       -0.5550                    -0.4297
## 2                       -0.5227                    -0.3316
## 3                       -0.2715                    -0.1458
## 4                       -0.9851                    -0.9826
## 5                       -0.9798                    -0.9670
## 6                       -0.9862                    -0.9864
##   average_fBodyGyro-mean()-Y average_fBodyGyro-mean()-Z
## 1                    -0.5548                   -0.39666
## 2                    -0.4881                   -0.24860
## 3                    -0.3619                   -0.08749
## 4                    -0.9821                   -0.95981
## 5                    -0.9726                   -0.96063
## 6                    -0.9833                   -0.96267
##   average_fBodyAccMag-mean() average_fBodyBodyAccJerkMag-mean()
## 1                    -0.3243                            -0.1691
## 2                    -0.1453                            -0.1895
## 3                     0.2934                             0.2222
## 4                    -0.9613                            -0.9839
## 5                    -0.9641                            -0.9771
## 6                    -0.9751                            -0.9854
##   average_fBodyBodyGyroMag-mean() average_fBodyBodyGyroJerkMag-mean()
## 1                         -0.5307                             -0.5832
## 2                         -0.4506                             -0.6008
## 3                         -0.3208                             -0.3802
## 4                         -0.9718                             -0.9899
## 5                         -0.9618                             -0.9778
## 6                         -0.9721                             -0.9902
##   average_tBodyAcc-std()-X average_tBodyAcc-std()-Y
## 1                 -0.42364                 -0.07809
## 2                 -0.30438                  0.10803
## 3                  0.04637                  0.26288
## 4                 -0.98682                 -0.95070
## 5                 -0.98727                 -0.95730
## 6                 -0.97406                 -0.98028
##   average_tBodyAcc-std()-Z average_tGravityAcc-std()-X
## 1                  -0.4253                     -0.9727
## 2                  -0.1121                     -0.9344
## 3                  -0.1028                     -0.9404
## 4                  -0.9598                     -0.9800
## 5                  -0.9497                     -0.9867
## 6                  -0.9842                     -0.9590
##   average_tGravityAcc-std()-Y average_tGravityAcc-std()-Z
## 1                     -0.9721                     -0.9721
## 2                     -0.9238                     -0.8780
## 3                     -0.9401                     -0.9314
## 4                     -0.9568                     -0.9544
## 5                     -0.9742                     -0.9459
## 6                     -0.9882                     -0.9842
##   average_tBodyAccJerk-std()-X average_tBodyAccJerk-std()-Y
## 1                      -0.2775                      -0.0166
## 2                      -0.2761                      -0.1856
## 3                       0.1472                       0.1268
## 4                      -0.9881                      -0.9780
## 5                      -0.9811                      -0.9711
## 6                      -0.9859                      -0.9832
##   average_tBodyAccJerk-std()-Z average_tBodyGyro-std()-X
## 1                      -0.5861                   -0.5616
## 2                      -0.5737                   -0.4393
## 3                      -0.3401                   -0.3208
## 4                      -0.9875                   -0.9857
## 5                      -0.9828                   -0.9730
## 6                      -0.9884                   -0.9883
##   average_tBodyGyro-std()-Y average_tBodyGyro-std()-Z
## 1                   -0.5385                   -0.4811
## 2                   -0.4663                   -0.1640
## 3                   -0.4157                   -0.2794
## 4                   -0.9789                   -0.9598
## 5                   -0.9714                   -0.9649
## 6                   -0.9823                   -0.9603
##   average_tBodyGyroJerk-std()-X average_tBodyGyroJerk-std()-Y
## 1                       -0.3895                       -0.6341
## 2                       -0.4649                       -0.6455
## 3                       -0.2439                       -0.4694
## 4                       -0.9897                       -0.9909
## 5                       -0.9793                       -0.9834
## 6                       -0.9932                       -0.9896
##   average_tBodyGyroJerk-std()-Z average_tBodyAccMag-std()
## 1                       -0.4355                   -0.4225
## 2                       -0.4676                   -0.2060
## 3                       -0.2183                    0.2156
## 4                       -0.9855                   -0.9531
## 5                       -0.9736                   -0.9579
## 6                       -0.9880                   -0.9729
##   average_tGravityAccMag-std() average_tBodyAccJerkMag-std()
## 1                      -0.4225                       -0.1642
## 2                      -0.2060                       -0.2174
## 3                       0.2156                        0.2296
## 4                      -0.9531                       -0.9845
## 5                      -0.9579                       -0.9767
## 6                      -0.9729                       -0.9855
##   average_tBodyGyroMag-std() average_tBodyGyroJerkMag-std()
## 1                    -0.5530                        -0.5578
## 2                    -0.3775                        -0.5973
## 3                    -0.2748                        -0.3432
## 4                    -0.9613                        -0.9896
## 5                    -0.9539                        -0.9772
## 6                    -0.9612                        -0.9897
##   average_fBodyAcc-std()-X average_fBodyAcc-std()-Y
## 1                  -0.4577                 -0.16922
## 2                  -0.3206                  0.08488
## 3                   0.0161                  0.17197
## 4                  -0.9874                 -0.95007
## 5                  -0.9891                 -0.95791
## 6                  -0.9732                 -0.98103
##   average_fBodyAcc-std()-Z average_fBodyAccJerk-std()-X
## 1                 -0.45522                     -0.31431
## 2                 -0.09454                     -0.36542
## 3                 -0.16203                      0.04996
## 4                 -0.95686                     -0.98946
## 5                 -0.94643                     -0.98301
## 6                 -0.98479                     -0.98725
##   average_fBodyAccJerk-std()-Y average_fBodyAccJerk-std()-Z
## 1                     -0.01533                      -0.6159
## 2                     -0.24355                      -0.6251
## 3                      0.08083                      -0.4082
## 4                     -0.98080                      -0.9886
## 5                     -0.97352                      -0.9846
## 6                     -0.98499                      -0.9893
##   average_fBodyGyro-std()-X average_fBodyGyro-std()-Y
## 1                   -0.6041                   -0.5330
## 2                   -0.4764                   -0.4598
## 3                   -0.3794                   -0.4587
## 4                   -0.9868                   -0.9774
## 5                   -0.9750                   -0.9710
## 6                   -0.9889                   -0.9819
##   average_fBodyGyro-std()-Z average_fBodyAccMag-std()
## 1                   -0.5599                  -0.57711
## 2                   -0.2181                  -0.36673
## 3                   -0.4230                  -0.02148
## 4                   -0.9635                  -0.95558
## 5                   -0.9698                  -0.96052
## 6                   -0.9632                  -0.97512
##   average_fBodyBodyAccJerkMag-std() average_fBodyBodyGyroMag-std()
## 1                           -0.1641                        -0.6518
## 2                           -0.2604                        -0.4386
## 3                            0.2275                        -0.3726
## 4                           -0.9841                        -0.9614
## 5                           -0.9752                        -0.9568
## 6                           -0.9846                        -0.9611
##   average_fBodyBodyGyroJerkMag-std()
## 1                            -0.5581
## 2                            -0.6218
## 3                            -0.3437
## 4                            -0.9896
## 5                            -0.9778
## 6                            -0.9895
```



Storing data in **txt** and **Rdata** files

```r
write.table(tidy_data, file="tidy_data.txt", sep="\t", dec=".")
save(tidy_data, file="tidy_data.Rdata")
```
