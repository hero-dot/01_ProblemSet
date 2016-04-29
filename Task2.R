# TODO
# a)

# provide an executive summary of the data set
# Infrastructure for reading in the files
assemblies <- read.csv("assemblies.csv",header = T)
billOfMaterials <- read.csv("bill_of_materials.csv", header = T)
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
str(billOfMaterials)
head(billOfMaterials)
summary(billOfMaterials)

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
assemBillofmaterials <- merge(assemblies,billOfMaterials, by = "tube_assembly_id")

# c)
# change data set from wide to long with the id variable tube_assembly_id
# How can we assess an assembly's complexity with respect to its specs from this data

# d)
# back to wide format
# drop variable and cast to wide frame. Do not use the data from bcd
# What are the dimensions of the object?
# Which columns are redundant?
# Do you see a problem with the component columns concerning analysis of pricing patterns?


# f)
# 

