#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #expression
open IN2, "<$ARGV[1]";  #HGT
open OUT, ">$ARGV[1].expression";
open OUT2, ">$ARGV[0].expression";
while(<IN2>){
	chomp;
	$HGT="g".$_;
	$hash{$HGT}=1;
	}
while(<IN>){
	@ar=split("\t", $_);
	if($hash{$ar[0]}){print OUT $_;}
	else{print OUT2 $_;}
	}
