# Begin 'The Art of Healing'

#1 
# Load Libraries
library(tidyverse)
library(reshape2)

#2 
# Reading data
myData <- read_csv("data.csv")

#3 
# Exploring and cleaning data
# Checking for missing values
sum(sapply(myData, is.na))

#4 
# Removing rows with missing values
myData <- myData[complete.cases(myData),] 

#5 
# Data visualization
# Create simple scatter plot of patient age vs. symptom intensity
ggplot(data=myData, aes(x=age, y=intensity)) + geom_point()

#6 
# Calculating averages
# Calculate average age
avgAge <- mean(myData$Age)

#7 
# Modeling 
# Fit polynomial regression model 
regModel <- lm(intensity~poly(age, 2), data=myData)

#8 
# Use the model to predict symptom intensities 
# for two different ages
prediction1 <- predict(regModel, data.frame(age=50))
prediction2 <- predict(regModel, data.frame(age=60))

#9 
# Data transformation
# Creating a wide form of the data 
myData2 <- dcast(myData, patientID ~ symptom, value.var="intensity")

#10 
# Machine learning
# Train a random forest model
set.seed(10)
rfModel <- randomForest(as.matrix(myData2[,-1]), myData2$patientID)

#11 
# Use the trained model to predict symptom intensities 
# for a new patient
prediction3 <- predict(rfModel, newdata=myData2[1, -1])

#12 
# Visualizing results
# Create a bar graph of the feature importance for the random forest model
imp <- varImpPlot(rfModel, scale=FALSE)

#13 
# Evaluating model performance 
# Calculate prediction accuracy using the test set
rfAccuracy <- confusionMatrix(rfModel, myData2[,-1], myData2$patientID)

#14 
# Writing results
# Writing predictions and accuracy to a csv file
csvData <- cbind(cbind(prediction1, prediction2, prediction3), rfAccuracy)
write.csv(csvData, file="results.csv", row.names=FALSE)

#15 
# Conclusion
# To conclude, I was able to use a combination of data exploration, transformation, 
and modeling techniques to create an accurate predictive model for patient symptom intensities. 
This model will be helpful in predicting patient symptom intensity to better treat their illness 
and improve the quality of care.