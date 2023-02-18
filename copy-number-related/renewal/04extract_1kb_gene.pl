#!/usr/bin/perl -w
open IN, "<$ARGV[0]";
open OUT, ">1kb_gene_list";
while(<IN>){
	@ar=split("\t", $_);
	$length=$ar[4]-$ar[3];
	$ar[8]=~/gene_id "(.+?)"/;
	$gene=$1;
	if($length>=999){
		print OUT "$gene\n";
		}
	}
