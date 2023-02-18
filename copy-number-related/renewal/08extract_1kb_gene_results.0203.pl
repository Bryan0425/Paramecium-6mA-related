#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #GENE LIST
open IN2, "<$ARGV[1]";
open OUT, ">$ARGV[1].1kb.0203";
while(<IN>){
	chomp;
	$hash{$_}=1;
	}
while(<IN2>){
	@ar=split("\t", $_);
	$gene=$ar[0];
	if($hash{$gene}){
		print OUT $_;
		}
	}
