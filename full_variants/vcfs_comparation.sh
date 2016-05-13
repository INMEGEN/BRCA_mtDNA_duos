#!/bin/bash

B=( ../data/full_variants/B*.vcf )
T=( ../data/full_variants/T*.vcf )
for i  in `seq 0 $((${#B[@]} -1))` ;
do
	b=$(basename ${B[$i]} .vcf)
	t=$(basename ${T[$i]} .vcf)
	vcftools --vcf \
		 ${B[$i]} \
		--diff ${T[$i]} \
		--out ./comparisons/compare${b}-${t};
done


#vcftools --vcf B105_S41.vcf --diff T105_S45.vcf --out compare105