#!/bin/bash

#step 3. Convert from sam to bam
for file in `ls /home/hachepunto/mamaMit/sam`; 
do
    
    samtools  view -h -b -S   /home/hachepunto/mamaMit/sam/$file \
	      -o /home/hachepunto/mamaMit/bam/${file%.sam}.bam &
done
