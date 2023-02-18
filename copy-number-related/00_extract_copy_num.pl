#!/usr/bin/perl -w
open COPY, "<CRR078361.copy.num";
open IN, "<$ARGV[0]";
open OUT, ">$ARGV[0].copy.num";
while(<COPY>){
	chomp;
	@line=split("\t", $_);
	$g=$line[0];
	$copy=$line[7];
	$hash{$g}=$copy;
	}
while(<IN>){
	@ar=split("\t", $_);
	$ar[8]=~/gene_id "(.+?)"/;
	$gene=$1;
	print OUT $hash{$gene}."\n";
	}
