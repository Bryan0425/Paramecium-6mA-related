#!/usr/bin/perl -w
#This script used for find whether there are Pol I or Pol III gene in 6mA results.
#Sheng ya lan 20181004
#perl perl.pl 6mA Pol_gene_list
use strict;
my (@m6A,@Pol_I,@Pol_III,$line,$scf,$start,$begin,$end,$strand,$ori);
open (IN1, "<", "$ARGV[0]")  #6mA_info
		or die "Can't open IN1 : $!";
open (IN2, "<", "$ARGV[1]")  #polI genes
		or die "Can't open IN2 : $!";
open (IN3, "<", "$ARGV[2]")  #polIII genes
		or die "Can't open IN3 : $!";
open (OUT1, ">", "$ARGV[0]_Pol_I_Gene");
open (OUT2, ">", "$ARGV[0]_Pol_III_Gene");
open (OUT3, ">", "$ARGV[0]_Pol_II_Gene");

{
		@m6A= <IN1>;
		close IN1;
		@Pol_I= <IN2>;
		close IN2;
		@Pol_III= <IN3>;
		close IN3;
}
foreach $line(@m6A){
			$line=~/(GWHAAFB\d+)\t.+?\tm6A\t(\d+)\t(\d+)\t(\d+)\t(.+?)\t/;
			$scf=$1;
			$start=$2;
			#$strand=$5;
			foreach $_(@Pol_I){
				if( $_=~ /$scf\t(\d+?)\t(\d+?)\t(.+?)\n/){
					$begin=$1;
					$end=$2;
					#$ori=$3;
					if(($begin<=$start) && ($start<=$end)){
							print OUT1"$line";
							$line="";
							}
						}
				}
			foreach $_(@Pol_III){
				if( $_=~ /$scf\t(\d+?)\t(\d+?)\t(.+?)\n/){
					#$ori=$3;
					$begin=$1;
					$end=$2;
					if(($begin<=$start) && ($start<=$end)){
							print OUT2"$line";
							$line="";
							}
						}
				}
			}
foreach $_(@m6A){
	print OUT3"$_";
	}
