#!/usr/bin/perl -w
#This script used for statistic the motif number in genome.
#Bo Pan 20200317
#use strict;
#my (@TTHERM,$sequence,@sequence,$TTHERM,$GATC,$CATC,$GATG,$n,$line,$line2,$m);
open (IN1, "<", "$ARGV[0]")
		or die "Can't open IN1 : $!";

{
		local $/=undef;
		$sequence= <IN1>;
		close IN1;
}
#$m=0;$n=0;
$sequence =~s/\n//sg;
$line0=$sequence;
$line4=$sequence;
foreach $_(0...50){
	$AA=($line0 =~ s/AA/AA/g);
	$TT=($line4 =~ s/TT/TT/g);
	$A=$AA+$TT;
	}
$line=$sequence;
$line2=$sequence;
$line3=$sequence;
foreach $_(0...50){
	$AT=($line =~ s/AT/AT/g);
	#$TA=($line =~ s/TA/TA/g);
	$B=$AT*2;
	}
foreach $_(0...50){
	$AC=($line2 =~ s/AC/AC/g);
	$GT=($line2 =~ s/GT/GT/g);  #genome forware strand
	$C=$AC+$GT;
	}
foreach $_(0...50){
        $AG=($line3 =~ s/AG/AG/g);
        $CT=($line3 =~ s/CT/CT/g);  #genome forware strand
        $D=$AG+$CT;
        }
$A=$A-405;  #id has AA characters 405
print "AA:$A\nAT:$B\nAC:$C\nAG:$D\n";
