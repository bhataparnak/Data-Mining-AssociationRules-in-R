library(readxl)
library(dplyr)
library(tm)
library(tidyverse)
library(lubridate)
library(plyr)

online_retail <- read_excel("F:/UTA/Courses/Assignments/Data Mining/Project3/online-retail/online-retail.xlsx")
online_retail <- online_retail[complete.cases(online_retail), ]
data <- data.frame(online_retail)
data <- data %>% filter(!grepl("^C", data$InvoiceNo))
stopwords <- c("WRONG","wrong","LOST","lost", "CRUSHED","crushed", "SMASHED","smashed", "DAMAGED","damaged","FOUND",
               "found", "THROWN","thrown","MISSING","missing", "AWAY","away", "\\?", 
               "CHECK","check", "POSTAGE","postage","MANUAL","manual", 
               "CHARGES","charges", "AMAZON","amazon", "FEE","fee","FAULT","fault", 
               "SALES","sales", "ADJUST","adjust","COUNTED","counted", "LABEL","label", "INCORRECT", "incorrect",
               "SOLD","sold", "BROKEN","broken", "BARCODE","barcode", "CRACKED","cracked", "RETURNED","returned" 
               ,"MAILOUT", "mailout","DELIVERY","delivery", "MIX UP","mix up", "MOULDY", "mouldy",
               "PUT ASIDE","put aside", "ERROR","error", "DESTROYED","destroyed", "RUSTY","rusty")
new_data<- removeWords(data$Description, stopwords)
new_data<- data.frame(new_data)

colnames(new_data)=c("Description")
new_data<- cbind(data, new_data)
new_data[3] <- list(NULL)
new_data$Description[new_data$Description==""]<-NA
sum(is.na(new_data))
new_data <- droplevels(na.omit(new_data))

new_data %>% mutate(Description = as.factor(Description))
new_data %>% mutate(Country = as.factor(Country))
new_data$Date <- as.Date(new_data$InvoiceDate)
change_time<- format(new_data$InvoiceDate,"%H:%M:%S")
InvoiceNo <- as.numeric(as.character(new_data$InvoiceNo))
cbind(new_data,change_time)
cbind(new_data,InvoiceNo)
glimpse(new_data)
Txs <- ddply(new_data,c("InvoiceNo","Date"),function(new_data)paste(new_data$Description,
                                            collapse = ","))

Txs$InvoiceNo<- NULL
Txs$Date<- NULL

write.csv(Txs,"F:/UTA/Courses/Assignments/Data Mining/Project3/basket.csv", quote = FALSE, row.names = FALSE)