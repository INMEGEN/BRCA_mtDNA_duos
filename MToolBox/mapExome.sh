#!/bin/bash

#########     MToolBox Pipeline     #########


#mapExome.py -a ../data/B26_S56_L001_R1_001.fastq.gz -b B26_S56_L001_R2_001.fastq.gz -o B26_S56

(
cd ../data/fastq
R1=( `ls *R1_001.fastq` )
R2=( `ls *R2_001.fastq` )
cd ../../MToolBox/samExo
for i  in `seq 0 $((${#R1[@]} -1))`;
do
    mapExome.py \
        -a ../../data/fastq/${R1[$i]} \
        -b ../../data/fastq/${R2[$i]} \
        -o ${R1[$i]%_L001_R1_001.fastq};
done
)