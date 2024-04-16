#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --time=4:00:00
#SBATCH --ntasks=32
#SBATCH --mem=200gb
#SBATCH --tmp=252gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=goul0109@umn.edu

# for optimization: 
#/home/umii/goul0109/bin/dool --time --cpu --proc --mem --page --disk --top-cpu --top-io --top-mem --noheaders --nocolor --output dool_archaea.txt 15 > /dev/null &
/home/umii/goul0109/bin/dool --time --cpu --proc --mem --page --disk --noheaders --nocolor --output dool_archaea.txt 15 > /dev/null &

#module load parallel
#module load zlib
#PATH=$PATH:/home/umii/goul0109/kma
#source /panfs/roc/msisoft/anaconda/python3-2020.07-mamba/etc/profile.d/conda.sh
#conda activate /home/umii/goul0109/miniconda3/envs/ete3

# Phage
for i in *-cut_R1_001.fastq.gz; do echo "/home/umii/goul0109/kma/kma -ipe $i ${i//R1/R2}  -o ${i//-cut_R1_001.fastq.gz/_KMA_OUTPUT_Archaea} -t_db /home/umii/goul0109/biobakery_workflows_databases/RefSeqLoci/refseqArchaea -t 32 -1t1 -mem_mode -and -apm f -ef" >> MGArchaea.cmd; done

chmod +x MGArchaea.cmd
./MGArchaea.cmd

module load R
Rscript dool_report.R dool_archaea.txt