#!/usr/bin/perl -w
open IN, "<$ARGV[0]";
open OUT, ">$ARGV[1]";
while(<IN>){
	#chomp;
	@ar=split("\t", $_);
	$gene=$ar[8];
	$gene=~/g(.+?)\n/;
	$pro=$1;
	print OUT $pro."\n";
	}
