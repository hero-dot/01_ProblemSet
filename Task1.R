# Initialisiere die Daten
vehicleData <- mtcars["Toyota Corolla",]
vehiclesData <- mtcars
# TODO
# Change the values of vehicleDim to the realexpressions

# Funktion für Teilaufgabe a.) mit Test
# Unformatierte Ausgabe einer bestimmten Zeile
createAd <- function(vehicleData){return(vehicleData)}
createAd(vehicleData)


# Funktion zu Teilaufgabe b.) mit Test
# Formatierung einer der Daten zu einem Auto in die gewünschte Form
createFormattedAd <- function(vehicleData)
  {vehicleDim <- c("Fuel Efficiency:","Cylinder:","Horse Power:","1/4 mile time:") 
   carname <- row.names(vehicleData)
   message(sprintf("********************\n"),
           sprintf("* %-17s*\n",carname),
           sprintf("* %-5s = %-9s*\n",vehicleDim,c(paste(vehicleData[,c(1,2,4,7)]))),
           sprintf("********************\n"))
  }
createFormattedAd(vehicleData)


# Funktion für Teilaufgabe c.) mit Test
# Vergleich der Wagen in Bezug auf die Kraftstoffeffizienz, der Leistung und der quarter
# mile time.
# Ist das Fahrzeug in den top 10% füge einen entsprechenden Vermerk hinzu.


# Die Top Ten Werte für Leistung, Fuel Efficiency, 1/4 mile time 
topHp <- quantile(vehiclesData["hp"],probs = 0.9,na.rm = T)
topMpg <- quantile(vehiclesData["mpg"],probs = 0.1,na.rm = T)
topQsec <- quantile(vehiclesData["qsec"],probs = 0.1,na.rm = T)

quantiles <- c(topHp,topMpg, topQsec)

createFormattedAdWithComparisons <- function(vehicleData)


#x <- quantile(vehicleData["hp"],probs = 0.9,na.rm = T)


# Funktion für Teilaufgabe d.) mit Test  

createFormattedAdWithComparisonsN <- function(vehiclesData,n)

# Hinzufügen des Preises und der Laufleistung

carPrices <- read.csv("carPrices.csv", header = T)

carMileage <- read.csv("carMileage.csv", header = T)
head(carMileage)
vehicleData <- merge(carPrices, carMileage, by=c("Type"))
