#!/bin/bash -l
#SBATCH --time=24:00:00
#SBATCH --ntasks=128
#SBATCH --mem=1995g
#SBATCH --tmp=380g
#SBATCH -A umii
#SBATCH --mail-type=ALL
#SBATCH --mail-user=goul0109@umn.edu

cd /DIRECTORY/WITH/FASTQS.GZ/

# for optimization: 
/home/umii/goul0109/bin/dool --time --cpu --proc --mem --page --disk --top-cpu --top-io --top-mem --noheaders --nocolor --output dool_mapping.txt 15 > /dev/null &



# this can run at the same time as contig annotation after assembly
# contig mapping
# index
/home/umii/goul0109/kma/kma index -i final.contigs.fa -o contig_index

# kma
cd /DIRECTORY/WITH/FASTQS.GZ/
module load parallel
module load zlib
PATH=$PATH:/home/umii/goul0109/kma

for i in *-cut_R1_001.fastq.gz; do echo "/home/umii/goul0109/kma/kma -ipe $i ${i//R1/R2}  -o ${i//-cut_R1_001.fastq.gz/_KMA_OUTPUT} -t_db 02_ASSEMBLY/contig_index -t 32 -1t1 -mem_mode -and -apm f -ef" >> MGContigMap.cmd; done

chmod +x MGContigMap.cmd
./MGContigMap.cmd