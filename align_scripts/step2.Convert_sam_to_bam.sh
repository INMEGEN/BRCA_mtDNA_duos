#!/bin/bash

#step 2. Convert from sam to bam
cd ../data/sam
for file in `ls *sam`; 
do
    samtools  view -h -b -S $file \
	      -o ../bam/${file%.sam}.bam &
done
