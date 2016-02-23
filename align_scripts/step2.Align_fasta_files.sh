#!/bin/bash

#step 2. Aline fasta files
the folder "BRCaMt" contain all the raw fastq.gz 
cd /home/hachepunto/mamaMit/BRCaMt/
R1=( `ls *R1_001.fastq.gz` )
R2=( `ls *R2_001.fastq.gz` )
for i  in `seq ${#R1[@]}`;
do
        bwa   mem -t 10  /home/hachepunto/mamaMit/references/NC_012920.1.fasta \
                ${R1[$i -1]} \
                ${R2[$i -1]} \
                > ../sam/${R1[$i]%_L001_R1_001.fastq.gz}.sam;
done