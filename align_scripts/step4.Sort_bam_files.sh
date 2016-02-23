#!/bin/bash

#step 4. Sort the bam files
for file in `ls /home/hachepunto/mamaMit/bam`; 
do 
	samtools sort /home/hachepunto/mamaMit/bam/$file \
	-T /home/hachepunto/mamaMit/bam/$file.nnnn.bam \
	-o /home/hachepunto/mamaMit/sorted/$file &
done
