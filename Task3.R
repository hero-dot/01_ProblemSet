
# TODO
# a)
# Describe the structure of the response object. Explain dimensions and nesting of the elements
 
# b) 
# Use apply to extract author, title, publishing date, and rating of each book in the response
 
# c)
# Sort the list by date and title
# getBookList(numerOfItems)

# d) 
# Function returns value, where book is available and what's its price.
# Change the API call
# getBookSalesInfo(response)


install.packages("RCurl")
library(RCurl)
library(RJSONIO)
URL = "https://www.googleapis.com/books/v1/volumes?q=george+r+r+martin&maxResults=40"
response_parsed <- fromJSON(getURL(URL, ssl.verifyhost = 0L, ssl.verifypeer = 0L))
