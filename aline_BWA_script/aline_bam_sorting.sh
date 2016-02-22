# step 1. Indexing reference
bwa index ~/mamaMit/references/NC_012920.1.fasta
samtools faidx ~/mamaMit/references/NC_012920.1.fasta

step 2. Aline fasta files
the folder "BRCaMt" contain all the raw fastq.gz 
cd /home/hachepunto/mamaMit/BRCaMt/
R1=( `ls *R1_001.fastq.gz` )
R2=( `ls *R2_001.fastq.gz` )
for i  in `seq ${#R1[@]}`;
do
        bwa   mem -t 10  /home/hachepunto/mamaMit/references/NC_012920.1.fasta \
                ${R1[$i -1]} \
                ${R2[$i -1]} \
                > ../sam/${R1[$i]%_L001_R1_001.fastq.gz}.sam;
done



#step 3. Convert from sam to bam
for file in `ls /home/hachepunto/mamaMit/sam`; 
do 
	samtools  view -h -b -S   /home/hachepunto/mamaMit/sam/$file \
	 -o /home/hachepunto/mamaMit/bam/$file.bam;
done

#step 4. Sort the bam files
for file in `ls /home/hachepunto/mamaMit/bam`; 
do 
	samtools sort /home/hachepunto/mamaMit/bam/$file \
	-T /home/hachepunto/mamaMit/bam/$file.nnnn.bam \
	-o /home/hachepunto/mamaMit/sorted/$file;
done
