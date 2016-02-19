# step 1. Indexing reference
bwa index ~/mamaMit/references/NC_012920.1.fasta

# step 2. Aline fasta files
# the folder "BRCaMt" contain all the raw fastq.gz 
from file in `ls ~/mamaMit/BRCaMt`
do
	bwa   mem   ../references/NC_012920.1.fasta   ~/mamaMit/BRCaMt/$file   ../BRCaMt/B26_S56_L001_R2_001.fastq.gz
	>  ~/mamaMit/sam/$file.sam;
done

#step 3. Convert from sam to bam
for file in `ls ~/mamaMit/sam`; 
do 
	samtools   view -h -b -S   ../sam/$file -o ~/mamaMit/bam/$file.bam;
done

#step 4. Sort the bam files
for file in `ls ~/mamaMit/bam`; 
do 
	samtools sort ~/mamaMit/bam/$file -T ~/mamaMit/bam/$file.nnnn.bam -o ~/mamaMit/sorted/$file.sorted;
done
