

Dummy_1 <- read.csv("C:/RWorkingDir/Data/OnderwijsStuff/Dummy_1.csv", sep=";")

data <- Dummy_1


levels(data$Klas)

data$Klas <- gsub("cl3", "vl3", data$Klas)

# van character naar factor
data$Klas <- as.factor(data$Klas)

# checking change
levels(data$Klas)

data$Klas <- droplevels(data$Klas)
#splitting dat for klas
Renate_split <- split(data, data$Klas)


for (i in 1:length(Renate_split)) {
  
  new_names <- c("vl3", "vl4", "vl5")
  
  #the new names are assigned to the data frames
  assign(new_names[i], Renate_split[[i]])
  
  # save each new data frame as an individual .csv file based on its name using lapply
  
  setwd("C:/RWorkingDir/Data/Renate")
  
  
  lapply(1:length(Renate_split), function(i) write.csv(Renate_split[[i]], 
                                          file = paste0(names(Renate_split[i]), ".csv"),
                                                     row.names = FALSE))
  
  setwd("C:/RWorkingDir")
  
  print(names(Renate_split))
  
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
