#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #6mA amount
open IN2, "<$ARGV[1]";  #copy
open OUT, ">$ARGV[0].copy.number";
while(<IN>){
	chomp;
	@ar=split("\t", $_);
	$gene=$ar[0];
	$m6A=$ar[1];
	$hash{$gene}=1;
	$hash_v{$gene}=$m6A;
	}
while(<IN2>){
	chomp;
	@ar2=split("\t", $_);
	$g=$ar2[0];
	$copy=$ar2[7];
	if($hash{$g}){
		print OUT "$g\t$hash_v{$g}\t$copy\n";
		}else{
		#$hash{$g}=0;
		}
	#print OUT "$g\t$hash{$g}\t$copy\n";
	}
