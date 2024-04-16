#!/bin/bash -l
#SBATCH --time=24:00:00
#SBATCH --ntasks=128
#SBATCH --mem=1995g
#SBATCH --tmp=380g
#SBATCH -A umii
#SBATCH --mail-type=ALL
#SBATCH --mail-user=goul0109@umn.edu

# functional pipeline
	# contig assembly
cd /scratch.global/goul0109/virustest/02_ASSEMBLY

# for optimization: 
/home/umii/goul0109/bin/dool --time --cpu --proc --mem --page --disk --top-cpu --top-io --top-mem --noheaders --nocolor --output dool_assembly.txt 15 > /dev/null &

# for i in *-cut_R1_001.fastq.gz
R1s=`ls *-cut_R1_001.fastq.gz | python -c 'import sys; print(",".join([x.strip() for x in sys.stdin.readlines()]))'`
R2s=`ls *-cut_R2_001.fastq.gz | python -c 'import sys; print(",".join([x.strip() for x in sys.stdin.readlines()]))'`

/home/umii/goul0109/megahit/bin/megahit -1 $R1s -2 $R2s --min-contig-len 1000 -m 0.85 -o 02_ASSEMBLY/ -t 128

#output: contigs.fa
