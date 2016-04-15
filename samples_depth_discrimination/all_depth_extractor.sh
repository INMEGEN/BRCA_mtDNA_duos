#!/bin/bash

cd ../data/sorted
for file in `ls *.bam`; 
do 
	samtools depth -a $file \
	> ../samples_full_deapths/${file%.bam}.tsv &
done
