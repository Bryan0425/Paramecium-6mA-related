#!/usr/bin/perl -w
#This script used for generate the bed file for 6mA gff
#Sheng ya lan 20180927
#usage: perl 12AGenerate_BED.pl 6mA.gff
use strict;
my (@m6A,@FPKM,$line,$location,$scf,$number,$ori);
open (IN1, "<", "$ARGV[0]")
		or die "Can't open IN1 : $!";
open (OUT1, ">", "$ARGV[0]_bed");
{
		@m6A= <IN1>;
		close IN1;
}
foreach $line(@m6A){
		$line=~/(GWHAAFB\d+)\t.+?m6A\t(\d+)\t(\d+)\t(\d+)\t(.)\t/;
			$scf=$1;
			$number=$2;
			$ori=$5;
			print OUT1"$scf\t$number\t$number\t.\t.\t$ori\n";
	}
