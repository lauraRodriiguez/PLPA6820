
#Introduction to visualization in R.
#Laura Rodriguez

MycotoxinData <- read.csv("/Users/lau/Desktop/PLPA6820/2023.02.26Gittor/MycotoxinData.csv", na.strings = "na")

library("ggplot2")
library(tidyverse)
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

#Question 2
ggplot(MycotoxinData, aes(x = Treatment , y = DON, color = Cultivar ))+
  geom_boxplot()+
  ylab("DON (ppm)")+
  xlab("")

#Question 3
ggplot(MycotoxinData, aes(x = Treatment , y = DON, color = Cultivar))+
  stat_summary(fun=mean, geom = "bar", position = "dodge")+
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge")+
  ylab("DON (ppm)")+
  xlab("")

#Question 4
#Add points to the foreground of the boxplot and bar chart you made in questions 2 and 3 that show the distribution of 
#points over the boxplots or bars. Set the shape = 21 and outline color black (hint: use jitter_dodge). 
ggplot(MycotoxinData, aes(x = Treatment , y = DON, fill = Cultivar))+
  stat_summary(fun=mean, geom = "bar", position = "dodge")+
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge")+
  ylab("DON (ppm)")+
  xlab("")+
  geom_point(position = position_jitterdodge(),shape = 21, color = "black")

#Question 5
ggplot(MycotoxinData, aes(x = Treatment , y = DON, fill = Cultivar))+
  stat_summary(fun=mean, geom = "bar", position = "dodge")+
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge")+
  ylab("DON (ppm)")+
  xlab("")+
  geom_point(position = position_jitterdodge(),shape = 21, color = "black")+
  scale_fill_manual(values = cbbPalette)

#Question 6
ggplot(MycotoxinData, aes(x = Treatment , y = DON, fill = Cultivar))+
  stat_summary(fun=mean, geom = "bar", position = "dodge")+
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge")+
  ylab("DON (ppm)")+
  xlab("")+
  geom_point(position = position_jitterdodge(),shape = 21, color = "black")+
  scale_fill_manual(values = cbbPalette)+
  facet_wrap(~Cultivar)

#Question 7
#running other themes they didn't find base_line, don't need it but yeah
ggplot(MycotoxinData, aes(x = Treatment , y = DON, fill = Cultivar))+
  stat_summary(fun=mean, geom = "bar", position = "dodge")+
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge")+
  ylab("DON (ppm)")+
  xlab("")+
  geom_point(position = position_jitterdodge(),shape = 21, color = "black")+
  scale_fill_manual(values = cbbPalette)+
  facet_wrap(~Cultivar)+
  theme_void(
    base_size = 11,
    base_family = "",
    base_line_size = base_size/22,
    base_rect_size = base_size/22
  )


#Question 8
ggplot(MycotoxinData, aes(x = Treatment , y = DON, fill = Cultivar))+
  stat_summary(fun=mean, geom = "bar", position = "dodge")+
  stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge")+
  ylab("DON (ppm)")+
  xlab("")+
  geom_point(position = position_jitterdodge(),shape = 21, color = "black")+
  scale_fill_manual(values = cbbPalette)+
  facet_wrap(~Cultivar)+
  theme_bw()+
  geom_jitter(alpha = 0.4)


#Question 10
q <- ggplot(MycotoxinData, aes(x = Treatment , y = DON, fill = Cultivar))+
  stat_summary(fun=mean, geom = "bar")+
  stat_summary(fun.data = mean_se, geom = "errorbar")+
  ylab("DON (ppm)")+
  xlab("")+
  geom_point(position = position_jitterdodge(),shape = 25, color = "black", alpha = 0.5)+
  scale_fill_manual(values = c("#F0E442","#009E73"))+
  facet_wrap(~Cultivar)+
  theme_classic()
  q + theme(axis.text.x = element_text(angle = 60, hjust = 1))
  #coord_flip()
#what geom_jitter does is add dots, basically same as geom_point so having them both has creating a circles and shape were created with the geom_point.
  #geom_jitter(alpha = 0.5)



