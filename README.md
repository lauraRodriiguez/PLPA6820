# PLPA6820
class : Principles and techniques of reproducible science

# Fungal-Amplicon-Sequencing

Hello, here we work with peanut soil obtained from the Wiregrass Research and Extension Center, for shorten WREC, located at Headland, Alabama. This soil was collected in June 2021. With the objective of observing changes in microbial communities under different water treatments for nine weeks in a control environment (growth chamber) samples were sequences at the end of 2021 and early 2022. This pipeline is focus on fungi but does not diverge as much, if you want to try bacterial sequences. 

# Pipeline

For these first few steps we used the *Albama Super Computer* proved by Auburn University

## [Striping primers](https://github.com/lauraRodriiguez/PLPA6820/blob/main/Scripts/STRIPPING%20PRIMERS1.rtf)

Removal of primer form your sequences

## [Get stats](https://github.com/lauraRodriiguez/PLPA6820/blob/main/Scripts/Stats2.rtf)

Filtering parameters

## [Filtering and trimming](https://github.com/lauraRodriiguez/PLPA6820/blob/main/Scripts/FILTERING.TRIMMING3.rtf)

We used VSEARCH,the trimming and filtering of the sequences happened here based on the results we got in stats. In this step you can also run FASTQ to see the quality of your data

## [Dereplication, De-noising, Clustering](https://github.com/lauraRodriiguez/PLPA6820/blob/main/Scripts/DEREPLICATION%2C%20CLUSTERING.CHIMERAREMOVAL4.rtf)


De-noising: zOTUs
Clustering: OTUs based on traditional 97% identity

## [Mapping](https://github.com/lauraRodriiguez/PLPA6820/blob/main/Scripts/MAPPING5.rtf)
OTU table


## [Taxonomy](https://github.com/lauraRodriiguez/PLPA6820/blob/main/Scripts/TAXONOMY6.rtf)
This will create the taxonomy to all filtered and trimmed sequences

## [R analysis](https://github.com/lauraRodriiguez/PLPA6820/blob/main/WRECpeanutSoilFungi.Rmd)
More downstream analysis and for visualization. R packages mostly used were "phyloseq", "tyRa", "Biostrings", "ggplot2", "dplyr", "vegan".
-jk
-jk
