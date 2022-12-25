#!/usr/bin/perl -w
open IN, "<$ARGV[0]";
open OUT, ">$ARGV[1]";
while(<IN>){
	chomp;
	@ar=split("\t", $_);
	#$ar[8]=~/ID=(.+?);/;
	#$gene=$1;
	#$gene=" ";
	#$ar[8]=~/frac=(.+?);/;
	$gene=$ar[8];
	#print OUT
	$out="$ar[0]\t$ar[3]\t$ar[4]\t$gene\t$ar[5]\t$ar[6]\t$ar[1]\t$ar[2]\t$ar[7]\t$ar[8]\n";
	#$output=$out x 10;
	print OUT $out;
	}
close IN;
close OUT;
