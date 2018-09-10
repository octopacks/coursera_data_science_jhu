library(XML)
fileurl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileurl, useInternalNodes = TRUE)
rootnode <- xmlRoot(doc)
zipcode <- xpathSApply(rootnode, "//zipcode", xmlValue)
value <- zipcode[zipcode == 21231]