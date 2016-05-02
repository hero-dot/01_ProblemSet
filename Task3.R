install.packages("RCurl")
library(RCurl)
library(RJSONIO)
library(dplyr)
URL = "https://www.googleapis.com/books/v1/volumes?q=george+r+r+martin&maxResults=40"
response_parsed <- fromJSON(getURL(URL, ssl.verifyhost = 0L, ssl.verifypeer = 0L))

# TODO
# a)
# Describe the structure of the response object. Explain dimensions and nesting of the elements
summary(response_parsed)
str(response_parsed) 

response_parsed[3]

response_parsed$items[[1]]

summary(response_parsed$items)
str(response_parsed$items[[1]])
summary(response_parsed$items[[1]])
summary(response_parsed$items[[1]]$volumeInfo)
response_parsed$items[[1]]$volumeInfo[c("title","authors","publishedDate","ratingsCount")]


# b) 
# Use apply to extract author, title, publishing date, and rating of each book in the response
# for every entry in response_parsed$items get the data above
dim(response_parsed$items[[1]]$volumeInfo)
dim(response_parsed$items[[1]]$volumeInfo$title)
dim(response_parsed$items[[1]]$volumeInfo$authors)

select(response_parsed$items[[1]],title,authors)
bookData <- sapply(response_parsed$items,unlist)

bookData[1]

length(response_parsed$items)

str(bookData)
 
# c)
# Sort the list by date and title
# getBookList(numberOfItems)

# d) 
# Function returns value, where book is available and what's its price.
# Change the API call
# getBookSalesInfo(response)
