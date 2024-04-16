output of *.mapstat

# refSequence   readCount       fragmentCount   mapScoreSum     refCoveredPositions     refConsensusSum bpTotal depthVariance   nucHighDepthVariance    depthMax        snpSum  insertSum       deletionSum     readCountAln    fragmentCountAln
 1183 | DQ674738 Aeromonas phage phiO18P, complete genome.      16390   8195    938     1199    1114    1208    0.034811        1207    2       86      0       8       8       5
 1862 | OL348188 Aeromonas phage vB_AsaM_LPM4, complete genome. 11014   5507    1854    2149    1956    2565    0.086317        2160    2       201     27      14      17      9
 3398 | MG099946 Mycobacterium phage LouisV14, complete genome. 62576   31288   1308    534     467     2252    0.295642        520     9       295     20      6       15      8

output of *.res

#Template       Score   Expected        Template_length Template_Identity       Template_Coverage       Query_Identity  Query_Coverage  Depth   q_value p_value
 375 | MW202864 Siphoviridae sp. isolate ctokW459, complete genome.       897204          315611           56278            1.67            1.87           89.16         5349.62            0.02        278895.94       1.0e-26
 1183 | DQ674738 Aeromonas phage phiO18P, complete genome.        739820          190591           33985            1.53            1.73           88.44         5779.76            0.02        324213.00       1.0e-26
 2515 | MN234189 Streptomyces phage Urza, complete genome.       3293240          282803           50448            1.26            1.46           86.20         6826.52            0.13        2534288.15      1.0e-26
 5576 | MW015081 Synechococcus phage S-SRM01, complete genome.   1575886         1350741          240842            6.15            6.96           88.39         1437.18            0.11        17320.27        1.0e-26

# all files same directory remove lines with "taxa" after the header line:
awk '{print $0,FILENAME}' *.res | sed '1!;{/Expected/d}' > ../all_KMA_Predictions_res.txt

awk '{print $0,FILENAME}' *.mapstat | sed '1!;{/readCount/d}' > ../all_KMA_Predictions_mapstat.txt

# R make table of Depth and Template



# assembly output
# final.contig.fa
>k141_7093 flag=1 multi=2.0000 len=1449
CAATGACACCGCAAAAAAGAGTGCTGCGGGCCGACGGACCAGAACGTGGGGACGATCACGTGGGATGACAAGAGCCTCCGCCTCCCTCACGGCGCCAGGAAGCGCTCGACGATGGCAAATTGCGCCGGGGTGTTGAGCGCAGGAGCATGACCGCAACCCGCGATTTCGACAATCTCCGCGCGCGGACCCGTGTTGCGCATGCGCTCGCAGGTCTCGCGCAGGAGCAGGTCGCTGTCCTGGCCGCGCAGGCACAGCACGGGAATGTCGAGCTGCTCCCAGGCGCCCCAGAGTTCGTAGTCCTGCGGGTGCGCTTCGAACTGCGTCACCATCGCCGGGTCATAGTGTGGCGTGACCTGGCCGTTGGGCAGGCGGCGCGTGGAGGTCTCGGTCAGGCGCCGCCATTGCAGGTCGCTCAGCCAGCCGTAGGGCGCGTAGATCGTCCGGAAGTACTGCTCGAGCTCGCTCACCGTGTCAAAACTCGGCGGTTGGCCGGCGTAGCGGCGGATGCGGGCCACCGCCGCAGGCGCAATGCTCGGGCCGATGTCGTTGAGCGCCAGCCGCGTGATGCGCCCACGCAGGGCGGTCGCCGCGGCCAGCAGGCCGATCGCGCCACCCATCGACGTGCCGAGCCACGCCATGCGTTCCAGGCCGAGGTGGTTGACGAGGCCGGCCGCGAGCTTGACGTAGTGCGCCAGACAGTACTCGCGAGCCGGATCCTCGGCCCACTGACTCAACCCGCGGCCAATCGTGTCGGGGCAGATGACGCGAAAGCGCTCGGCCAGATGGGCGGCGATATCGTCCATGTCGCGGCCAGTGCGTGCCAGTCCATGCCAGGCCACCACGGTCTCGGTGTGTTGCGCGCCCCACAGCATGTAGTGCAGTTCGCGGCCCTCGACGGTGGCGTAGTGCGAGGTGGGCGTCGTCATGGTTTACGCACTGCCATCGCGCGCCACTTGCCGACCAGCCCGCTCGGAAAATAGTAGACCGCCAGCACGAACAACACGCCCAGCCAGAGCAACCATCGATCGGGTGTGAGCACGGCGCCCAGAATCGGAACGTTTTCGAACTGGCTGCCGGCCACGCGGAGCAAGTCCTGCAGGTAGTTCTGGGCGAGCACGAACAAGGTGCTGCCGATCACCGCGCCGTAGAGCGTGCCCATGCCGCCGATGACGACGATGAGCAGGATGTCGAGCATGATCTCGAAGGACAGCGTCGTGTCCGGCCCCGTGTAGCGCAGCCACAGGGCGAGCAGGGCGCCGGCCACCGTGGCAAACGCGGCCGACAACACATTCGACAAGGTACGGTAGATCACGGTGCGAAAGCCCAGCGATTCGGCGCGGAAGTCGTTTTCACGAATGGCCTGCAATACGCGGCCGAATGGCGAGTTGACGATGCGCAGCAACAGCAGGAAAAGCGCGGCGACGACAAAGAAGATGAGGTAGTACGCCA
>k141_21270 flag=1 multi=2.0000 len=1115
CATCATAGCTTCCAGATCATGAGATACGCACAATACATCCTCAACATACACAAGTATCATTTCATAATACTCAAATCCATCCGGCTTGATGCCTGGTCTGATCCATATGTCGGGGTCTGCTTTCGTAGGTGTATAGTTCAACTCAAATAGTGTCTCCGCA

# mapping output 
# testSamplead_KMA_OUTPUT.res
#Template       Score   Expected        Template_length Template_Identity       Template_Coverage       Query_Identity  Query_Coverage  Depth   q_value p_value
k141_24824 flag=1 multi=2.0000 len=1035     3784            3084            1035           74.78           75.65           98.85          132.18            1.75           71.29        1.0e-16
k141_24826 flag=1 multi=3.0000 len=1751     5618            5218            1751           81.72           81.95           99.72          122.02            1.55           14.75        1.2e-04
k141_21299 flag=1 multi=2.0000 len=1028     6992            3061            1028           93.00           96.30           96.57          103.84            4.40         1536.59        1.0e-26
k141_7129 flag=1 multi=2.0000 len=1505      5530            4484            1505           49.24           50.56           97.37          197.77            1.51          109.14        1.0e-24
k141_21300 flag=1 multi=2.0000 len=1120     3854            3337            1120           76.88           79.02           97.29          126.55            2.29           37.07        1.6e-09

# testSamplead_KMA_OUTPUT.mapstat
## method       KMA
## version      1.4.2
## database     contig_index
## fragmentCount        1000000
## date 2023-07-18
## command      /home/umii/goul0109/kma/kma -ipe "testSamplead-cut_R1_001.fastq.gz" "testSamplead-cut_R2_001.fastq.gz" -o "testSamplead_KMA_OUTPUT" -t_db 02_ASSEMBLY/contig_index -t 32 -1t1 -mem_mode -and -apm f -ef
# refSequence   readCount       fragmentCount   mapScoreSum     refCoveredPositions     refConsensusSum bpTotal depthVariance   nucHighDepthVariance    depthMax        snpSum  insertSum       deletionSum     readCountAln    fragmentCountAln
k141_24824 flag=1 multi=2.0000 len=1035 28      14      1709    783     774     1811    2.237862        0       5       34      0       0       12      6
k141_24826 flag=1 multi=3.0000 len=1751 32      16      2624    1435    1431    2717    1.018317        0       4       31      0       0       18      9
k141_21299 flag=1 multi=2.0000 len=1028 56      28      3671    990     956     4528    9.332352        0       11      260     13      14      30      15
k141_7129 flag=1 multi=2.0000 len=1505  54      27      2096    761     741     2266    4.162260        0       7       48      5       2       15      9


# all files same directory remove lines with "taxa" after the header line:
awk '{print $0,FILENAME}' *.res | sed '1!;{/Expected/d}' > ../_mapping_KMA_Predictions.txt

awk '{print $0,FILENAME}' *.mapstat | sed '1!;{/readCount/d}' > ../mapping_KMA_Predictions_mapstat.txt


# annotation output
# prokka_output.gff
##
k141_7093	Prodigal:002006	CDS	87	926	.	-	0	ID=CKCAJAEP_00001;eC_number=4.2.99.20;Name=menH_1;gene=menH_1;inference=ab initio prediction:Prodigal:002006,protein motif:HAMAP:MF_01660;locus_tag=CKCAJAEP_00001;product=2-succinyl-6-hydroxy-2%2C4-cyclohexadiene-1-carboxylate synthase
k141_7093	Prodigal:002006	CDS	923	1402	.	-	0	ID=CKCAJAEP_00002;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00002;product=hypothetical protein
k141_7101	Prodigal:002006	CDS	45	932	.	+	0	ID=CKCAJAEP_00003;eC_number=4.2.1.42;Name=garD;db_xref=COG:COG2721;gene=garD;inference=ab initio prediction:Prodigal:002006,similar to AA sequence:UniProtKB:P39829;locus_tag=CKCAJAEP_00003;product=Galactarate dehydratase (L-threo-forming)
k141_14188	Prodigal:002006	CDS	139	816	.	-	0	ID=CKCAJAEP_00004;Name=lptC;gene=lptC;inference=ab initio prediction:Prodigal:002006,protein motif:HAMAP:MF_01915;locus_tag=CKCAJAEP_00004;product=Lipopolysaccharide export system protein LptC
k141_14188	Prodigal:002006	CDS	849	1127	.	-	0	ID=CKCAJAEP_00005;eC_number=3.1.3.45;Name=kdsC;db_xref=COG:COG1778;gene=kdsC;inference=ab initio prediction:Prodigal:002006,similar to AA sequence:UniProtKB:P67653;locus_tag=CKCAJAEP_00005;product=3-deoxy-D-manno-octulosonate 8-phosphate phosphatase KdsC
k141_24824	Prodigal:002006	CDS	105	848	.	-	0	ID=CKCAJAEP_00006;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00006;product=hypothetical protein
k141_24826	Prodigal:002006	CDS	431	1300	.	+	0	ID=CKCAJAEP_00007;eC_number=3.2.1.8;Name=xynZ;db_xref=COG:COG2382;gene=xynZ;inference=ab initio prediction:Prodigal:002006,similar to AA sequence:UniProtKB:P10478;locus_tag=CKCAJAEP_00007;product=Endo-1%2C4-beta-xylanase Z
k141_24826	Prodigal:002006	CDS	1413	1613	.	-	0	ID=CKCAJAEP_00008;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00008;product=hypothetical protein
k141_21291	Prodigal:002006	CDS	270	548	.	+	0	ID=CKCAJAEP_00009;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00009;product=hypothetical protein
k141_21291	Prodigal:002006	CDS	1101	1322	.	-	0	ID=CKCAJAEP_00010;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00010;product=hypothetical protein
k141_14211	Prodigal:002006	CDS	18	185	.	+	0	ID=CKCAJAEP_00011;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00011;product=hypothetical protein
k141_14211	Prodigal:002006	CDS	246	623	.	+	0	ID=CKCAJAEP_00012;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00012;product=hypothetical protein
k141_21299	Prodigal:002006	CDS	227	832	.	-	0	ID=CKCAJAEP_00013;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00013;product=hypothetical protein
k141_21299	Prodigal:002006	CDS	844	1017	.	-	0	ID=CKCAJAEP_00014;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00014;product=hypothetical protein
k141_7129	Prodigal:002006	CDS	67	957	.	-	0	ID=CKCAJAEP_00015;eC_number=4.2.99.20;Name=menH_2;gene=menH_2;inference=ab initio prediction:Prodigal:002006,protein motif:HAMAP:MF_01660;locus_tag=CKCAJAEP_00015;product=2-succinyl-6-hydroxy-2%2C4-cyclohexadiene-1-carboxylate synthase
k141_10681	Prodigal:002006	CDS	107	289	.	-	0	ID=CKCAJAEP_00016;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00016;product=hypothetical protein
k141_10681	Prodigal:002006	CDS	302	859	.	-	0	ID=CKCAJAEP_00017;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00017;product=hypothetical protein
k141_10681	Prodigal:002006	CDS	866	1042	.	-	0	ID=CKCAJAEP_00018;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00018;product=hypothetical protein
k141_21300	Prodigal:002006	CDS	303	569	.	+	0	ID=CKCAJAEP_00019;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00019;product=hypothetical protein
k141_17766	Prodigal:002006	CDS	5	817	.	+	0	ID=CKCAJAEP_00020;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00020;product=hypothetical protein
k141_17766	Prodigal:002006	CDS	814	1122	.	-	0	ID=CKCAJAEP_00021;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00021;product=hypothetical protein
k141_21301	Prodigal:002006	CDS	119	1285	.	-	0	ID=CKCAJAEP_00022;inference=ab initio prediction:Prodigal:002006;locus_tag=CKCAJAEP_00022;product=hypothetical protein
k141_21301	Prodigal:002006	CDS	1282	2067	.	-	0	ID=CKCAJAEP_00023;eC_number=2.7.6.1;Name=prs;db_xref=COG:COG0462;gene=prs;inference=ab initio prediction:Prodigal:002006,similar to AA sequence:UniProtKB:P65235;locus_tag=CKCAJAEP_00023;product=Ribose-phosphate pyrophosphokinase


# prokka_output.tsv
locus_tag       ftype   length_bp       gene    EC_number       COG     product
CKCAJAEP_00001  CDS     840     menH_1  4.2.99.20               2-succinyl-6-hydroxy-2,4-cyclohexadiene-1-carboxylate synthase
CKCAJAEP_00002  CDS     480                             hypothetical protein
CKCAJAEP_00003  CDS     888     garD    4.2.1.42        COG2721 Galactarate dehydratase (L-threo-forming)
CKCAJAEP_00004  CDS     678     lptC                    Lipopolysaccharide export system protein LptC
CKCAJAEP_00005  CDS     279     kdsC    3.1.3.45        COG1778 3-deoxy-D-manno-octulosonate 8-phosphate phosphatase KdsC
CKCAJAEP_00006  CDS     744                             hypothetical protein
CKCAJAEP_00007  CDS     870     xynZ    3.2.1.8 COG2382 Endo-1,4-beta-xylanase Z
CKCAJAEP_00008  CDS     201                             hypothetical protein
CKCAJAEP_00009  CDS     279                             hypothetical protein
CKCAJAEP_00010  CDS     222                             hypothetical protein
CKCAJAEP_00011  CDS     168                             hypothetical protein
CKCAJAEP_00012  CDS     378                             hypothetical protein

# prokka_output.tbl
>Feature k141_7093
926     87      CDS
                        EC_number       4.2.99.20
                        gene    menH_1
                        inference       ab initio prediction:Prodigal:002006
                        inference       protein motif:HAMAP:MF_01660
                        locus_tag       CKCAJAEP_00001
                        product 2-succinyl-6-hydroxy-2,4-cyclohexadiene-1-carboxylate synthase
1402    923     CDS
                        inference       ab initio prediction:Prodigal:002006
                        locus_tag       CKCAJAEP_00002
                        product hypothetical protein
>Feature k141_21270
>Feature k141_7101
45      932     CDS
                        EC_number       4.2.1.42
                        db_xref COG:COG2721
                        gene    garD
                        inference       ab initio prediction:Prodigal:002006
                        inference       similar to AA sequence:UniProtKB:P39829
                        locus_tag       CKCAJAEP_00003
                        product Galactarate dehydratase (L-threo-forming)

# prokka_output.gkb
LOCUS       k141_7093               1449 bp    DNA     linear       18-JUL-2023
DEFINITION  Genus species strain strain.
ACCESSION
VERSION
KEYWORDS    .
SOURCE      Genus species
  ORGANISM  Genus species
            Unclassified.
COMMENT     Annotated using prokka 1.14.6 from
            https://github.com/tseemann/prokka.
FEATURES             Location/Qualifiers
     source          1..1449
                     /organism="Genus species"
                     /mol_type="genomic DNA"
                     /strain="strain"
     CDS             complement(87..926)
                     /gene="menH_1"
                     /locus_tag="CKCAJAEP_00001"
                     /EC_number="4.2.99.20"
                     /inference="ab initio prediction:Prodigal:002006"
                     /inference="protein motif:HAMAP:MF_01660"
                     /codon_start=1
                     /transl_table=11
                     /product="2-succinyl-6-hydroxy-2,
                     4-cyclohexadiene-1-carboxylate synthase"
                     /translation="MTTPTSHYATVEGRELHYMLWGAQHTETVVAWHGLARTGRDMDD
                     IAAHLAERFRVICPDTIGRGLSQWAEDPAREYCLAHYVKLAAGLVNHLGLERMAWLGT
                     SMGGAIGLLAAATALRGRITRLALNDIGPSIAPAAVARIRRYAGQPPSFDTVSELEQY
                     FRTIYAPYGWLSDLQWRRLTETSTRRLPNGQVTPHYDPAMVTQFEAHPQDYELWGAWE
                     QLDIPVLCLRGQDSDLLLRETCERMRNTGPRAEIVEIAGCGHAPALNTPAQFAIVERF
                     LAP"
    CDS             complement(923..1402)
                     /locus_tag="CKCAJAEP_00002"
                     /inference="ab initio prediction:Prodigal:002006"
                     /codon_start=1
                     /transl_table=11
                     /product="hypothetical protein"
                     /translation="MLRIVNSPFGRVLQAIRENDFRAESLGFRTVIYRTLSNVLSAAF
                     ATVAGALLALWLRYTGPDTTLSFEIMLDILLIVVIGGMGTLYGAVIGSTLFVLAQNYL
                     QDLLRVAGSQFENVPILGAVLTPDRWLLWLGVLFVLAVYYFPSGLVGKWRAMAVRKP"
ORIGIN
        1 caatgacacc gcaaaaaaga gtgctgcggg ccgacggacc agaacgtggg gacgatcacg
       61 tgggatgaca agagcctccg cctccctcac ggcgccagga agcgctcgac gatggcaaat
      121 tgcgccgggg tgttgagcgc aggagcatga ccgcaacccg cgatttcgac aatctccgcg
      181 cgcggacccg tgttgcgcat gcgctcgcag gtctcgcgca ggagcaggtc gctgtcctgg
      241 ccgcgcaggc acagcacggg aatgtcgagc tgctcccagg cgccccagag ttcgtagtcc
      301 tgcgggtgcg cttcgaactg cgtcaccatc gccgggtcat agtgtggcgt gacctggccg
...
     1381 gcgagttgac gatgcgcagc aacagcagga aaagcgcggc gacgacaaag aagatgaggt
     1441 agtacgcca
//
...
