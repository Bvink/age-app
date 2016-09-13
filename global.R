ageData <- read.csv("data/ages.csv", header=TRUE)
ageDataSorted <- with(ageData,  ageData[order(Country) , ])