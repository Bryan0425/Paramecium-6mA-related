#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #rrnascan file
open OUT, ">$ARGV[1]";  #rrna location

while(<IN>){
	next if  ($_ =~ /^#/);
	@line = split ("\t", $_);
	$scf = $line[0];
	$begin = $line[3];
	$end = $line[4];
	$strand = $line[6];
	print OUT "$scf\t$begin\t$end\t$strand\n";
	}

close IN;
close OUT;
