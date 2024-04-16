#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --ntasks=32
#SBATCH --mem-per-cpu=40gb
#SBATCH --tmp=252gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=goul0109@umn.edu


cd /home/umii/goul0109/Downloads/
module load parallel
module load zlib
PATH=$PATH:/home/umii/goul0109/CCMetagen
PATH=$PATH:/home/umii/goul0109/kma
source /panfs/roc/msisoft/anaconda/python3-2020.07-mamba/etc/profile.d/conda.sh
conda activate /home/umii/goul0109/miniconda3/envs/ete3

# kma index -i templates.fsa.gz -o database/name

kma index -i fungi.10.1.genomic.fna.gz fungi.18.1.genomic.fna.gz fungi.26.1.genomic.fna.gz fungi.11.1.genomic.fna.gz fungi.19.1.genomic.fna.gz fungi.27.1.genomic.fna.gz fungi.1.1.genomic.fna.gz fungi.20.1.genomic.fna.gz fungi.3.1.genomic.fna.gz fungi.12.1.genomic.fna.gz fungi.21.1.genomic.fna.gz fungi.4.1.genomic.fna.gz fungi.13.1.genomic.fna.gz fungi.2.1.genomic.fna.gz fungi.6.1.genomic.fna.gz fungi.14.1.genomic.fna.gz fungi.22.1.genomic.fna.gz fungi.7.1.genomic.fna.gz fungi.15.1.genomic.fna.gz fungi.23.1.genomic.fna.gz fungi.8.1.genomic.fna.gz fungi.16.1.genomic.fna.gz fungi.24.1.genomic.fna.gz fungi.9.1.genomic.fna.gz fungi.17.1.genomic.fna.gz fungi.25.1.genomic.fna.gz -o /home/umii/goul0109/biobakery_workflows_databases/refseqFungi
kma index -i archaea.1.1.genomic.fna.gz archaea.3.1.genomic.fna.gz archaea.1.2.genomic.fna.gz archaea.3.2.genomic.fna.gz archaea.2.1.genomic.fna.gz archaea.4.1.genomic.fna.gz archaea.2.2.genomic.fna.gz -o /home/umii/goul0109/biobakery_workflows_databases/refseqArchaea
kma index -i viral.1.1.genomic.fna.gz -o /home/umii/goul0109/biobakery_workflows_databases/refseqVirus
kma index -batch ../all_bacteria.txt -o /home/umii/goul0109/biobakery_workflows_databases/refseqBacteria

/home/umii/goul0109/kma/kma index -i VFDB_setA_nt.fas -o /home/umii/goul0109/biobakery_workflows_databases/VFDB_Virus