![logo](/images/shotgun_metagenomics_label.png)
**The output from this pipeline is:**
1) metaphlan standard output
	- tables split by taxonomy level
	- heatmaps of each taxonomic level
2) humann3 standard output
	- humann output for genes with functional column

Ideally:
#data = $1
#reference = $2
#working_directory = $3

#command: shotgun_processing.sh data reference working_directory

Currently this is still manual but that's the goal

