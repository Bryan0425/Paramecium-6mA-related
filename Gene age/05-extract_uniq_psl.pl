#!/usr/bin/perl -w
open IN1, "<$ARGV[0]";
open IN2, "<$ARGV[1]";
open OUT, ">$ARGV[1]_uniq";
while(<IN1>){
	chomp;
	$pro=$_;
	$hash{$pro}=1;
	}
while(<IN2>){
	chomp;
	$pro=$_;
	if($hash{$pro}){}
	else{print OUT "$pro\n";}
	}
close IN1;
close IN2;
close OUT;
