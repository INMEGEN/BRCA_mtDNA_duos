#!/bin/bash

#step 4. Sort the bam files
cd ../data/bam
for file in `ls *.bam`; 
do 
	samtools sort $file \
	-T $file.nnnn.bam \
	-o ../sorted/$file &
done
