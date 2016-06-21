# go to VEP home

cd /proyectos/home/hachepunto/ensembl-tools-release-84/scripts/variant_effect_predictor

# supermerge analysis
perl variant_effect_predictor.pl \
	--everything \
	--cache \
	--vcf \
	--port 3337 \
	-i ../../../BRCA_mtDNA_duos/data/full_variants/supermerge.vcf \
	-o ../../../BRCA_mtDNA_duos/VEP/supermerg_vep.vcf \
	--stats_file ../../../BRCA_mtDNA_duos/VEP/supermerg_vep.vcf_summary.html

# merge 54 good pairs VEP analysis

perl variant_effect_predictor.pl \
	--everything \
	--cache \
	--vcf \
	--port 3337 \
	-i /proyectos/home/hachepunto/BRCA_mtDNA_duos/data/full_variants/merge_54pairs.vcf.gz \
	-o /proyectos/home/hachepunto/BRCA_mtDNA_duos/VEP/merge_54pairs_VEP.vcf \
	--stats_file /proyectos/home/hachepunto/BRCA_mtDNA_duos/VEP/merge_54pairs_vep.vcf_summary.html