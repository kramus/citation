##Reformat data to excel sheet

getwd()
setwd("C:\\Users\\mmachin\\Desktop")
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

