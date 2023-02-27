
#PLPA6820
#Introduction to R programming
#assignment:
#4 question
z <- c(1:200)
mean(z)
sd(z)
vec <- c(z > 1 | z<1)

df = data.frame(z,vec)

colnames(df)<- c("z","zlog")
df$zsquared <- z^2

subset (df, zsquared > 10 | zsquared < 100)

#5
#install.packages("ggplot2")  
library("ggplot2")
#install.packages("dplyr") 
library("dplyr")
#install.packages("purrr")
library("purrr")  
#install.packages("tidyverse")  
library("lme4")
#install.packages("Matrix") 
library("emmeans")


tipsR <- read.csv("/Users/lau/Desktop/PLPA6820/plpa6820/TipsR.csv", na.strings = ".")

print(tipsR)





