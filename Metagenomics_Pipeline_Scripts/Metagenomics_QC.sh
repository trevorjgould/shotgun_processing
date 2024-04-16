# for optimization: 
# https://github.com/scottchiefbaker/dool
/home/umii/goul0109/bin/dool --time --cpu --proc --mem --page --disk --top-cpu --top-io --top-mem --noheaders --nocolor --output dool_QC.txt 15 > /dev/null &

# remove adapters
mkdir 01_adapter
for i in *_R1_001.fastq.gz; do echo "cutadapt --cores 8 --minimum-length 50 --pair-filter=any -a TATGGTAATTGTGTGNCAGCNGCCGCGGTAA -g ATTAGANACCCNNGTAGTCCGGCTGGCTGACT -A AGTCAGCCAGCCGGACTACNVGGGTNTCTAAT -o 01_adapter/${i//_R1_001.fastq.gz/-cut_R1_001.fastq.gz} -p 01_adapter/${i//_R1_001.fastq.gz/-cut_R2_001.fastq.gz} ${i} ${i//_R1_/_R2_} > 01_adapter/cutadapt.${i//_R1_001.fastq.gz/.log.txt}" >> run_cutadapt.sh; done
chmod +x run_cutadapt.sh
module load cutadapt
parallel -j 4 < run_cutadapt.sh
# log files   
mkdir 01_adapter/01_logs
mv 01_adapter/cutadapt* 01_adapter/01_logs
grep "passing" /01_adapter/01_logs/* > summary_adapter_trimming.txt

# if necessary
# remove human host sequences
#for i in *R1_001.fastq.gz; do echo "bowtie2 -p 8 -x /home/umii/goul0109/Elias/phage_alignment/kmaphage -1 $i -2 ${i//_R1_/_R2_} -S ${i//_R1_/outsam}" >> run_bt2.cmd; done
#chmod +x run_bt2.cmd
#./run_bt2.cmd

#cd /Elias/01_adapter
#module load bowtie2
#module load parallel
#parallel -j 4 < run_bt2.cmd

module load R
Rscript dool_report.R dool_QC.txt
