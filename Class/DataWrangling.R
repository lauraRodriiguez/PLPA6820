


library(ggplot2)
library(dplyr)
library(tidyverse)
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")



microbiome.fungi <- read.csv("/Users/lau/Desktop/PLPA6820/2023.02.26Gittor/Microbiome.csv", na.strings = "na")
#str(microbiome.fungi)

microbiome.fungi2 <- select(microbiome.fungi, 
                            OTU, 
                            SampleID, 
                            Abundance, 
                            Crop, 
                            Compartment, 
                            DateSampled, 
                            GrowthStage, 
                            Treatment, 
                            Rep, 
                            Fungicide, 
                            Kingdom, 
                            Phylum, 
                            Class, 
                            Order, 
                            Family, 
                            Genus, 
                            Species, 
                            Taxonomy)
#Q2. Calculate the mean percent relative abundance (*100) across all OTUs by compartment using the pipe operator.

#rewrites but only with the new percent column
microbiome.fungi2 %>%
  group_by(OTU, Compartment) %>%
  mutate(Percent = Abundance*100) %>%
  summarize(Mean = mean(Percent))%>%
  head()
  

  
#Q3. Calculate the mean percent relative abundance across all OTUs by compartment and fungicide using the pipe operator. 
#I suppose we filter or subset and then do the mutate.Since above we did the mean percent relative abundance we only have to subset only compartment and fungicide.
microbiome.fungi2 %>%
  group_by(OTU, Compartment, Fungicide) %>%
  mutate(Percent = Abundance*100)%>%
  summarize(Mean = mean(Percent))%>%
  head()


#Q4. Restrict the previous analysis to just the fungal class Dothideomycetes.

microbiome.fungi2 %>%
  filter(Class == "Dothideomycetes") %>%
  group_by(OTU, Compartment, Fungicide, Class) %>%
  mutate(Percent = Abundance*100)%>%
  summarize(Mean = mean(Percent))%>%
  head()

   
#Q5. Now do the same analysis but for Orders in the genus Dothideomycetes.
microbiome.fungi2 %>%
  filter(Class == "Dothideomycetes") %>%
  group_by(OTU, Compartment, Fungicide, Order) %>%
  mutate(Percent = Abundance*100)%>%
  summarize(Mean = mean(Percent))%>%
  head()

#Q6. Calculate the standard error for each mean in Q5.
#now the question is can i do this with out having to do the abundance?
microbiome.fungi2 %>%
  filter(Order == "Pleosporales") %>%
  group_by(OTU, Compartment, Fungicide, Order) %>%
  mutate(Percent = Abundance*100) %>%  #do i have to do this ??
  summarise(Mean = mean(Percent), 
            n = n(), 
            sd.dev = sd(Percent)) %>%
  mutate(std.err = sd.dev/sqrt(n))


#Q7. Select the columns Order, Compartment, Fungicide and Mean from the output 
# of Q6 and Pivot the dataset to wide format so you have Compartment as column headers
microbiome.fungi2 %>%
  filter(Class == "Dothideomycetes") %>%
  group_by(Order, Compartment, Fungicide) %>%
  mutate(Percent = Abundance*100) %>%  #do i have to do this ??
  summarise(Mean = mean(Percent)) %>%
  pivot_wider(names_from = Compartment, values_from = Mean) %>%
  head()


#we dont have mean bc the pivot wider is not called mean is called root/leaf
#Q8. Recreate this plot using your dataset in Q7. 
microbiome.fungi2 %>%
  filter(Class == "Dothideomycetes") %>%
  group_by(Order, Compartment, Fungicide) %>%
  mutate(Percent = Abundance*100) %>%  #do i have to do this ??
  summarise(Mean = mean(Percent)) %>%
  pivot_wider(names_from = Compartment, values_from = Mean) %>%
  #mutate(Order2 = fct_reorder(Order, desc(-Leaf))) %>%
  ggplot(aes(x = Leaf , y = Order, fill = Fungicide))+
  geom_bar(stat = "identity", position = position_dodge())+
 # stat_summary(fun=mean, geom = "bar", position = "dodge")+
  #stat_summary(fun.data = mean_se, geom = "errorbar", position = "dodge")+
  ylab("Mean % Relative Abundance")+
  xlab("")
  #geom_point(position = position_jitterdodge(),shape = 21, color = "black")+
  #scale_fill_manual(values = cbbPalette)+
  #facet_wrap(~Fungicide)








