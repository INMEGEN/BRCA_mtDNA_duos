#!/bin/bash

B=( ../data/sorted/*.bam )

for i  in `seq 0 $((${#B[@]} -1))` ;
do
	b=$(basename ${B[$i]} .bam)
	freebayes -f ../reference/NC_012920.fasta \
		${B[$i]} \
		> ../data/full_variants/${b}.vcf;
done