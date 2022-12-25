#!/usr/bin/perl -w
open IN, "<$ARGV[0]";
open IN2, "<$ARGV[1]";
while(<IN>){
	$_=~/^>(.+?)\s+?/;
	$id=$1;
	$hash{$id}=1;
	}
while(<IN2>){
	chomp;
	$ID=$_;
	if($hash{$ID}){}else{print $ID."\n";}
	}
