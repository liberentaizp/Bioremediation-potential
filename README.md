# Impact of genetic features of *Pseudomonas putida* in its bioremediation potential
This repository collects the scripts and pipelines used for the determination of the features that determine *Pseudomonas putida*'s bioremediation potential.
## Requirements
- Prokka
- Roary
- chewBBACA
- local BLASTn
## Phylogenetic, functional and pan genomic analysis
The genomic analysis pipeline has been described in the Pangenomic__phylogenetic_and_functional_analysis_pipeline.pdf document. It contains python and bash code. 
## Bioremediation potential
The determination of bioremediation potential of each strain, understood as the sum of the presence of different bioremediation-related genes, is resumed in the Bioremediation_potential_determination_pipeline.pdf document. 
This pipeline describes the steps taken in the assignment of a bioremediation potential value to each strain.
Apart from bioremediation-related genes the pipeline can also be modified to retrieve other types of genes in different genomes, if the genomic sequences of said genes are available. 
