#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #HGT
open IN2, "<$ARGV[1]";  #total
open OUT, ">Non-HGT_gene.gff";
while(<IN>){
	$hash{$_}=1;
	}
while(<IN2>){
	if($hash{$_}){}
	else{print OUT $_;}
	}
