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
	--port 3337 \
	-i /proyectos/home/hachepunto/BRCA_mtDNA_duos/data/full_variants/merge_54pairs.vcf.gz \
	-o /proyectos/home/hachepunto/BRCA_mtDNA_duos/VEP/merge_54pairs_VEP.tsv \
	--stats_file /proyectos/home/hachepunto/public_html/merge_54pairs_vep.tsv_summary.html

perl variant_effect_predictor.pl \
	-i /proyectos/home/hachepunto/BRCA_mtDNA_duos/data/full_variants/merge_54pairs.vcf.gz \
	-o /proyectos/home/hachepunto/BRCA_mtDNA_duos/VEP/merge_54pairs_VEP_mcaclike.json \
	 --json \
	 --everything \
	 --fork 24 \
	 --offline \
	 --assembly GRCh37



# Strelka results VEP 

# Strelka all.somatic.indels merge

perl variant_effect_predictor.pl \
	--everything \
	--cache \
	--vcf \
	--port 3337 \
	-i /proyectos/home/hachepunto/BRCA_mtDNA_duos/data/strelka/mergevcf/all_indels_merged_strelka_res.vcf.gz \
	-o /proyectos/home/hachepunto/BRCA_mtDNA_duos/VEP/all_indels_merged_strelka_res_VEP.vcf \
	--stats_file /proyectos/home/hachepunto/public_html/all_indels_merged_strelka_res_vep.vcf_summary.html

# Strelka all.somatic.snvs merge

perl variant_effect_predictor.pl \
	--everything \
	--cache \
	--vcf \
	--port 3337 \
	-i /proyectos/home/hachepunto/BRCA_mtDNA_duos/data/strelka/mergevcf/all_snvs_merged_strelka_res.vcf.gz \
	-o /proyectos/home/hachepunto/BRCA_mtDNA_duos/VEP/all_snvs_merged_strelka_res_VEP.vcf \
	--stats_file /proyectos/home/hachepunto/public_html/all_snvs_merged_strelka_res_vep.vcf_summary.html

# Strelka passed.somatic.indels merge

perl variant_effect_predictor.pl \
	--everything \
	--cache \
	--vcf \
	--port 3337 \
	-i /proyectos/home/hachepunto/BRCA_mtDNA_duos/data/strelka/mergevcf/passed_indels_merged_strelka_res.vcf.gz \
	-o /proyectos/home/hachepunto/BRCA_mtDNA_duos/VEP/passed_indels_merged_strelka_res_VEP.vcf \
	--stats_file /proyectos/home/hachepunto/public_html/passed_indels_merged_strelka_res_vep.vcf_summary.html

# Strelka passed.somatic.snvs merge

perl variant_effect_predictor.pl \
	--everything \
	--cache \
	--vcf \
	--port 3337 \
	-i /proyectos/home/hachepunto/BRCA_mtDNA_duos/data/strelka/mergevcf/passed_snvs_merged_strelka_res.vcf.gz \
	-o /proyectos/home/hachepunto/BRCA_mtDNA_duos/VEP/passed_snvs_merged_strelka_res_VEP.vcf \
	--stats_file /proyectos/home/hachepunto/public_html/passed_snvs_merged_strelka_res_vep.vcf_summary.html
