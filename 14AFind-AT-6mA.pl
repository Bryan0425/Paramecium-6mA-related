#!/usr/bin/perl -w
# output context to find motif by weblogo3
# 20191029 version like Beh
open IN, "<$ARGV[0]";  #6mA_info file
open OUT, ">$ARGV[0]_AT";
while(<IN>){
	if($_ =~ /(\w{20,20})AT(\w{19,19})/){
	
		print OUT "$_";
	}
} 
close IN;
close OUT;
