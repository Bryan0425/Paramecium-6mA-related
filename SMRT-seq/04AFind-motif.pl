#!/usr/bin/perl -w
# output context to find motif by weblogo3
# 20190309 version
open IN, "<$ARGV[0]";  #6mA_info file
open OUT, ">$ARGV[0]_context_for_motif";
$i=1;
while(<IN>){
	if($_ =~ /(\w{20,20}A\w{20,20})/){
		$context = $1;
		print OUT ">$i\n$context\n";
		$i++;
	}
} 
close IN;
close OUT;
