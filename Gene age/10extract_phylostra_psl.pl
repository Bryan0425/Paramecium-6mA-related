#!/usr/bin/perl -w
open IN1, "<$ARGV[0]";  #tpm
open IN2, "<$ARGV[1]";  #phylostra
open OUT, ">$ARGV[2]";
while(<IN2>){
	chomp;
	@ar=split(";", $_);
	$pro=$ar[1];
	$psl=$ar[0];
	$hash{$pro}="psl$psl";
	#print "$hash{$pro}\n";
	}
while(<IN1>){
	@ar2=split("\t", $_);
	$gene=$ar2[0];
	#print "$hash{$gene}\n";
	#print $gene."\n";
	#print $hash{$gene}."\n";
	$ar2[1]=$hash{$gene};
	#print $ar[1]."\n";
	print OUT join("\t", @ar2);
	}
