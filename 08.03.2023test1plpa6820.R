

#March 8, 2023 test1 PLPA6820

library(ggplot2)
library(tidyr)
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")


#Question 4
#Explain the following concepts of ggplot and give examples of each concept using code and 
#figures generated with ggplot using the data of your choosing. (layering, scales, themes, facet)
vertical <- ggplot(ToothGrowth, aes(x = dose , y = len, fill = supp))+
  stat_summary(fun=mean, geom = "bar")+
  stat_summary(fun.data = mean_se, geom = "errorbar")+
  ylab("length odontoblasts")+
  xlab("dose")+
  geom_point(position = position_jitterdodge(), shape = 0, alpha = 0.5)+
  scale_fill_manual(values = c("#E69F00","#0072B2"))+
  facet_wrap(~supp)+
  theme_light()
vertical + theme(axis.text.x = element_text(angle = 60, hjust = 1))

#Question 5
#Explain the differences and similarities between a vector, matrix, and dataframe.
#Demonstrate you know how to subset a dataframe in two ways using dataset‘ToothGrowth’ with the prompts below:  
  #1Subset ToothGrowth to include rows such that supp is equal to VC
  #2Subset ToothGrowth to include rows such that supp is equal to VC and dose is equal to 0.5
  #3Subset ToothGrowth to include the values of len such that supp is equal to VC and dose is equal to 0.5

ToothGrowth
subse1<- ToothGrowth[ which(ToothGrowth$supp=='VC'), ]
subse2 <-ToothGrowth[ which(ToothGrowth$supp=='VC' & ToothGrowth$dose == 0.5), ]
subse3 <- subse2[1]

