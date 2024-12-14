#Download the Prokka software ni our conda environment
conda install -c conda - forge -c bioconda -c defaults prokka

#Annotate all the FASTA files. Substitute the fasta folder path
for file in fastafolderpath/*. fna ; do tag =${ file %. fna }; prokka -- prefix " $tag " -- locustag " $tag" -- genus Pseudomonas -- species putida -- strain " $tag " -- outdir ../Prokka_gff3 /20241113 _" $tag " _prokka -- force " $file "; done
