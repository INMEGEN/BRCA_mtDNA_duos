#!/bin/bash

# step 5. index bam files
for file in `ls /home/hachepunto/mamaMit/sorted/`; 
do 
	samtools index /home/hachepunto/mamaMit/sorted/$file &
done
