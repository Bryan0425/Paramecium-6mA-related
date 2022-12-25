#!/usr/bin/perl -w
#This script used for find the motif for the modification result.
#Such as: GATC CATC GATG
#Sheng ya lan 20180315
#for GATC, foward and reverse are the same, total number is enough.
use strict;
my (@Result,$GATC,$CATC_foward,$CATC_reverse,$GATG_foward,$GATG_reverse,$CATG_foward,$CATG_reverse,$AATT_foward,$AATT_reverse,$TATA_foward,$TATA_reverse,$line);
open (IN1, "<", "$ARGV[0]")
		or die "Can't open IN1 : $!";
#open (OUT1, ">", "$ARGV[0]_non_dinuleotide_motif");
open (OUT2, ">", "$ARGV[0]_AT_all");
open (OUT3, ">", "$ARGV[0]_AA");
open (OUT4, ">", "$ARGV[0]_AC");
open (OUT5, ">", "$ARGV[0]_AG");
{
		@Result= <IN1>;
		close IN1;
}
foreach $line(@Result){
			if($line=~/context\=\w{20,20}AA\w{19,19}\;/){
			print OUT3"$line";
			$GATG_foward++;
			}elsif($line=~/context\=\w{20,20}AC\w{19,19}\;/){
			print OUT4"$line";
			$CATG_foward++;
			}elsif($line=~/context\=\w{20,20}AG\w{19,19}\;/){
			print OUT5"$line";
			$AATT_foward++;
			}elsif($line=~/context\=\w{20,20}AT\w{19,19}\;/){
                        print OUT2"$line";
                        $GATC++;
			}#else{
			#print OUT1 $line;
			#}
			}
print "AT all number: $GATC\nAA number: $GATG_foward\nAC number:$CATG_foward\nAG number: $AATT_foward\n";
