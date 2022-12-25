#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #psl
open IN2, "<$ARGV[1]";  #HGT
open OUT, ">$ARGV[1]_$ARGV[0]";
while(<IN>){
	chomp;
	$pro=$_;
	$hash{$pro}=1;
	}
while(<IN2>){
	@ar=split("\t", $_);
	$pro2=$ar[0];
	if($hash{$pro2}){print OUT $_;}
	}
close IN;
close IN2;
close OUT;
