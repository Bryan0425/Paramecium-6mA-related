#!/usr/bin/perl -w
#This script used for find the methylation level of each gene.
#Sheng ya lan 20180312
#usage: perl 09Find_methylation_gene.pl 6mA.gff T_thermophila_June2014.gff3_Gene
use strict;
my (@m6A,@GFF_gene,$line,$location,$scf,%hash_gene,$start,$end,$TTHERM,@all_keys,$all,$frac,%hash_methylation,$mean,$test);
open (IN1, "<", "$ARGV[0]")
		or die "Can't open IN1 : $!";
open (IN2, "<", "$ARGV[1]")
		or die "Can't open IN2 : $!";
open (OUT1, ">", "$ARGV[0]_gene_methylation");
{
		@m6A= <IN1>;
		close IN1;
}
{
		@GFF_gene= <IN2>;
		close IN2;
}
$frac=0;
foreach $line(@m6A){
		$line=~/(\w+\d+)\t.+?m6A\t(\d+?)\t.+?;frac=(.+?);.+?\n/;
			$scf=$1;
			$location=$2;
			$frac=$3;
			foreach $_ (@GFF_gene){
				if ($_=~/$scf\t.+?gene\t(\d+?)\t(\d+?)\t.+?(g\d+)\n/){
					$start=$1;
					$start=$start-1;
					$end=$2;
					$end=$end+1;
					$TTHERM=$3;
					if ($location<$end && $location>$start){
							$hash_gene{$TTHERM}++;
							$hash_methylation{$TTHERM}+=$frac;
							}
					
				}
				}
			
	}
@all_keys= keys%hash_gene;
$all=0;
foreach $_(@all_keys){
	$all=$all+$hash_gene{$_};
	$mean=$hash_methylation{$_}/$hash_gene{$_};
	print OUT1"$_\t$hash_gene{$_}\t$hash_methylation{$_}\t$mean\n";
	}
print "All modifications in gene:$all\n";
