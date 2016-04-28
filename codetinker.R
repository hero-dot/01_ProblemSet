library(dplyr)

# select rows

slice(vehiclesData, sample(nrow(vehiclesData),3))
vehiclesData[sample(nrow(vehiclesData),3),]

# select columns
select(vehicleData,mpg,hp,qsec)
vehicleData[,c(1,2,4,7)]

# randomly sample rows
sample_n(vehiclesData,10)
vehicleDim <- c("Fuel Efficiency:","Cylinder:","Horse Power:","1/4 mile time:") 
carname <- row.names(vehicleData)
message(sprintf("********************\n* %-17s*\n",carname),
        sprintf("* %-5s = %-9s*\n",vehicleDim,c(paste(select(vehicleData,mpg,cyl,hp,qsec)))),
        sprintf("********************\n"))


bspmatrix<-matrix(1:30,byrow=T,ncol=10) # neue Beispielmatrix
multipliziere <- function(x) {10*x}     # neue Beispielfunktion
bspmatrix
apply(bspmatrix,MARGIN = 2, FUN = multipliziere)
lapply(bspmatrix, FUN = multipliziere)
