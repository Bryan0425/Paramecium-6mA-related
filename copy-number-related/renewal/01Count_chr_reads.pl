#!/usr/bin/perl -w
##This scripts used for count reads number for each chromosomes.
##Usage: perl perl.pl DNA.bed
use strict;
my (@bed,$chr,@keys,$sequence,%reads);
open (IN1, "<", "$ARGV[0]")
		or die "Can't open IN1 : $!";
open (OUT1, ">", "$ARGV[0]_reads");
{

		@bed= <IN1>;
		close IN1;
}
foreach $sequence(@bed){
		$sequence=~/(\w+\d+)\t.+?\n/;
		$chr=$1;
		if (exists $reads{$chr}){
			$reads{$chr}++;}
			else{$reads{$chr}=1;}
	}

@keys= keys(%reads);
foreach $_(@keys){
		if (exists $reads{$_}){
			print OUT1"$_\t$reads{$_}\n";}
		else {print OUT1"$_\t0\n";}
	}

