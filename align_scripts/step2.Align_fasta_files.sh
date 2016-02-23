#!/bin/bash

THREADS=24

#step 2. Aline fasta files
# the folder "BRCaMt" contain all the raw fastq.gz 
cd ../data/fastq

R1=( `ls *R1_001.fastq.gz` )
R2=( `ls *R2_001.fastq.gz` )

for i  in `seq 0 ${#R1[@]}`;
do
    bwa mem -t $THREADS  ../../reference/NC_012920.fasta \
        ${R1[$i]} \
        ${R2[$i]} \
        > ../sam/${R1[$i]%_L001_R1_001.fastq.gz}.sam;
done
