#######################################
###### Loading Measurement Data #######
#######################################

loadMeasurementData <- function() {
        # Loading the measurement data from the train data
        trainData <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "", na.strings = "", header = F, strip.white = T)
        # Loading the measurement data from the test data
        testData <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "", na.strings = "", header = F, strip.white = T)
        
        # Merging the train data set and the test data set
        totalData <- rbind(trainData, testData)        
        
        totalData
}

#######################################
#### Extracting Mean and Std Data #####
#######################################

extractMeanAndStdData <- function(totaldata) {
        # Extract the measurements containing the column names mean and std
        extractedData <- totalData[,grep("mean|std", colnames(totalData))]
        
        extractedData
}

##########################################
## Label Variables as Descriptive Names ##
##########################################

labelVariables <- function(totaldata) {        
        # Reading the integer to factor mapping of features
        featuresData <- read.table("UCI HAR Dataset/features.txt", sep = "", na.strings = "", header = F, strip.white = T)
        
        # Setting the column names of the dataset to the ones referred in the featuresData
        for(i in seq(nrow(featuresData))) {
                featureCode <- featuresData[i,]$V1
                featureName <- as.character(featuresData[i,]$V2)
                
                colnames(totalData)[i] <- featureName
        }
        
        print(colnames(totalData))
        
        updatedTotalData <- totalData
        
        updatedTotalData
}

#######################################
###### Adding Activity Variable #######
#######################################

appendActivityData <- function(extractedData) {
        # Loading the activity list from the train dataset  
        trainActData <- read.table("UCI HAR Dataset/train/y_train.txt", sep = "", na.strings = "", header = F, strip.white = T)
        # Loading the activity list from the test dataset
        testActData <- read.table("UCI HAR Dataset/test/y_test.txt", sep = "", na.strings = "", header = F, strip.white = T)
        # Merging the train data set and the test data set
        totActData <- rbind(trainActData, testActData)
        
        # Loading the integer to factor mapping of activity labels
        actLabelData <- read.table("UCI HAR Dataset/activity_labels.txt", sep = "", na.strings = "", header = F, strip.white = T)
        
        # (Objective 3) Changing data type of activity label from integer to factor and then remapping to a descriptive label
        totActData$V1 <- as.factor(totActData$V1)
        for(i in seq(nrow(actLabelData))){
                levels(totActData$V1)[i] <- as.character(actLabelData[i,]$V2)
        }
        
        # adding new descriptive variable to activity type 
        extractedData$Activity <- totActData$V1
        
        extractedData
}

#######################################
###### Adding Subject Variable ########
#######################################

appendSubjectData <- function(extractedData) {
        # Loading subject list from train dataset
        trainSubjData <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "", na.strings = "", header = F, strip.white = T)
        # Loading subject list from test dataset
        testSubjData <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = "", na.strings = "", header = F, strip.white = T)
        # Merging the train data set and the test data set
        totSubjData <- rbind(trainSubjData, testSubjData)
        
        # added subject list variable to data set... Completed merging test and train data
        extractedData$Subject <- totSubjData$V1 
        
        # Writing the tidy data to file storage
        write.table(extractedData, file = "tidydata.txt", row.names = F)
        
        extractedData
}


###########################################
###### Average Mean of AllVariables #######
###########################################

genAndSaveAvgVariableData <- function(extractedData) {
        library(reshape2)
        varCols = names(extractedData)[!names(extractedData) %in% c("Subject", "Activity")]
        
        meltData <- melt(extractedData, id = c("Subject", "Activity"), measure.vars = varCols)
        meanVarData <- dcast(meltData, Subject + Activity ~ varCols, mean)
                
        write.table(meanVarData, file = "meanVarData.txt", row.names = F) 
        
        meanVarData
}

# (Objective 1) All training and test data aggregated
totalData <- loadMeasurementData()
# (Objective 4) Labelled all the variables
totalData <- labelVariables(totalData)
# (Objective 2) Extract Mean and Std Variables from totalData
extractedData <- extractMeanAndStdData(totalData)
# (Objective 3) Append Activity Data and convert it to descriptive names
extractedData <- appendActivityData(extractedData)
# Append Subject data
extractedData <- appendSubjectData(extractedData)

# (Objective 5) Generate and Save Mean values of each variable by activity and subject
meanVarData <- genAndSaveAvgVariableData(extractedData)

