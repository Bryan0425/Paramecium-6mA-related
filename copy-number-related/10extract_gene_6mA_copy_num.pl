#!/usr/bin/perl -w
open IN1, "<$ARGV[0]";  #6mA ratio
open IN2, "<$ARGV[1]";  #copy
open OUT, ">Pb_all_gene_6mA_ratio_copy_number";
while(<IN1>){
	chomp;
	@ar=split("\t", $_);
	$gene=$ar[0];
	$m6A=$ar[1];
	$hash{$gene}=$m6A;
	}
while(<IN2>){
	chomp;
	@line=split("\t", $_);
	$g=$line[0];
	$copy=$line[7];
	if($hash{$g}){
		print OUT "$g\t$hash{$g}\t$copy\n";
		}else{
		print OUT "$g\t0\t$copy\n";
		}
	}

