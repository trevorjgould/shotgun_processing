#!/bin/bash -l
#SBATCH --time=24:00:00
#SBATCH --cpus-per-task=128
#SBATCH --mem=300g
#SBATCH --tmp=200g
#SBATCH --mail-type=ALL
#SBATCH --mail-user=goul0109@umn.edu

# OPERA-MS processing

module load perl/modules.centos7.5.26.1
module load gcc
cd /scratch.global/goul0109/potato/sequence_files
# sh
perl /home/umii/goul0109/OPERA-MS/OPERA-MS.pl \
--contig-file final.contigs.fa \
--short-read1 reads_R1.fastq.gz \
--short-read2 reads_R2.fastq.gz \
--long-read hifi.fastq \
--no-ref-clustering --contig-len-thr 1000 --num-processors 128 \
--out-dir sample_RESULTS 2> log.err


