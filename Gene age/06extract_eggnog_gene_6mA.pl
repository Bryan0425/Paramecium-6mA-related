#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #eggnog list
open IN2, "<$ARGV[1]";  #6mA
open OUT, ">$ARGV[1]_eggnog";
while(<IN>){
	chomp;
	$gene=$_;
	$hash{$gene}=1;
	}
while(<IN2>){
	@ar=split("\t", $_);
	$pro=$ar[0];
	if($hash{$pro}){
		print OUT $_;
		}
	}
close IN;
close IN2;
close OUT;
