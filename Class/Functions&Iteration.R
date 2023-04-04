

Bull.rich <- read.csv("/Users/lau/Desktop/PLPA6820/2023.02.26Gittor/Bull_richness.csv", na.strings = "NA")

#/Users/lau/Desktop/PLPA6820/2023.02.26Gittor/Bull_richness.csv 

library(tidyverse)
library(lme4)
library(emmeans)
library(multcomp)

data("mcars")

ggplot(mtcars, aes(x = wt, y = mpg))+
  geom_smooth(method = lm,)+
  geom_point()

lm1 <- lm(mpg~wt, data = mtcars)
#to check if those estimates are significant
summary(lm1)

#overal p value says is significant: p-value: 1.294e-10 we can reject the hypothesis taht do not have a realtionship from 2 variables 

#higher the f-value the more significant the interaction it is.array(
#F statistic: 
  
#Can do a coelation test:defaul pearson correlation
cor.test(mtcars$wt, mtcars$mpg)
#very good results
cor 
-0.8676594 

#how do we evaluate the residuals in this case?
#would the residuals be normally distributed?
#this is not completly linear but close
#lets look at residuals

ggplot(lm1, aes(y = .resid, x = .fitted))+
  geom_point()+
  #to add a line
  geom_hline(yintercept = 0)

plot(lm1)
#Hit <Return> to see next plot: in the console and you will see different plots


Bull.rich %>%
  filter(GrowthStage == "V8" & Treatment == "Conv.") %>%
  ggplot(aes(x = Fungicide, y = richness)) +
  geom_boxplot()

Bull.rich.sub <- Bull.rich %>%
  filter(GrowthStage == "V8" & Treatment == "Conv.")

t.test(richness~Fungicide, data =Bull.rich.sub, var.equal = TRUE)
#the data come cform the linear model

summary(lm(richness~Fungicide, data = Bull.rich.sub))
anova(lm(richness~Fungicide, data = Bull.rich.sub))

Bull.rich.sub2 <- Bull.rich %>%
  filter(Fungicide == "C" & Treatment == "Conv." & Crop == "Corn")

ggplot(Bull.rich.sub2, aes(x = GrowthStage, y = richness))+
  geom_boxplot()

lm.growth <- lm(richness ~ GrowthStage, data = Bull.rich.sub2)
summary(lm.growth)

anova(lm.growth)
#BY DEFAULT IT DOES THE TUKEY
#install.packages("multcompView")
library(multcompView)
lsmean <- emmeans(lm.growth, ~GrowthStage)
results <- cld(lsmeans, alpha = 0.05, reversed = TRUE, details = TRUE)
  #cld (compat letter display)
results


### Interactions

Bull.rich.sub3 <- Bull.rich %>%
  filter(Treatment == "Conv." & Crop == "Corn")

lm.inter <- lm(richness~ GrowthStage + Fungicide + GrowthStage:Fungicide,
               data = Bull.rich.sub3)
#test is fungicide is depenent in growth stage

lm.inter <- lm(richness ~ GrowthStage*Fungicide, data = Bull.rich.sub3)
summary(lm.inter)

#overal our value is significant:p-value: 1.144e-11

ggplot(Bull.rich.sub3, aes(x= GrowthStage, y = richness, fill = Fungicide))+
  geom_boxplot()
anova(lm.inter)


#fungi within growth stage
#emmeans estimated marginal means (basically run the stuff so you dont have to do it separated) will compare to the first observation in the chart.

#grapth the stuff first to make sure that they look similar
lsmeans <- emmeans(lm.inter, ~Fungicide|GrowthStage)
results <- cld(lsmeans, alpha = 0.05, reversed = TRUE, details = TRUE)
results

#using instead of lm we are going to use lmer

lm.inter <- lm(richness ~ GrowthStage*Fungicide, data = Bull.rich.sub3)
#linear model mix effect model
#add random effect using +
lme1 <- lmer(richness ~ GrowthStage*Fungicide + (1|Rep), data = Bull.rich.sub3)

#lm fix effect moddel
#example : ~ GrowthStage*Fungicide
#lmer need to have random effect model
#example : + (1|Rep),
# we are more confident in you data bc we included a random factor


summary(lm.inter)
summary(lme1)
  
  
  
  #how would I do if I would like to compare all my growth stages agains not the first one shown in the chrt but the one at the end,
#how would I do that.

