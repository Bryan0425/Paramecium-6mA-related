#!/usr/bin/perl -w
#This scripts used for analysis the 6mA in the genome,compare with genes.(Density, DO NOT combine with methylation level)
#Usage: perl 22ARelative_distance_1kb_gene_body.pl mRNA_well_modeled_Jie_1kb_up.gff3 m6A.gff
use strict;
my (@GFF,@m6A,$anotation,$chr,$location,$level,$five,$three,$number,@temp,$sequence,$gene_length,$test,$temp,$ori,$N1,$N2,$bin_size,%bin_number,@keys);
open (IN1, "<", "$ARGV[0]")
		or die "Can't open IN1 : $!";
open (IN2, "<", "$ARGV[1]")
		or die "Can't open IN2 : $!";
open (OUT1, ">", "$ARGV[1]_bin_distribution");
{
		@GFF= <IN1>;
		close IN1;
		@m6A= <IN2>;
		close IN2;
}
foreach $sequence(@m6A){
		$sequence=~/(.+?)\t.+?m6A\t(\d+?)\t.+?frac=(.+?);/;
		$chr=$1;
		$location=$2;
		$level=$3;
		$test=0;
		foreach $anotation(@GFF){
			$temp=$test;
			if($anotation=~/($chr)\t.+?\t(\d+?)\t(\d+?)\t(.+?)\t(.)\t.+?\n/){
			$ori=$5;
			$gene_length=$3-$2;
			$five=$2-$gene_length;
			$three=$3+$gene_length;
			$bin_size=$gene_length/20;
			if ($location>=$five && $location <= $three){
				$test++;
				if ($ori eq "+"){
				$number=int(($location-$five)/$bin_size);
				if ($number == 60){$number=59;}
				$bin_number{$number}=$bin_number{$number}+1;}
				elsif($ori eq "-") {
				$number=int(($three-$location)/$bin_size);
				if ($number == 60){$number=59;}
				$bin_number{$number}=$bin_number{$number}+1;} 
				}
			}
			if ($test>0 && $test == $temp){last;}
			}
	}
@keys= sort {$a <=> $b}  keys(%bin_number);
foreach $_(@keys){
		if (exists $bin_number{$_}){
			print OUT1"$_\t$bin_number{$_}\n";}
		else {print OUT1"$_\t0\n";}
		$_++;
	}

