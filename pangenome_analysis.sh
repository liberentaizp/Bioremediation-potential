#This script creates two separate zip files for accessory and core genes from a pangenome analysis

#create a conda environment and download roary
conda create -n roary
conda activate roary
conda install bioconda / label / cf201901 :: roary

#We will run the following code while in the folder containing the .gff3 files
roary -e -z -r -mafft -p 10 *. gff3
  #-e is for creating a multifasta alignment of core genes using PRANK
  #-z s for saving intermediate files
  #-r is for creating R plots
  #-mafft -p 10 is for generating a core alignment using 10 threads

#Now, to obtain our accessory genes we must first **go to a folder that contains the .gff files**
query_pan_genome -a complement -o accessory_genes .txt *. gff

#We will only take the first FASTA headers for each gene
cat accessory_genes .txt | awk ’{sub (/.*:/ , ""); split ($0 , figs , "\t"); gsub (/^+| +$/, "", figs [1]) ; print ">" figs [1]} ’ > accessory_fasta_headers

#Now we will retrieve the fasta sequences for all the accessory genes
#First we will create a file that contains all the fasta sequences from all the genomes' proteins
cat *. faa > allfassta .faa
#Now for retrieving the accessory sequences
awk ’NR == FNR {arr[$0 ]; next } /^ >/ { in_section = ($0 in arr ) && ! printed [$0 ]; if ( in_section ) { print ; printed [$0] = 1}} !/^ >/ && in_section ’ accessory_fasta_headers allfasta .faa > accessory_proteins .faa

#We will zip the file to upload it to eggnog-mapper
gzip -k accessory_proteins .faa

#Now for the core genes, we will obtain the core fasta headers with the following lines, and we'll repeat the process exactly as with the accessory genes. 
grep -E "^>" allfasta .faa > allfasta_headers
grep -v -f accessory_fasta_headers allfasta_headers > core_fasta_headers
