#!/usr/bin/perl -w
#This script used for count the symmetric for the modification result.
#Bo Pan 20191210
use strict;
my (@Result,$sequence,$line,$total,$symmetric,$asymmetric,$else_number,$start,$n,$scafford,%hash,$keys,$begin,$frac1,$frac2,$frac3,$frac4);
open (IN1, "<", "$ARGV[0]")
		or die "Can't open IN1 : $!";
open (OUT, ">", "$ARGV[0]_methylation_level_between_Watson_and_Crick_strand");
#open (OUT2, ">", "$ARGV[0]_asymmetric");
{
		@Result= <IN1>;
		close IN1;
}
$symmetric=0;
$asymmetric=0;
foreach $line(@Result){
		if ($line=~/(GWHAAFB\d+)\t.+?m6A\t(\d+)\t\d+?\t\d+?\t(.)\t.+?frac=(\d.\d+?);/){
			$scafford=$1;
			$start=$2;
			$begin=$start+1;
			$keys=0;
			$frac1=$4;
			foreach $_(@Result){
				if ($_=~/$scafford\t.+?m6A\t$begin\t\d+?\t\d+?\t(\-)\t.+?frac=(\d.\d+?);/){
				#print OUT1"$line";  #s
				$frac2=$2;
				print OUT "$frac1\t$frac2\n";
				$line="";
				#print OUT1"$_";
				$_="";
				#$symmetric=$symmetric+2;
				$keys++;
				last;
				}
			}
		if ($keys ==0){  #no match
		#print OUT2 "$line";
		if($line=~/(GWHAAFB\d+)\t.+?m6A\t(\d+)\t\d+?\t\d+?\t(\+)\t.+?frac=(\d.\d+?);/){
				$frac3=$4;
				print OUT "$frac3\t0\n";
			}elsif($line=~/(GWHAAFB\d+)\t.+?m6A\t(\d+)\t\d+?\t\d+?\t(\-)\t.+?frac=(\d.\d+?);/){
				$frac4=$4;
				print OUT "0\t$frac4\n";}
		$line="";
		#$asymmetric++;
			}
		}
	}
#print "symmetric:$symmetric\nasymmetric:$asymmetric\n";

