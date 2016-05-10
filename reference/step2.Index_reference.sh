#!/bin/bash

# step 1. Indexing reference
bwa index NC_012920.fasta

# step 2. generate .fai index
samtools faidx NC_012920.fasta
