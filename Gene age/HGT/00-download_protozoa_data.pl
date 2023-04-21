#!/usr/bin/perl -w
#open IN, "<$ARGV[0]";
#while(<IN>){
$i=1;
#$file="plant.$i.protein.faa.gz";
while($i<26){
	$file="protozoa.$i.protein.faa.gz";
	system("wget https://ftp.ncbi.nlm.nih.gov/refseq/release/protozoa/$file");
	$i++;
	}
