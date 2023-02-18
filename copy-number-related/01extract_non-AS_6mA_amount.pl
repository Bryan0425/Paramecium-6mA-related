#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #AS
open LIST, "<$ARGV[1]";  #total
open ALL, "<$ARGV[2]";  #6mA
open OUT, ">non-$ARGV[0].6mA.amount";
while(<IN>){
	chomp;
	$hash1{$_}=1;
	}
while(<LIST>){
        chomp;
        if($hash1{$_}){
		}else{
		$hash2{$_}=1;
		}
        }
while(<ALL>){
	@ar=split("\t", $_);
	$g=$ar[0];
	$a=$ar[1];
	$hash{$g}=$a;
	}
$k=@n=keys%hash2;
print $k."\n";
foreach $n (@n){
	#chomp;
	if($hash{$n}){
		print OUT "$n\t$hash{$n}\n";
		}else{
		print OUT "$n\t0\n";
		}
	}
