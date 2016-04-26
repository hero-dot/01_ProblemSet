# Initialisiere die Daten
vehicleData <- mtcars

# TODO
# Change the functions, so that they take a single row as an argument, not the whole dataset
# Change the values of vehicleDim to the realexpressions

# Funktion für Teilaufgabe a.) mit Test
# Unformatierte Ausgabe einer bestimmten Zeile
createAd <- function(vehicleData, carname){return(vehicleData[carname,])}
createAd(vehicleData,"Toyota Corolla")

# Funktion zu Teilaufgabe b.) mit Test
# Formatierung einer der Daten zu einem Auto in die gewünschte Form
createFormattedAd <- function(vehicleData,carname)
  {vehicleDim <- c("mpg","cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb") 
   message(sprintf("********************\n"),
           sprintf("* %-17s*\n",carname),
           sprintf("* %-5s = %-9s*\n",vehicleDim,c(paste(vehicleData[carname,]))),
           sprintf("********************\n"))
  }
createFormattedAd(vehicleData,"Pontiac Firebird")


# Funktion für Teilaufgabe c.) mit Test
# Vergleich der Wagen in Bezug auf die Kraftstoffeffizienz, der Leistung und der quarter
# mile time.
# Ist das Fahrzeug in den top 10% füge einen entsprechenden Vermerk hinzu.


createFormattedAdWithComparisons <- function(vehicleData)


  


# Funktion für Teilaufgabe d.) mit Test  

createFormattedAdWithComparisonsN <- function(vehiclesData,n)

# Hinzufügen des Preises und der Laufleistung

carPrices <- read.csv("carPrices.csv", header = T)

carMileage <- read.csv("carMileage.csv", header = T)
head(carMileage)
vehicleData <- merge(carPrices, carMileage, by=c("Type"))
