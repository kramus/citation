getwd()
setwd("C:\\Users\\mmachin\\Desktop")
list.dirs()
list.files()
##Read PDF
system(paste('"C:\\Users\\mmachin\\Desktop\\pdftotext.exe"', 
             '"C:\\Users\\mmachin\\Desktop\\ObservatorioPRColBiblio.pdf"'), wait = FALSE)

install.packages("tm")
library(tm)
my_path <- 'C:\\Users\\mmachin\\Desktop\\ObservatorioPRColBiblio.txt\\'
Corpus(DirSource(my_path), readerControl = list(reader=readPDF)) 




#########READ HTML
install.packages("httr")
library(httr)
install.packages("XML")
library(XML)
fileurl <- "http://jtoro.uprrp.edu/Publicaciones.htm"
html <- htmlTreeParse(fileurl, useInternalNodes = TRUE)
xpathSApply(html, "//title", xmlValue)
html

#Otra forma
html2 = GET(fileurl)
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2,asText=TRUE) #this parsedHtml looks the same as with XML approach
xpathSApply(parsedHtml, "//title", xmlValue)

rootnode <- xmlRoot(parsedHtml)
rootNode <- rootnode


xmlName(rootNode) #te da el nombre del root
names(rootNode) #all the nested elements within the main root
rootNode[[1]] #accesar al primer elemento
rootNode[[1]][[2]] #accesar al primer elemento del primer elemento
xmlSapply(rootNode,xmlValue) #extraer programaticamente partes del file. Hace un loot a traves 
#de todo los elementos dentro de rootNode y extrae los xmlvalue
##xpath es otro lenguaje
#/node top level node
#//node Node at any level
xpathSApply(rootNode, "//name",xmlValue) #te da los valores del node correspondiente a name
xpathSApply(rootNode, "//price",xmlValue) #lo mismo pero de price



###############################
line <- readLines("alfonso.txt")
line


#####File public

pub <- readLines("public.txt")
pub1 <- grep("^([0-9][0-9][.])", pub, value = T)
pub1 <- gsub("^([0-9][0-9][.])", "", gsub("^([0-9][0-9][0-9][.])", "", pub))
pub1

#In order to trim you need stringr package
install.packages("stringr")
library(stringr)
pub2 <- str_trim(pub1)
pub2
#To export to csv
write.csv(pub2, "pub2.csv", row.names = FALSE)

  
  
  