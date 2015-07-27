run_analysis<-function() {

        X_test<- read.table("./data/UCI HAR Dataset/test/X_test.txt")
        y_test<- read.table("./data/UCI HAR Dataset/test/y_test.txt")
        y_train<- read.table("./data/UCI HAR Dataset/train/y_train.txt")
        X_train<- read.table("./data/UCI HAR Dataset/train/X_train.txt")

        subject_train<- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
        subject_test<- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

        features<- read.table("./data/UCI HAR Dataset/features.txt")
        act_labels<- read.table("./data/UCI HAR Dataset/activity_labels.txt")

        names(X_test) <- features$V2
        names(X_train) <- features$V2

        datatest <- cbind(subject_test, y_test, X_test)
        datatrain <- cbind(subject_train, y_train, X_train)

        data <- rbind(datatest, datatrain)

        names(data)[1:2] <- c("subject", "activity")
        orderedData <<- data[order(data[,'subject'],data[,'activity']),]

        meanandstd <<- cbind(orderedData[,grep(c("mean"), colnames(orderedData))],orderedData[,grep(c("std"), colnames(orderedData))])

        orderedData$activity <<- factor(orderedData$activity, levels = act_labels$V1 , labels = act_labels$V2)

        nonamesdata <- orderedData
        names(nonamesdata) <- 1:563
       ## return(orderedData)

        }