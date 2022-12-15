#!/usr/bin/perl -w
#This script used for analysis the 6mA location in the genome.
#Bo Pan 20191212
#perl perl.pl T_thermophila_June2014.gff3 6mA_Genic
use strict;
my (@Annotation,@Result,$line,$scf,$orientation,$zone,$start,$begin,$end,$exon_number,$five_UTR,$three_UTR,$intron,$n);
open (IN1, "<", "$ARGV[0]")
		or die "Can't open IN1 : $!";
open (IN2, "<", "$ARGV[1]")
		or die "Can't open IN2 : $!";
open (OUT1, ">", "$ARGV[1]_Exon");
open (OUT2, ">", "$ARGV[1]_Intron");
#open (OUT3, ">", "$ARGV[1]_5'UTR");
#open (OUT4, ">", "$ARGV[1]_3'UTR");
{
		@Annotation= <IN1>;
		close IN1;
		@Result= <IN2>;
		close IN2;
}
foreach $line(@Result){
			$line=~/(GWHAAFB\d+)\t(\d+?)\t/;
			$scf=$1;
			$start=$2;
			$n=0;
			foreach $_(@Annotation){
				if( $_=~ /$scf\t\w+\t(.+?)\t(\d+?)\t(\d+?)\t(.)\t/){
					$zone=$1;
					$begin=$2;
					$end=$3;
					
					if($begin<=$start && $start<=$end){
							if($zone eq "CDS"){print OUT1"$line";$exon_number++;$n++;last;}
							#elsif($zone eq "five_prime_UTR"){print OUT3"$line";$five_UTR++;$n++;last;}
							#elsif($zone eq "three_prime_UTR"){print OUT4"$line";$three_UTR++;$n++;last;}
							}
						}
				}
		if ($n==0){print OUT2"$line";$intron++};
			}
print "Exon number:$exon_number\n";
print "Intron number:$intron\n";
#print "5'UTR number:$five_UTR\n";
#print "3'UTR number:$three_UTR\n";
