#!/usr/bin/perl -w
open IN, "<$ARGV[0]";
open OUT1, ">$ARGV[0]_1k-5k";
open OUT2, ">$ARGV[0]_5k-10k";
open OUT3, ">$ARGV[0]_10k-17k";
while(<IN>){
	if($_=~/^>(\d+)\n/){
		$id=$1;
		}else{
		$fasta{$id}.=$_;
		}
	}
foreach $a (24..17825){
	if ($a<=5000){print OUT1 ">$a\n$fasta{$a}"}
	elsif ($a<=10000){print OUT2 ">$a\n$fasta{$a}"}
	elsif ($a<=17825){print OUT3 ">$a\n$fasta{$a}"}
	}
close IN;
close OUT1;
close OUT2;
close OUT3;
