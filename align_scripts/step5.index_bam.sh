#!/bin/bash

# step 5. index bam files
cd ../data/sorted
for file in `ls *bam`; 
do 
	samtools index $file &
done
