echo ">MT" > NC_012920.fasta
curl "http://www.ncbi.nlm.nih.gov/sviewer/viewer.cgi?tool=portal&sendto=on&log$=seqview&db=nuccore&dopt=fasta&sort=&val=251831106&from=begin&to=end&extrafeat=976, http://www.ncbi.nlm.nih.gov/nuccore/NC_012920" | tail -n +2 >> NC_012920.fasta

