#!/bin/bash

# step 4. index bam files
cd ../data/sorted
for file in `ls *bam`; 
do 
	samtools index $file &
done
