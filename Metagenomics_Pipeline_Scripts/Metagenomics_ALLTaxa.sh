#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --time=8:00:00
#SBATCH --ntasks=32
#SBATCH --mem=400gb
#SBATCH --tmp=800gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=goul0109@umn.edu

# sbatch -p msibigmem Metagenomics_AllTaxa.sh
cd /home/umii/goul0109/test_SG_samples/

# for optimization: 
/home/umii/goul0109/bin/dool --time --cpu --proc --mem --page --disk --noheaders --nocolor --output dool_alltaxa.txt 15 > /dev/null &

# Archeae
for i in *R1_001.fastq.gz; do echo "/home/umii/goul0109/kma/kma -ipe $i ${i//R1/R2}  -o ${i//R1_001.fastq.gz/_KMA_OUTPUT_Archaea} -t_db /home/umii/goul0109/biobakery_workflows_databases/RefSeqLoci/refseqArchaea -t 8 -1t1 -mem_mode -and -apm f -ef" >> MGArchaea.cmd; done
chmod +x MGArchaea.cmd

# Fungi
for i in *R1_001.fastq.gz; do echo "/home/umii/goul0109/kma/kma -ipe $i ${i//R1/R2}  -o ${i//R1_001.fastq.gz/_KMA_OUTPUT_FUNGI} -t_db /home/umii/goul0109/biobakery_workflows_databases/RefSeqLoci/refseqFungi -t 8 -1t1 -mem_mode -and -apm f -ef" >> MGFungi.cmd; done
chmod +x MGFungi.cmd

# Bacteria
for i in *R1_001.fastq.gz; do echo "/home/umii/goul0109/kma/kma -ipe $i ${i//R1/R2}  -o ${i//R1_001.fastq.gz/_KMA_OUTPUT_Bacteria} -t_db /home/umii/goul0109/biobakery_workflows_databases/RefSeqLoci/refseqBacteria -t 8 -1t1 -mem_mode -and -apm f -ef" >> MGBacteria.cmd; done
chmod +x MGBacteria.cmd

# Virus
for i in *R1_001.fastq.gz; do echo "/home/umii/goul0109/kma/kma -ipe $i ${i//R1/R2}  -o ${i//R1_001.fastq.gz/_KMA_OUTPUT_Virus} -t_db /home/umii/goul0109/biobakery_workflows_databases/RefSeqLoci/refseqVirus -t 8 -1t1 -mem_mode -and -apm f -ef" >> MGVirus.cmd; done
chmod +x MGVirus.cmd

module load parallel
# in order of increasing comp. requirements
parallel -j 4 < MGVirus.cmd
parallel -j 4 < MGArchaea.cmd
parallel -j 4 < MGFungi.cmd
parallel -j 4 < MGBacteria.cmd

module load R/4.1.0
Rscript /home/umii/goul0109/scripts/dool_report.R dool_alltaxa.txt




#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --time=4:00:00
#SBATCH --ntasks=128
#SBATCH --mem=1995gb
#SBATCH --tmp=800gb
#SBATCH --mail-type=ALL
#SBATCH --mail-user=goul0109@umn.edu

# sbatch -p ag2tb Metagenomics_AllTaxa.sh
cd /scratch.global/goul0109/virustest/
/home/umii/goul0109/kma/kma -ipe E0055_S1_R1_001.fastq.gz E0055_S1_R2_001.fastq.gz  -o E0055_S1_KMA_OUTPUT_Bacteria -t_db /home/umii/goul0109/biobakery_workflows_databases/RefSeqLoci/refseqBacteria -t 128 -1t1 -mem_mode -and -apm f -ef

# that ran in 39 minutes using 1.2TB MaxVMSize
JobID	JobName	MaxRSS	MaxVMSize	Elapsed	AllocCPUS	NTasks	ExitCode	WorkDir	Group	Partition	MaxDiskWrite	MaxDiskRead	NodeList	State
76748450	justbacteria.slurm			00:39:07	128		0:0	/scratch.global/goul0109/virustest	umii	ag2tb			acl16	COMPLETED
76748450.batch	batch	577826672K	1165937572K	00:39:07	128	1	0:0				0.01M	2.32M	acl16	COMPLETED
76748450.extern	extern			00:39:07	128	1	0:0						acl16	COMPLETED
