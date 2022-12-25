#!/usr/bin/perl -w
open IN, "<$ARGV[0]";
open OUT, ">$ARGV[0]_context_for_motif";
$i=1;
while(<IN>){
	if($_=~/\w{15,15}(\w{5,5}A\w{6,6})\w{14,14}/){
		$context=$1;
		print OUT $context."\n";
		}
	}
