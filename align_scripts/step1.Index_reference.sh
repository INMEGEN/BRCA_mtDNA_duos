#!/bin/bash

# step 1. Indexing reference
bwa index ../reference/NC_012920.fasta
samtools faidx ../reference/NC_012920.fasta
