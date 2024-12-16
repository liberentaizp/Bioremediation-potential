#This script describes a cgMLST analysis performed to 59 Pseudomonas putida genomes
#We will first create a conda environment and install chewBBACA
conda deactivate #if we are in another environment
conda create -n chewBBACA
conda activate chewBBACA
conda install bioconda :: chewbbaca

#Now we will create a wgMLST schema that will define the set of loci that will be compared between different strains
chewBBACA .py CreateSchema -i ./ FASTA_files / -o wgMLST_scheme

#We will now perform the allele calling, in order to assign specific alleles to the already predefined loci
chewBBACA .py AlleleCall -i ./ FASTA_files / -g wgMLST_scheme / schema_seed / -o results32_wgMLST --cpu 10

#We will extract the paralogous genes that might confuse allele calling, as they have multiple copies in a genome
chewBBACA .py RemoveGenes -i results32_wgMLST / results_alleles .tsv -g results32_wgMLST / paralogous_counts .tsv -o results32_wgMLST / results_alleles_NoParalogs . tsv

#Finally, we will extract just the core genes to compare them between bacteria. 
chewBBACA .py ExtractCgMLST -i results32_wgMLST / results_alleles_NoParalogs .tsv -o results32_wgMLST / cgMLST

