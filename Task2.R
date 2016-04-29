# TODO
# a)

# provide an executive summary of the data set
# Infrastructure for reading in the files
assemblies <- read.csv("assemblies.csv",header = T)
bom <- read.csv("bill_of_materials.csv", header = T)
components <- read.csv("components.csv", header = T)
endForm <- read.csv("end_form.csv",header = T)
quotes <- read.csv("quotes.csv", header = T)
steps <- read.csv("steps.csv", header = T)

# Executive summary of the data set
# Summary assemblies
str(assemblies)
head(assemblies)
summary(assemblies)

# Summary billOfMaterials
str(bom)
head(bom)
summary(bom)

# Summary components
str(components)
head(components)
summary(components)

# Summary endForm
str(endForm)
head(endForm)
summary(endForm)

# Summary quotes
str(quotes)
head(quotes)
summary(quotes)

# Summary steps
str(steps)
head(steps)
summary(steps)


# b) 
# combine the assembly data set with the bill of materials and the steps information
assBoM <- merge(assemblies,billOfMaterials, by = "tube_assembly_id")

# c)
# change data set from wide to long with the id variable tube_assembly_id
# How can we assess an assembly's complexity with respect to its specs from this data
require(reshape2)
assBoMlong <- melt(assBoM, id.vars = "tube_assembly_id")
str(assBoMlong)
summary(assBoMlong)
# High complexity, because of number of observations and only a few variables.

# d)
# back to wide format
# drop variable and cast to wide frame. Do not use the data from bcd
assBoMwide <- dcast(assBoMlong,tube_assembly_id ~ variable)

# What are the dimensions of the object?
dim(assBoMwide)

# Which columns are redundant?
str(assBoMwide)
# Do you see a problem with the component columns concerning analysis of pricing patterns?
unique(assBoMwide$quantity_1)

# f)
bomW1 <- dcast(bom, tube_assembly_id~component_id_1,value.var = "quantity_1",fill=0)

bomW8 <- dcast(bom, tube_assembly_id~component_id_8,value.var = "quantity_1",fill=0)

