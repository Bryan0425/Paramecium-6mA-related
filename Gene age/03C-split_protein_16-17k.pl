#!/usr/bin/perl -w
open IN, "<$ARGV[0]";
#open OUT1, ">$ARGV[0]_1k-5k";
open OUT2, ">$ARGV[0]_17k0";
#open OUT3, ">$ARGV[0]_17k2";
while(<IN>){
	if($_=~/^>(\d+)\n/){
		$id=$1;
		}else{
		$fasta{$id}.=$_;
		}
	}
foreach $a (16591..17000){
	if ($a<=16590){}#print OUT2 ">$a\n$fasta{$a}"}
	elsif ($a<=17000){print OUT2 ">$a\n$fasta{$a}"}
	#elsif ($a<=17825){print OUT3 ">$a\n$fasta{$a}"}
	}
close IN;
#close OUT1;
close OUT2;
#close OUT3;
