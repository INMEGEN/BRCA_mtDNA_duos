
# updating GMAP/GSNAP database

~/MToolBox/build_gsnap_index.sh -D ~/usr/local/share/gmapdb/ -n hg19RSRS -f ~/usr/local/share/genomes/hg19RSRS.fa -k 30
~/MToolBox/build_gsnap_index.sh -D ~/usr/local/share/gmapdb/ -n hg19RCRS -f ~/usr/local/share/genomes/hg19RCRS.fa -k 30
~/MToolBox/build_gsnap_index.sh -D ~/usr/local/share/gmapdb/ -n chrM -f ~/usr/local/share/genomes/chrM.fa -k 30
~/MToolBox/build_gsnap_index.sh -D ~/usr/local/share/gmapdb/ -n chrRSRS -f ~/usr/local/share/genomes/chrRSRS.fa -k 30