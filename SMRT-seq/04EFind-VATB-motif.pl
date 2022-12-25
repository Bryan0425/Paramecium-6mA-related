#!/usr/bin/perl -w
# output context to find motif by weblogo3
# 20191029 version like Beh
open IN, "<$ARGV[0]";  #6mA_info file
open OUT, ">$ARGV[0]_context_for_VATB_motif";
$i=0;
while(<IN>){
	if($_ =~ /(\w{19,19}[G|A|C]AT[G|T|C]\w{18,18})/){
		$context = $1;
		print OUT "$context\n";
		$i++;
	}
} 
print $i."\n";
close IN;
close OUT;
