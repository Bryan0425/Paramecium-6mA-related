#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #symbiotic
open IN2, "<$ARGV[1]";  #file
open OUT, ">$ARGV[1]_type2";
while(<IN>){
	chomp;
	#if($_=~/(g.+?)\t/){
	$gene="g$_";	
	#$gene=$1;
	$hash{$gene}=1;
	#	}
	}
while(<IN2>){
	chomp;
	@ar=split("\t", $_);
	$g=$ar[0];
	if($hash{$g}){
		print OUT "$_\tES\n";
		}else{
		print OUT "$_\tNE\n";
		}
	}
