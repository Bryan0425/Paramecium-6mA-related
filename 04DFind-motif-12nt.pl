#!/usr/bin/perl -w
# output context to find motif by weblogo3
# 20191029 version like Beh
open IN, "<$ARGV[0]";  #6mA_info file
open OUT, ">$ARGV[0]_context_12nt_for_motif";
while(<IN>){
	if($_ =~ /(\w{15,15})(\w{5,5}A\w{6,6})(\w{14,14})/){
		$context = $2;
		print OUT "$context\n";
	}
} 
close IN;
close OUT;
