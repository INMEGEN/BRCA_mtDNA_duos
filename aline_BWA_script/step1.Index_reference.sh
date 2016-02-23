#!/bin/bash

# step 1. Indexing reference
bwa index ~/mamaMit/references/NC_012920.1.fasta
samtools faidx ~/mamaMit/references/NC_012920.1.fasta