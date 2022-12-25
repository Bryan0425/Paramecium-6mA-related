#!/usr/bin/perl -w
open IN1, "<$ARGV[0]";  #gene list
open IN2, "<$ARGV[1]";  #methylation
open OUT, ">$ARGV[0].6mA";  
while(<IN2>){
	chomp;
	@ar=split("\t", $_);
	$ar[0]=~/g(.+)/;
	$gene=$1;
	$num=$ar[1];
	$sigma=$ar[2];
	$average=$ar[3];
	$hash{$gene}=$num."\t".$sigma."\t".$average."\n";
	}
while(<IN1>){
	chomp;
	$a=$_;
	if($hash{$a}){print OUT $a."\t".$hash{$a};}
	else{print OUT $a."\t0\t0\t0\n";}
	}
close IN1;
close IN2;
close OUT;
