#!/usr/bin/perl -w
open IN1, "<$ARGV[0]";  #all
open IN2, "<$ARGV[1]";  #methylated
open OUT, ">$ARGV[2]";
while(<IN2>){
	chomp;
	#$_=~/g(.*)/;
	$a=$_;
	$hash{$a}=1;
	}
while(<IN1>){
	chomp;
	$a=$_;
	if($hash{$a}){
		}else{
		print OUT $a."\n";
		}
	}

