#!/usr/bin/perl -w
use strict;
my (@Result,$sequence,$line,$symmetric,$asymmetric,$else_number,$n,@AT,$symmetric_number,$asymmetric_number,$name,$scafford,$start,$begin,%hash);
open (IN1, "<", "$ARGV[0]")
		or die "Can't open IN1 : $!";
open (OUT1, ">", "$ARGV[0]_else");
open (OUT2, ">", "$ARGV[0]_symmetric");
open (OUT3, ">", "$ARGV[0]_asymmetric");

{
		@Result= <IN1>;
		close IN1;
}
$symmetric_number=0;
$asymmetric_number=0;
$else_number=0;
foreach $sequence(@Result){
		if ($sequence=~/m6A\t(\d+?)\t(\d+?)\t(\d+?)\t(.)\t(.)\t.+?context\=\w{20,20}AT\w{19,19}\;/){
			push @AT,$sequence;}
			elsif($sequence=~/m6A\t(\d+?)\t(\d+?)\t(\d+?)\t(.)\t(.)\t.+?context\=\w+/){
			print OUT1"$sequence";$else_number++;
			}
	}
foreach $line(@AT){
		if ($line=~/(.+\d+)\t.+?m6A\t(\d+?)\t/){
			$scafford=$1;
			$start=$2;
			$name="$scafford\t$start";
			$hash{$name}=1;
		}
		}
foreach $line(@AT){
		if ($line=~/(.+\d+)\t.+?m6A\t(\d+?)\t(\d+?)\t(\d+?)\t(\+)\t/){
			$scafford=$1;
			$start=$2;
			$begin=$start+1;
			$name="$scafford\t$begin";
			if (exists $hash{$name}){print OUT2"$line";$symmetric_number++;}
			else{print OUT3 "$line";$line="";$asymmetric_number++;}
		}
		elsif ($line=~/(.+\d+)\t.+?m6A\t(\d+?)\t(\d+?)\t(\d+?)\t(\-)\t/){
			$scafford=$1;
			$start=$2;
			$begin=$start-1;
			$name="$scafford\t$begin";
			if (exists $hash{$name}){print OUT2"$line";$symmetric_number++;}
			else{print OUT3 "$line";$line="";$asymmetric_number++;}
		}
	}
print "symmetric number:$symmetric_number\nasymmetric number:$asymmetric_number\nelse number:$else_number\n";
