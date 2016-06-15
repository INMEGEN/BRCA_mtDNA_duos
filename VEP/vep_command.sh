

perl variant_effect_predictor.pl \
	--everything \
	--cache \
	--vcf \
	--port 3337 \
	-i ../../../BRCA_mtDNA_duos/data/full_variants/supermerge.vcf \
	-o ../../../BRCA_mtDNA_duos/VEP/supermerg_vep.vcf \
	--stats_file ../../../BRCA_mtDNA_duos/VEP/supermerg_vep.vcf_summary.html