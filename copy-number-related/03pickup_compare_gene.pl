#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #IR
open IN2, "<$ARGV[1]";  #Normal 
open OUT, ">$ARGV[2]";
while(<IN>){
	chomp;
	$hash{$_}=1;
	}
while(<IN2>){
	chomp;
	if($hash{$_}){
		print OUT "$_\n";
		}
	}
