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

################    MCAC like    ##################
##  --everything --fork 30 --offline --assembly GRCh37  ##
##############################################

# Strelka all.somatic.indels merge

perl variant_effect_predictor.pl \
	--everything \
	--fork 30 \
	--vcf \
	--offline \
	--assembly GRCh37 \
	-i /labs/home/hachepunto/BRCA_mtDNA_duos/data/strelka/all.somatic.indels/mergevcf/all.somatic.indels.merged.strelka.vcf.gz \
	-o /labs/home/hachepunto/BRCA_mtDNA_duos/VEP/all.somatic.indels.strelka.vep.vcf \
	--stats_file /labs/home/hachepunto/public_html/all.somatic.indels.strelka.vep.vcf.summary.html

# Strelka all.somatic.snvs merge

perl variant_effect_predictor.pl \
	--everything \
	--fork 30 \
	--vcf \
	--offline \
	--assembly GRCh37 \
	-i /labs/home/hachepunto/BRCA_mtDNA_duos/data/strelka/all.somatic.snvs/mergevcf/all.somatic.snvs.merged.strelka.vcf.gz \
	-o /labs/home/hachepunto/BRCA_mtDNA_duos/VEP/all.somatic.snvs.merged.strelka.vep.vcf \
	--stats_file /labs/home/hachepunto/public_html/all.somatic.snvs.merged.strelka.vep.vcf.summary.html

# Strelka passed.somatic.indels merge

perl variant_effect_predictor.pl \
	--everything \
	--fork 30 \
	--vcf \
	--offline \
	--assembly GRCh37 \
	-i /labs/home/hachepunto/BRCA_mtDNA_duos/data/strelka/passed.somatic.indels/mergevcf/passed.somatic.indels.strelka.vcf.gz \
	-o /labs/home/hachepunto/BRCA_mtDNA_duos/VEP/passed.somatic.indels.merged.strelka.vep.vcf \
	--stats_file /labs/home/hachepunto/public_html/passed.somatic.indels.merged.strelka.vep.vcf.summary.html

# Strelka passed.somatic.snvs merge

perl variant_effect_predictor.pl \
	--everything \
	--fork 30 \
	--vcf \
	--offline \
	--assembly GRCh37 \
	-i /labs/home/hachepunto/BRCA_mtDNA_duos/data/strelka/passed.somatic.snvs/mergevcf/passed.somatic.snvs.merged.strelka.vcf.gz \
	-o /labs/home/hachepunto/BRCA_mtDNA_duos/VEP/passed.somatic.snvs.merged.strelka.vep.vcf \
	--stats_file /labs/home/hachepunto/public_html/passed.somatic.snvs.merged.strelka.vep.vcf.summary.html

# All samples VEP

perl variant_effect_predictor.pl \
	--everything \
	--fork 30 \
	--vcf \
	--offline \
	--assembly GRCh37 \
	-i /labs/home/hachepunto/BRCA_mtDNA_duos/data/full_variants/mergevcf/all.merged.vcf.gz \
	-o /labs/home/hachepunto/BRCA_mtDNA_duos/VEP/all.merged.vep.vcf \
	--stats_file /labs/home/hachepunto/public_html/all.merged.vep.vcf.summary.html
