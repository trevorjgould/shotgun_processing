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
/home/umii/goul0109/bin/dool --time --cpu --proc --mem --page --disk --top-cpu --top-io --top-mem --noheaders --nocolor --output dool_annotation.txt 15 > /dev/null &

# contig annotation
# https://github.com/tseemann/prokka/tree/master

	# split contig files of 100,000 fasta sequences each
	awk 'BEGIN {n_seq=0;} /^>/ {if(n_seq%100000==0){file=sprintf("myseq%d.fa",n_seq);} print >> file; n_seq++; next;} { print >> file; }' < /02_ASSEMBLY/final.contigs.fa
	
#!/bin/bash -l
#SBATCH --time=24:00:00
#SBATCH --ntasks=128
#SBATCH --mem=1995g
#SBATCH --tmp=380g
#SBATCH -A umii
#SBATCH --mail-type=ALL
#SBATCH --mail-user=goul0109@umn.edu
cd /DIRECTORY/WITH/FASTQS.GZ/

module load singularity
for i in contigs.*.fa; do echo "singularity exec /home/umii/goul0109/prokka.sif prokka $i --outdir prokka_annotation --prefix ${i//.fa/} --cpus 128" >> annotate_contigs.cmd; done
chmod +x annotate_contigs.cmd
./annotate_contigs.cmd
