
#Function&Iterations
#2023.03.30

library(tidyverse)
install.packages("drc")
library(drc)

(5*(50 - 32)/9)

function.name <- function(x) {
  #code goes here#
  #will do some calculation and return something#
  return(#return our output#)
}

f_C <- function(x) {
  C <- (5*(fahrenheit - 32)/9)
  return(C)
}
{.   } 
 
F_C 

F_C <- function(x) {
  C <- (5*(fahrenheit -32)/9)
  return(C)
}

F_C(80)

F_C <- function(C) {
  f <- ((9/5)*(C))+32
  return(f)
}
#we can do pretty much I want like loops

#for loop
for(i in 1:10){
  print(i*2)
}

for(i in -100:100){
  result <- F_C(i)
  print(result)
}
#itteration

EC50 <- read.csv("/Users/lau/Desktop/PLPA6820/2023.02.26Gittor/EC50.all.csv", na.strings = "na")


#dose respose model (drm)

nm <- unique(EC50.data$is)

EC50.114 <- NULL

########I am missing something here


EC50 <- ED(isolate1, respLev = c(50), type = "relative",
           interval = "delta")[[1]]

EC50
isolate_ec_i <- data.frame(nm[i], EC50)
colnames(isolates_ec_i)<- c("isolate", "EC50")
  #rbind means adding a new row
EC50.114 <- rbind.data.frame (EC50.114,isolate_ec_i)
}
EC50.114


ec50 <- EC50.data %>%
  #group_by we want to ge tthe model for each isolate
  group_by(is) %>%
  nest() %>%
  #model the relgrowth by concentration
  mutate(ll.4.mod = map(data, ~drm(.$relgrowth ~ .$conc,
                                   fct = LL.4()))) %>%
  mutate(ec50 = map(ll.4.mod, ~ ED(., respLev = 50)[1])) %>%
  unnest(ec50)%>%
  ggplot(aes(ec50))

#we want to ge tthe model for each isolate

ec50results$data[1]
ec50results$ll.4.mod[1]











