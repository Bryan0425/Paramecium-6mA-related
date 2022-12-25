#!/usr/bin/perl -w
open IN, "<$ARGV[0]";
open OUT, ">$ARGV[0]_AT_content";
while(<IN>){
	if($_=~/>/){
		}else{
		$count_A=$count_A+($_=~tr/A//); 
		$count_T=$count_T+($_=~tr/T//); 
		$count_G=$count_G+($_=~tr/G//); 
		$count_C=$count_C+($_=~tr/C//);
		$total=$count_A+$count_T+$count_G+$count_C;
		$GC=($count_G+$count_C)/$total;
		$AT=($count_A+$count_T)/$total;
		$AT_content=$count_A+$count_T;
		}
	}
print OUT "total count is $total \nGC is $GC\nAT is $AT\nAT total number is $AT_content\n";
