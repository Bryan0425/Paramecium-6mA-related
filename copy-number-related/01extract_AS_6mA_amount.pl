#!/usr/bin/perl -w
open IN, "<$ARGV[0]";
open ALL, "<$ARGV[1]";
open OUT, ">$ARGV[0].6mA.amount";
while(<ALL>){
	@ar=split("\t", $_);
	$g=$ar[0];
	$a=$ar[1];
	$hash{$g}=$a;
	}
while(<IN>){
	chomp;
	if($hash{$_}){
		print OUT "$_\t$hash{$_}\n";
		}else{
		print OUT "$_\t0\n";
		}
	}
