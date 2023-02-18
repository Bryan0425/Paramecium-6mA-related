#!/usr/bin/perl -w
open SAM, "<$ARGV[0]";  #sam
open READ, "<$ARGV[1]";  #copy number
open OUT, ">$ARGV[1]_with_lengh";
while(<SAM>){  #@SQ     SN:GWHAAFB00000002      LN:266355
	if($_=~/SN:(\w+\d+)\tLN:(\d+)\n/){
		$chr=$1;
		$len=$2;
		$hash{$chr}=$len;
		}
	
}
print OUT "chr\treads_number\tchr_length\n";
while(<READ>){
	chomp;
	@ar=split("\t",$_);
	$scf=$ar[0];
	$read=$ar[1];
	if($hash{$scf}){
		print OUT $scf."\t".$read."\t".$hash{$scf}."\n";
		}
}
close SAM;
close READ;
close OUT;

