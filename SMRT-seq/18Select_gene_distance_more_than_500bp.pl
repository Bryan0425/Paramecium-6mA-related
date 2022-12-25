#!/usr/bin/perl -w
open IN, "<$ARGV[0]";
open OUT, ">$ARGV[1]";
while(<IN>){
	if ($_=~/(.+?)\t.+?\tgene\t(\d+)\t(\d+)\t.+?\t(.)/){
        $oritation=$4;
	$chr=$1;
        if ($oritation eq "+"){
		$TSS=$2;$TES=$3;
		if($last_chr eq $chr){
		if($last_o eq "+"){
		$distance=$TSS-$last_TES;
		#print OUT $distance."\t"."A"."\n";
		if($distance>500){print OUT $_;}
		}elsif($last_o eq "-"){
		$distance=$TSS-$last_TSS;
		#print OUT $distance."\t"."B"."\n";
		if($distance>500){print OUT $_;}
		}
		}else{
		print OUT $_;
		}
        }elsif ($oritation eq "-"){
		$TSS=$3;$TES=$2;
		if($last_chr eq $chr){
		if($last_o eq "+"){
		$distance=$TES-$last_TES;
		#print OUT $distance."\t"."C"."\n";
		if($distance>500){print OUT $_;}
		}elsif($last_o eq "-"){
		$distance=$TES-$last_TSS;
		#print OUT $distance."\t"."D"."\n";
		if($distance>500){print OUT $_;}
		}
		}else{
		print OUT $_;
		}
	}
	$last_o=$oritation;
	$last_TSS=$TSS;
	$last_TES=$TES;
	$last_chr=$chr;


	#@ar=split("\t",$_);
	#$start=$ar[3];
	#$end=$ar[4];
	#$first=$start;
	#$distance=$first-$second;
	#$second=$end;
	#undef $first;
	#print OUT $distance."\n";	
	}	
}
