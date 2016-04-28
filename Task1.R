# Initialisiere die Daten
vehicleData <- mtcars["Camaro Z28",]
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
topMpg <- quantile(vehiclesData["mpg"],probs = 0.9,na.rm = T)
topQsec <- quantile(vehiclesData["qsec"],probs = 0.1,na.rm = T)
quantiles <- c(topHp,topMpg, topQsec)

createFormattedAdWithComparisons <- function(vehicleData)
  {vehicleDim <- c("Fuel Efficiency:","Cylinder:","Horse Power:","1/4 mile time:") 
  carname <- row.names(vehicleData)
  
  if (vehicleData[,1]>= quantiles[2]) tempMpg <- "Top10%" else tempMpg <- ""
  if (vehicleData[,4]>= quantiles[1]) tempHp <- "Top10%" else tempHp <- ""
  if (vehicleData[,7]<= quantiles[3]) tempQsec <- "Top10%" else tempQsec <- ""
  
  evalTop <- c(tempMpg,"",tempHp,tempQsec)
  
  message(sprintf("********************\n"),
        sprintf("* %-17s*\n",carname),
        sprintf("* %-16s = %-6s %s *\n",vehicleDim,c(paste(vehicleData[,c(1,2,4,7)])),evalTop),
        sprintf("********************\n"))
}

createFormattedAdWithComparisons(vehicleData)


# Funktion für Teilaufgabe d.) mit Test  

createFormattedAdWithComparisonsN <- function(vehiclesData,n)
{
  # Die Top Ten Werte für Leistung, Fuel Efficiency, 1/4 mile time 
  topHp <- quantile(vehiclesData["hp"],probs = 0.9,na.rm = T)
  topMpg <- quantile(vehiclesData["mpg"],probs = 0.9,na.rm = T)
  topQsec <- quantile(vehiclesData["qsec"],probs = 0.1,na.rm = T)
  quantiles <- c(topHp,topMpg, topQsec)

  vehicleDim <- c("Fuel Efficiency:","Cylinder:","Horse Power:","1/4 mile time:") 
  
  randVehicles <- vehiclesData[sample(nrow(vehiclesData),n),]
  
  carname <- row.names(vehiclesData[n,])

  if (vehiclesData[n,1] >= quantiles[2]) tempMpg <- "Top10%" else tempMpg <- ""
  if (vehiclesData[n,4] >= quantiles[1]) tempHp <- "Top10%" else tempHp <- ""
  if (vehiclesData[n,7] <= quantiles[3]) tempQsec <- "Top10%" else tempQsec <- ""

  evalTop <- c(tempMpg,"",tempHp,tempQsec)

  message(sprintf("********************\n"),
          sprintf("* %-17s*\n",carname),
          sprintf("* %-16s = %-6s %s *\n",vehicleDim,c(paste(vehiclesData[n,c(1,2,4,7)])),evalTop),
          sprintf("********************\n"))
}

createFormattedAdWithComparisonsN(vehiclesData,12)

vehiclesData[sample(nrow(vehiclesData),15),]

sapply(vehiclesData[sample(nrow(vehiclesData),15),], createFormattedAdWithComparisons)
  
# Hinzufügen des Preises und der Laufleistung

carPrices <- read.csv("carPrices.csv", header = T)

carMileage <- read.csv("carMileage.csv", header = T)
head(carMileage)
vehicleData <- merge(carPrices, carMileage, by=c("Type"))
