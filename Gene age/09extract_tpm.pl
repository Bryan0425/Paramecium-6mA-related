#!/usr/bin/perl -w
open IN1, "<$ARGV[0]";
open IN2, "<$ARGV[1]";  #tpm
open OUT, ">$ARGV[0].tpm";
while(<IN2>){
	chomp;
	@ar=split("\t", $_);
	#if($ar[0]=~/g(.+)/){
	$gene=$ar[0];
	#undef $1;
	#$ar[6]=~/(.+)[\t\r\n\s]/;
	$tpm=$ar[1];
	#print $tpm."\n";
	$hash{$gene}=$tpm;
	}
#}
while(<IN1>){
	chomp;
	@ar=split("\t", $_);
	$pro=$ar[0];
	$g="g$pro";
	#if($hash{$pro}){
	print OUT "$ar[0]\t$ar[1]\t$ar[2]\t$ar[3]\t$ar[4]\t$hash{$g}\n";
#	}
}
