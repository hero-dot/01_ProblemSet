# Initialisiere die Daten
vehicleData <- mtcars["Camaro Z28",]
vehiclesData <- mtcars
library(dplyr)
# TODO
# Aufgabe c: darstellen der zufällig ausgewählten Autos mit displayAd und apply 

# Aufgabe d: Anpassen der Funktion aus c auf die Daten aus c

# Funktion für Teilaufgabe a.) mit Test
# Unformatierte Ausgabe einer bestimmten Zeile
createAd <- function(vehicleData){return(vehicleData)}
createAd(vehicleData)


# Funktion zu Teilaufgabe b.) mit Test
# Formatierung einer der Daten zu einem Auto in die gewünschte Form
createFormattedAd <- function(vehicleData)
  {vehicleDim <- c("Fuel Efficiency:","Cylinder:","Horse Power:","1/4 mile time:") 
   carname <- row.names(vehicleData)
   message(sprintf("********************\n* %-17s*\n",carname),
           sprintf("* %-5s = %-9s*\n",vehicleDim,c(paste(select(vehicleData,mpg,cyl,hp,qsec)))),
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
  
  message(sprintf("************************************\n* %-33s*\n",carname),
        sprintf("* %-16s = %-6s %6s *\n",vehicleDim,c(paste(select(vehicleData,mpg,cyl,hp,qsec))),evalTop),
        sprintf("************************************\n"))
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
  
  randVehicles <- select(sample_n(vehiclesData,n),mpg,cyl,hp,qsec)
  
  for (i in 1:n)
  {
    carname <- row.names(randVehicles[i,])
    
    if (randVehicles[i,1]>= quantiles[2]) tempMpg <- "Top10%" else tempMpg <- ""
    if (randVehicles[i,3] >= quantiles[1]) tempHp <- "Top10%" else tempHp <- ""
    if (randVehicles[i,4] <= quantiles[3]) tempQsec <- "Top10%" else tempQsec <- ""
    
    evalTop <- c(tempMpg,"",tempHp,tempQsec)
    
    message(sprintf("********************\n"),
            sprintf("* %-17s*\n",carname),
            sprintf("* %-16s = %-6s %s *\n",vehicleDim,c(paste(randVehicles[i,])),evalTop),
            sprintf("********************\n"))
    
  }
}
  
createFormattedAdWithComparisonsN(vehiclesData,5)

# Hinzufügen des Preises und der Laufleistung

createFormattedAdWithComparisonsNMilePrice <- function(vehiclesData,n)
{
  carMileage <- read.csv("carMileage.csv", header = T)
  carPrices <- read.csv("carPrices.csv", header = T)
  
  vehiclesMlgPrice <- mutate(vehiclesData,mlg = carMileage[,2], price = carPrices[,2],type = carMileage[,1])
  
  # Die Top Ten Werte für Leistung, Fuel Efficiency, 1/4 mile time 
  topHp <- quantile(vehiclesMlgPrice["hp"],probs = 0.9,na.rm = T)
  topMpg <- quantile(vehiclesMlgPrice["mpg"],probs = 0.9,na.rm = T)
  topQsec <- quantile(vehiclesMlgPrice["qsec"],probs = 0.1,na.rm = T)
  quantiles <- c(topHp,topMpg, topQsec)
  
  vehicleDim <- c("Fuel Efficiency:","Cylinder:","Horse Power:","1/4 mile time:", "Mileage:", "Price") 
  
  randVehicles <- select(sample_n(vehiclesMlgPrice,n),mpg,cyl,hp,qsec,mlg,price,type)
  
  for (i in 1:n)
  {
    if (randVehicles[i,1]>= quantiles[2]) tempMpg <- "Top10%" else tempMpg <- ""
    if (randVehicles[i,3] >= quantiles[1]) tempHp <- "Top10%" else tempHp <- ""
    if (randVehicles[i,4] <= quantiles[3]) tempQsec <- "Top10%" else tempQsec <- ""
    
    evalTop <- c(tempMpg,"",tempHp,tempQsec,"","")
    
    carname <- randVehicles[i,"type"]
    
    message(sprintf("********************\n"),
            sprintf("* %-17s*\n",carname),
            sprintf("* %-16s = %-6s %s *\n",vehicleDim,c(paste(randVehicles[i,1:6])),evalTop),
            sprintf("********************\n"))
    
  }
}

createFormattedAdWithComparisonsNMilePrice(vehiclesData,5)
