#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #all info
open LIST, "<$ARGV[1]";
open  OUT1, ">$ARGV[1].6mA.copy.number";
open OUT2, ">$ARGV[1].else.6mA.copy.number";
while(<LIST>){
	chomp;
	$gene=$_;
	$hash{$gene}=1;
	}
while(<IN>){
	@ar=split("\t", $_);
	$g=$ar[0];
	if($hash{$g}){
		print OUT1 "$_";
		}else{
		print OUT2 "$_";
		}
	}
