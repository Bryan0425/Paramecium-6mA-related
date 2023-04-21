#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #HGT
open IN2, "<$ARGV[1]";  #total
open OUT, ">$ARGV[0].pslevel";
while(<IN2>){
	@ar=split("\t", $_);
	$gene=$ar[0];
	$psl=$ar[1];
	$hash{$gene}=$psl;
	}
while(<IN>){
	chomp;
	$pro=$_;
	print OUT $pro."\t".$hash{$pro}."\n";
	}
