#create a new conda environment and download blastn
conda install -c bioconda blast

#We will set up each genome as a BLAST database to compare our genes against each genome
#change path
for genome in *. fasta ; do makeblastdb -in " $genome " -dbtype nucl -out "../Databases /${ genome %. fasta }_db"; done

#With our multifasta of bioremediation related genes, we will search for our gene sequences in all genomes
for db in *_db; do blastn -query genes . fasta -db " $db" -outfmt "7 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore " -out "../ BLAST_hits /${db} _blast_results .txt"; done

#Finally, we will order the results
cat genome1_blast_results .txt | grep -vE "^#" > genome1_blast_results .txt