import pandas as pd

#Load excel file with genes and their sequences
#Change path
excel_path = "/change/path/realdoc.xlsx"  
df = pd.read_excel(excel_path)

#Specify column names in the file
gene_name_col = "gene name"
description_col = "gene description"
species_col = "species"
sequence_col = "nt"

#Open a new file to write the multifasta
#change path
with open("/cnew/path/genes_multifasta.fasta", "w") as fasta_file:
    for index, row in df.iterrows():
        gene_name = row[gene_name_col]
        description = row[description_col]
        species = row[species_col]
        sequence = row[sequence_col]

        #We will remove whitespaces and split the lines into lines of 60 characters
        sequence = str(row[sequence_col]).replace(" ", "").replace("\n", "")
        sequence_lines = [sequence[i:i+60] for i in range(0, len(sequence), 60)]

        #We finally write the fasta header and sequence lines
        fasta_file.write(f">{gene_name} | {description} | {species}\n")
        fasta_file.write("\n".join(sequence_lines) + "\n")