#This script has to be run inside a folder that contains the .gff files and their corresponding .fasta sequences.
#The .gff and .fasta files must have the same name, except for the extension. 
#A .gff3 file will be created for each file. 
for gffile in *.gff
do
  base_name="${gffile%.gff}"
  fastafile="${base_name}.fna"
  newfile="${base_name}.gff3"
  if [[ -f "$fastafile" ]]
  then
    cat "$gffile" > "$newfile"
    echo '##FASTA' >> "$newfile"
    cat "$fastafile" >> "$newfile"
    echo "Processed: $base_name"
  else
    echo "Warning: FASTA file $fastafile not found for $gffile"
  fi
done
