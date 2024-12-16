#In order to save all the bioremediation-related gene counts
#we need to save all the counts in one excel. 
#This excel will contain every hit obtained in the BLAST search in one tab
#AND a table with the genes as columns and the strains as rows, where every hit will be counted


#First we will load the excel file
#change path
file_path = "/real/path/Gene_counts . xlsx "

#Replace withthe actual sheet name
blast_hits = pd.read_excel(file_path,sheet_name =" Blast Hits ") 
gene_counts = pd.read_excel(file_path,sheet_name=" Gene Counts ")

#In the table of the first tab, where we have all our hits,
#we will name the first column as strain (where the strain names are shown)
#And the second column will be called gene (where the hit gene will be saved)
gene_occurrences = blast_hits.groupby([’strain’, ’gene’]).size().unstack(fill_value =0)

#Creating a new DataFrame to hold the counts
gene_counts_df = pd.DataFrame(index = gene_occurrences.index)

#We fill in the gene names from the columns of gene_occurrences
for gene in gene_occurrences.columns:
    gene_counts_df[gene] = gene_occurrences[gene].fillna(0)

#Now we reset the index to have 'strain' as a column
gene_counts_df.reset_index(inplace=True)

#Saving the updated gene_counts_df to the excel file
with pd.ExcelWriter(file_path, engine="openpyxl", mode="a", if_sheet_exists="replace") as writer:
    gene_counts_df.to_excel(writer, sheet_name="Gene Counts", index=False)