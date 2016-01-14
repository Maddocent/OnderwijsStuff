#reading the data
Dummy_1 <- read.csv("./Data/OnderwijsStuff/Dummy_1.csv", sep=",")

#renaming the data.frame
data <- Dummy_1

# changing the names of the data.frame to English names
names(data)
names(data) <- c("Surname", "StudentID", "Class", "Score")

#checking change 'names'
names(data)

#checking structure of 'data'
str(data)

#investigating the first entries
head(data)

#checking the levels of "$Class"
levels(data$Class)

#substitute the typo "cl3" for "vl3", using gsub
data$Class <- gsub("cl3", "vl3", data$Class)

# An alternative way to change the entry (typing error "cl3") 
#of one specific cell:
#---->  data[3,3] <- c("vl3")

# gsub is better, it chages the factor Class 
#to "character" the below line changes the "$Class" back to factor
data$Class <- as.factor(data$Class)

# checking change
levels(data$Class)

#If there are empty levels remove them with 
#data$Klas <- droplevels(data$Klas)

#splitting data for Class: this creates a list with i = length(levels(data$Class)) elements
Class_split <- split(data, data$Class)

# a for-loop to create seperate *.csv files for each level in "$Class". The names of the 

# a function that takes the levels of a factor and prints them out to the console with each element seprated with a comma:
Labels_Class <- as.character(levels(data$Class))


cat(paste(shQuote(Labels_Class, type="cmd"), collapse=", "))
#copy the output of the line above to "new_names" below

for (i in 1:length(Class_split)) {
  
  new_names <- c("vl3", "vl4", "vl5")
  
  #the new names are assigned to the data frames
  assign(new_names[i], Class_split[[i]])
  
  # save each new data frame as an individual .csv file based on its name using lapply
  
  setwd("C:/RWorkingDir/Data/OnderwijsStuff")
  
  
  lapply(1:length(Class_split), function(i) write.csv(Class_split[[i]], 
              file = paste0(names(Class_split[i]), ".csv"),
              row.names = FALSE))
  
  setwd("C:/RWorkingDir")
  
  print(names(Class_split))
  
}



##################################

#Opdrachten: 
# 1) Maak per klas een CSV file
# 2) Maak voor een scatterplot waarbij op de x-as de studentnummers staan en op de y-as het aantal behaalde punten, 
#    geef de punten in de grafiek een kleur per klas rood = VL3, blauw = VL4, bruin = VL5
# 3) Bereken de cummulatieve score voor het aantal behaalde punten per klas, sla deze scores op in een nieuwe data.frame ("Summary") 
#met klas ("$Class") als variabele 1 en cummulatieve score ("$SumScore") als variabele 2
# 4) bereken het gemiddeld aantal behaalde punten ("$AverageScore") per klas en de standaarddeviatie ("$StDevAS") van die gemiddele
# scores, voeg deze twee variabelen aan de data.frame "Summary" toe.
# 5) Maak een bargraph waarin de twee grafieken staan: A -> cummulatieve score per klas ("$SummScore), B -> gemiddelde score per klas,
# met standard error of the mean* (SEM) als error bar 

# *Remember SEM = StDevAS/Number of observations ^ sqrt

#################################
