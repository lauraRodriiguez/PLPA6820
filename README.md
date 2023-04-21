# PLPA6820
class : Principles and techniques of reproducible science

# Fungal-Amplicon-Sequencing

Hello, here we work with peanut soil obtained from the Wiregrass Research and Extension Center, for shorten WREC, located at Headland, Alabama. This soil was collected in June 2021. With the objective of observing changes in microbial communities under different water treatments for nine weeks in a control environment (growth chamber) samples were sequences at the end of 2021 and early 2022. This pipeline is focus on fungi but does not diverge as much, if you want to try bacterial sequences. Anyhow, in here we will use [Metadata](https://github.com/lauraRodriiguez/PLPA6820/blob/main/phyloseq_input/metadata_libr.prepall02.01.22.csv), [OTUs](https://github.com/lauraRodriiguez/PLPA6820/blob/main/phyloseq_input/otu_table_ITS_UNOISE_R1.csv), [Fasta](https://github.com/lauraRodriiguez/PLPA6820/blob/main/phyloseq_input/otus_R1.fasta), [Taxonomy](https://github.com/lauraRodriiguez/PLPA6820/blob/main/phyloseq_input/taxfungi_R1_UNITE.csv). Good Luck!

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
- Load packages, dependencies and palettes
- Input metadata, OTUs, taxonomy, and fasta
- Filter the "unidentified" form your taxonomy
- Decontaminate data
- Sanity check, making sure all the taxonomy is fungi
- Filter and discard all samples with less than 5000 reads
- Rarefaction analysis
- Normalize the data
- Beta diversity
- Relative abundance *Aspergillus flavus*
- Prevalent fungi in the soils
- Differential abundance analysis
- Core microbiome
