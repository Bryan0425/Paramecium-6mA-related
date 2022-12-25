#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #AS
open IN2, "<$ARGV[1]";  #file
open OUT, ">$ARGV[1]_type";
while(<IN>){
	chomp;
	if($_=~/(g.+?)\t/){
		$gene=$1;
		$hash{$gene}=1;
		}
	}
while(<IN2>){
	chomp;
	@ar=split("\t", $_);
	$g=$ar[0];
	if($hash{$g}){
		print OUT "$_\tAS\n";
		}else{
		print OUT "$_\tNA\n";
		}
	}
