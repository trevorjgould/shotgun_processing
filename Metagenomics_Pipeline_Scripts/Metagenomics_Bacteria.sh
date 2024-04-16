#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --time=4:00:00
#SBATCH --ntasks=32
#SBATCH --mem-per-cpu=40gb
#SBATCH --tmp=252gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=goul0109@umn.edu

cd /DIRECTORY/WITH/FASTQS.GZ/

# for optimization: 
/home/umii/goul0109/bin/dool --time --cpu --proc --mem --page --disk --noheaders --nocolor --output dool_bacteria.txt 15 > /dev/null &

#module load parallel
module load zlib
#PATH=$PATH:/home/umii/goul0109/CCMetagen
PATH=$PATH:/home/umii/goul0109/kma
#source /panfs/roc/msisoft/anaconda/python3-2020.07-mamba/etc/profile.d/conda.sh
#conda activate /home/umii/goul0109/miniconda3/envs/ete3

# Phage
for i in *-cut_R1_001.fastq.gz; do echo "/home/umii/goul0109/kma/kma -ipe $i ${i//R1/R2}  -o ${i//-cut_R1_001.fastq.gz/_KMA_OUTPUT_Bacteria} -t_db /home/umii/goul0109/biobakery_workflows_databases/RefSeqLoci/refseqBacteria -t 32 -1t1 -mem_mode -and -apm f -ef" >> MGBacteria.cmd; done

chmod +x MGBacteria.cmd
./MGBacteria.cmd

module load R
Rscript dool_report.R dool_bacteria.txt