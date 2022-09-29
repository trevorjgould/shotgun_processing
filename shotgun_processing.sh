
##############################
#data = $1
#reference = $2
#working_directory = $3
for i in *R1_001.fastq.gz; do echo "kneaddata --input $1/$i --input $1/${i//_R1_/_R2_} -db $2 --remove-intermediate-output --output $3/kneaddata_output -t 24" >> kneader.cmd; done
cd $3
chmod +x kneader.cmd

#!/bin/bash -l
#SBATCH --time=12:00:00
#SBATCH --ntasks=128
#SBATCH --mem=248g
#SBATCH --tmp=10g
#SBATCH --mail-type=ALL
#SBATCH --mail-user=goul0109@umn.edu
cd $3
singularity run -B -3 -B $2 -B $1 /home/umii/goul0109/biobakeryworkflows.sif
./kneader.cmd


# humann3 asks for cat paired reads for single input
cd PairedKnead
for i in *paired_1.fastq; do echo "cat $i ${i//paired_1/paired_2} > ${i//_paired_1/_combined}" >> catter.cmd; done
chmod +x catter.cmd


mkdir ../combined_paired
mv *combined* ../combined_paired

mkdir Humann3Output

for i in combined_paired/*.fastq; do echo "humann --input $i --output Humann3Output --threads 24" >> humann3er.cmd; done
chmod +x humann3er.cmd

for i in combined_paired/*.fastq; do echo "humann --input $i --search-mode uniref50 --output Humann3Outputuniref50 --threads 24" >> humann3er50.cmd; done
chmod +x humann3er50.cmd

#!/bin/bash -l
#SBATCH --time=48:00:00
#SBATCH --ntasks=128
#SBATCH --mem=248g
#SBATCH --tmp=10g
#SBATCH --mail-type=ALL
#SBATCH --mail-user=goul0109@umn.edu
cd /home/umii/goul0109/Prins_004/
module load parallel
singularity run -B /$3/kneaddata_output/Humann3Output/all_metaphlan_bug_list /home/umii/goul0109/biobakeryworkflows.sif
parallel --jobs 5 < humann3er.cmd

# join tables for metaphlan output
cd Humann3Output
mkdir all_metaphlan_bug_list
cp *metaphlan_bugs_list.tsv all_metaphlan_bug_list/
singularity run -B $3/kneaddata_output/Humann3Output/all_metaphlan_bug_list /home/umii/goul0109/biobakeryworkflows.sif
merge_metaphlan_tables.py *metaphlan_bugs_list.tsv > merged_abundance_table.txt

#Join the output files (gene families, coverage, and abundance) from the HUMAnN 3.0 runs from all samples into three files
mkdir Humann3Output/OUTPUT
mv *Humann3Output/*.tsv Humann3Output/OUTPUT/

humann_join_tables --input OUTPUT/ --output humann_genefamilies.tsv --file_name genefamilies
humann_join_tables --input OUTPUT/ --output humann_pathcoverage.tsv --file_name pathcoverage
humann_join_tables --input OUTPUT/ --output humann_pathabundance.tsv --file_name pathabundance

#For each command, replace $OUTPUT_DIR with the full path to the folder containing the HUMAnN 3.0 output files.
#The resulting files from these commands are named humann_genefamilies.tsv, humann_pathabundance.tsv, and humann_pathcoverage.tsv.
# https://github.com/biobakery/humann#humann_rename_table
humann_rename_table --input humann_genefamilies.tsv --output humann_genefamilies-named.tsv --names uniref90

# https://github.com/biobakery/biobakery/wiki/metaphlan3#visualize-results
grep -E "s__|clade" merged_abundance_table.txt | sed 's/^.*s__//g'\ | cut --complement -d$'\t' -f2  | sed -e 's/_R1_001_kneaddata_combined_metaphlan_bugs_list//g' > merged_abundance_table_species.txt
grep -E "g__|clade" merged_abundance_table.txt | sed 's/^.*g__//g'\ | cut --complement -d$'\t' -f2  | sed -e 's/_R1_001_kneaddata_combined_metaphlan_bugs_list//g' > merged_abundance_table_genus.txt
grep -E "f__|clade" merged_abundance_table.txt | sed 's/^.*f__//g'\ | cut --complement -d$'\t' -f2  | sed -e 's/_R1_001_kneaddata_combined_metaphlan_bugs_list//g' > merged_abundance_table_family.txt

#remove lower level taxa lines
sed -i '/s__/d' merged_abundance_table_genus.txt
sed -i '/s__/d' merged_abundance_table_family.txt
sed -i '/g__/d' merged_abundance_table_family.txt

hclust2.py -i merged_abundance_table_species.txt -o abundance_heatmap_species.png --f_dist_f braycurtis --s_dist_f braycurtis --dpi 600 --cell_aspect_ratio 0.5 -l --flabel_size 5 --slabel_size 5
hclust2.py -i merged_abundance_table_genus.txt -o abundance_heatmap_genus.png --f_dist_f braycurtis --s_dist_f braycurtis --dpi 600 --cell_aspect_ratio 0.5 -l --flabel_size 3 --slabel_size 3
hclust2.py -i merged_abundance_table_family.txt -o abundance_heatmap_family.png --f_dist_f braycurtis --s_dist_f braycurtis --dpi 600 --cell_aspect_ratio 0.5 -l --flabel_size 3 --slabel_size 3
