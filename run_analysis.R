setwd("C:/Users/mbonoli/Documents/GitHub/gcd_project")

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
y <- rbind(y_test, y_train)
activities <- activities_names[y[,1],2]
# Reading individuals data
indiv_test <- read.table("subject_test.txt", quote="\"")
indiv_train <- read.table("subject_train.txt", quote="\"")
indiv <- rbind(indiv_test, indiv_train)
names(indiv) <- "indiv"

# 1. Merges the training and the test sets to create one data set.
X <- rbind(X_test,X_train)
y <- rbind(y_test, y_train)

# 3. Uses descriptive activity names to name the activities in the data set
names(X) <- features_names

mean_names <- as.character(features_names[grep("mean()", features_names, fixed=TRUE)])
sd_names <- as.character(features_names[grep("std()", features_names, fixed=TRUE)])
# 2. Extracts only the measurements on the mean and standard deviation for each measurement
X_final <- cbind(indiv=indiv,
                 activity=activities,
                X[,mean_names],
                X[,sd_names])
head(X_final)

indiv_ids <- unique(X_final[,"indiv"])

tidy_data <- X_final[0,]  #colMeans(X_indiv[X_indiv$indiv==indiv_ids[1],],na.rm=T)
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
names(tidy_data)[3:68] <- paste("average_",names(tidy_data)[3:68],sep="")

dim(tidy_data)
str(tidy_data)
write.table(tidy_data, file="tidy_data.txt", sep="\t", dec=".")
save(tidy_data, file="tidy_data.Rdata")
tidy_data