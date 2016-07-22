#!/bin/bash

# location where strelka was installed to:
#
STRELKA_INSTALL_DIR=/proyectos/home/hachepunto/opt/strelka_workflow/

# location where analysis will be run:
#
WORK_DIR=.

# Step 1. Move to working directory:
#
#cd $WORK_DIR

# Step 2. Copy configuration ini file from default template set to a
#         local copy, possibly edit settings in local copy of file:
#
cp $STRELKA_INSTALL_DIR/etc/strelka_config_isaac_default.ini config.ini

# Step 3. Configure:

B=( ../data/sorted/B*.bam )
T=( ../data/sorted/T*.bam )
for i  in `seq 0 $((${#B[@]} -1))` ;
do
	b=$(basename ${B[$i]} .bam)
	t=$(basename ${T[$i]} .bam)
	$STRELKA_INSTALL_DIR/bin/configureStrelkaWorkflow.pl \
		--normal=${B[$i]} \
		--tumor=${T[$i]} \
		--ref=../reference/NC_012920.fasta \
		--config=./config.ini \
		--output-dir=../data/strelka/${b}-${t};
done


# Step 4. Run Analysis
sk=( ../data/strelka/B* )
for i  in `seq 0 $((${#sk[@]} -1))` ;
do
	(
	cd ${sk[$i]} 
	make -j 24 &
	)
done
