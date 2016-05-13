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
		--out ../data/full_variants/comparisons/${b}-${t};
done


#vcftools --vcf ../data/full_variants/B105_S41.vcf --diff ../data/full_variants/T105_S45.vcf --out ../data/full_variants/comparisons/B105_S41-T105_S45