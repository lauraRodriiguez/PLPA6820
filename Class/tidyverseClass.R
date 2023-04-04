 

class : tidyverse

samp_dat_fungi <- read.csv("/Users/lau/Desktop/PLPA6820/2023.02.26Gittor/Microbiome.csv", na.strings = "NA")

 #left_join sample to join two samples
#sample_n is to sample random rows. this is so we can generate the na to see how the function works
the order matters
you can tell the r that the header names are different by doing this "bu = c("OTU" = "OTU") INSTEAD OF WRITING or the other option is to go back to the csv file and amnually changing the colum heather.

inner_join
or
left_join
or 
full_join

with pivoting you can arrange the data into longer (the normal way we put our data or wider that is the wide we dont love)









