#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #gff
open IN2, "<$ARGV[1]";  #list
open OUT, ">$ARGV[1].gff";
while(<IN2>){
	chomp;
	$HGT="g".$_;
	$hash{$HGT}=1;
	}
while(<IN>){
	chomp;
	@ar=split("\t", $_);
	$gene=$ar[8];
	if($hash{$gene}){print OUT $_."\n";}
	}
