#!/usr/bin/perl -w
open IN, "<$ARGV[0]";  #trnascan file
open OUT, ">$ARGV[1]";  #trna location

while(<IN>){
	next if not ($_ =~ /GWHAAFB/);
	@line = split ("\t", $_);
	$scf = $line[0];
	$begin = $line[2];
	$end = $line[3];
	if($begin < $end){
	print OUT "$scf\t$begin\t$end\t+\n";
	}else{
	print OUT "$scf\t$end\t$begin\t-\n";
	}
	}

close IN;
close OUT;
