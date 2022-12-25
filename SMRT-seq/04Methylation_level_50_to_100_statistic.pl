#!/usr/bin/perl -w
open IN,"<$ARGV[0]";
open OUT, ">$ARGV[0]_methylation_level_50_to_100_statistic";
while(<IN>){
$_ =~ /coverage\=(\d+);(.+)frac\=(\d.\d+);identificationQv\=(\d+)/;
$frac=$3;
$fracv=$frac*100;

#foreach $methylation (50..100){
#	if($fracv==$methylation){
		$hash{$fracv}++;
		#last;
	}
#}
#}
foreach $num (50..100){
	print OUT $num."%\t".$hash{$num}."\n"
}
close IN;
close OUT;
