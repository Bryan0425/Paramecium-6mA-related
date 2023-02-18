#!/usr/bin/perl =w
open IN, "<$ARGV[0]";
open OUT, ">$ARGV[1]";
while(<IN>){
	chomp;
	$g="g$_";
	print OUT "$g\n";
	}
